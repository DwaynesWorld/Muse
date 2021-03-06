//
//  ProjectRepository.swift
//  Muse
//
//  Created by Kyle Thompson on 6/28/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation
import Combine
import FirebaseFirestore
import Resolver

class BaseProjectRepository: BaseRepository {
  @Published var projects: [Project] = []
}

protocol ProjectRepository: BaseProjectRepository {
  func getAll() -> [Project]
  func getBy(id: String) -> Project?
  func create(_ project: inout Project) throws
  func update(_ project: inout Project) throws
  func delete(id: String)
}

class FirestoreProjectRepository: BaseProjectRepository, ProjectRepository {
  @Injected var userRepository: UserRepository
  
  lazy private var collection = Firestore.firestore().collection("projects")
  private var teamId: String?
  
  override init() {
    super.init()
    
    userRepository.$user
      .compactMap { $0?.currentTeamId }
      .assign(to: \.teamId, on: self)
      .store(in: &cancellables)
    
    userRepository.$user
      .receive(on: DispatchQueue.main)
      .sink { _ in self.load() }
      .store(in: &cancellables)
  }
  
  private func load() {
    guard let teamId = self.teamId else { return }
    
    collection.whereField("teamId", isEqualTo: teamId)
      .order(by: "createdTime", descending: true)
      .addSnapshotListener { (snapshot, error) in
        if let error = error  {
          print(error.localizedDescription)
          return
        }
        
        guard let snapshot = snapshot else {
          fatalError("Invalid snapshot listener result.")
        }
        
        self.projects = snapshot.documents.compactMap {
          try? $0.data(as: Project.self)
        }
    }
  }
  
  func getAll() -> [Project] {
    self.projects
  }
  
  func getBy(id: String) -> Project? {
    self.projects.first { $0.id == id }
  }
  
  func create(_ project: inout Project) throws {
    guard let teamId = self.teamId else {
      print("Required field is nil: teamId")
      return
    }

    guard project.id == nil else {
      print("Project Id field has been initialized")
      return
    }
    
    let ref = collection.document()
    
    project.id = ref.documentID
    project.teamId = teamId
    
    try ref.setData(from: project)
  }
  
  func update(_ project: inout Project) throws {
    guard let teamId = self.teamId else {
      print("Required field is nil: teamId")
      return
    }
    
    guard let id = project.id else {
      print("Required field is nil: id")
      return
    }
    
    project.teamId = teamId
    
    try collection.document(id).setData(from: project)
  }
  
  func delete(id: String) {
    collection.document(id).delete()
  }
}

