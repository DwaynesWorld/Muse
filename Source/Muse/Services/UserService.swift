//
//  UserService.swift
//  Muse
//
//  Created by Kyle Thompson on 6/28/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation
import Combine
import FirebaseFirestore

class BaseUserService {
  @Published var user: MuseUser?
}

protocol UserService: BaseUserService {
  func create(_ user: MuseUser)
  func update(_ user: MuseUser)
}

class FirestoreUserService: BaseUserService, UserService, ObservableObject  {
  @Injected var authenticationService: AuthenticationService
  
  lazy private var collection = Firestore.firestore().collection("users")
  private var cancellables = Set<AnyCancellable>()
  private var userId: String?
  
  override init() {
    super.init()
    
    authenticationService.$user
      .compactMap { $0?.uid }
      .assign(to: \.userId, on: self)
      .store(in: &cancellables)
    
    authenticationService.$user
      .receive(on: DispatchQueue.main)
      .sink { _ in self.load() }
      .store(in: &cancellables)
  }
  
  func create(_ user: MuseUser) throws {
    guard user.id == nil else { return }
    
    try collection.document().setData(from: user)
  }
  
  func update(_ user: MuseUser) throws {
    guard let id = user.id else { return }
    
    try collection.document(id).setData(from: user)
  }
  
  private func load() {
    guard let userId = self.userId else { return }
    
    collection.whereField("userId", isEqualTo: userId)
      .addSnapshotListener { (snapshot, error) in
        if let error = error  {
          print(error.localizedDescription)
          return
        }
        
        guard let snapshot = snapshot else {
          fatalError("Invalid snapshot listener result.")
        }
        
        self.user = snapshot.documents.compactMap { document -> MuseUser? in
          try? document.data(as: MuseUser.self)
        }.first
    }
  }
}


