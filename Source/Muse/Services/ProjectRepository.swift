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

class BaseProjectService {
  @Published var projects = [Project]()
}

protocol ProjectService: BaseProjectService {
  func getAll() -> [Project]
  func getBy(id: String) -> Project?
  func add(_ project: Project)
  func update(_ project: Project)
  func delete(id: String)
}

class FirestoreProjectService: BaseProjectService, ProjectService, ObservableObject {
  @Injected var userService: UserService
  
  lazy private var collection = Firestore.firestore().collection("projects")
  private var cancellables = Set<AnyCancellable>()
  private var teamId: String?
  
  override init() {
    super.init()
    
    userService.$user
      .compactMap { $0?.currentTeamId }
      .assign(to: \.teamId, on: self)
      .store(in: &cancellables)
    
    userService.$user
      .receive(on: DispatchQueue.main)
      .sink { _ in self.load() }
      .store(in: &cancellables)
  }
  
  private func load() {
    guard let teamId = self.teamId else { return }
    
    collection.whereField("teamId", isEqualTo: teamId)
      .order(by: "createdTime")
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
  
  func add(_ project: inout Project) throws {
    guard let teamId = self.teamId else { return }
  
    project.teamId = teamId
    
    try collection.document().setData(from: project)
  }
  
  func update(_ project: Project) throws {
    
  }
  
  func delete(id: String) {
    
  }
}

