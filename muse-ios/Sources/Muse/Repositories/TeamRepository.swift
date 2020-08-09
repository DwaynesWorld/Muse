//
//  TeamRepository.swift
//  Muse
//
//  Created by Kyle Thompson on 7/8/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation
import Combine
import FirebaseFirestore
import Resolver

class BaseTeamRepository: BaseRepository {
  @Published var teams: [Team] = []
}

protocol TeamRepository: BaseTeamRepository {
  func getAll() -> [Team]
  func getBy(id: String) -> Team?
  func create(_ team: inout Team) throws
  func update(_ team: inout Team) throws
  func delete(id: String)
}

class FirestoreTeamRepository: BaseTeamRepository, TeamRepository  {
  @Injected var userRepository: UserRepository
  
  lazy private var collection = Firestore.firestore().collection("teams")
  private var userId: String?
  
  override init() {
    super.init()
    
    userRepository.$user
      .compactMap { $0?.userId }
      .assign(to: \.userId, on: self)
      .store(in: &cancellables)
    
    userRepository.$user
      .receive(on: DispatchQueue.main)
      .sink { _ in self.load() }
      .store(in: &cancellables)
  }
  
  func getBy(id: String) -> Team? {
    self.teams.first { $0.id == id }
  }
  
  func getAll() -> [Team] {
    self.teams
  }
  
  func create(_ team: inout Team) throws {
    guard team.id == nil else { return }
    
    let ref = collection.document()
    team.id = ref.documentID
    try ref.setData(from: team)
  }
  
  func update(_ team: inout Team) throws {
    guard let id = team.id else { return }

    try collection.document(id).setData(from: team)
  }
  
  func delete(id: String) {
    collection.document(id).delete()
  }
  
  private func load() {
    guard let userId = self.userId else { return }
    
    collection.whereField("members", arrayContains: userId)
      .order(by: "createdTime")
      .addSnapshotListener { (snapshot, error) in
        if let error = error  {
          print(error.localizedDescription)
          return
        }
        
        guard let snapshot = snapshot else {
          fatalError("Invalid snapshot listener result.")
        }
        
        self.teams = snapshot.documents.compactMap {
          try? $0.data(as: Team.self)
        }
    }
  }
}



