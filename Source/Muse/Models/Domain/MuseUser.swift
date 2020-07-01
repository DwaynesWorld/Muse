//
//  MuseUser.swift
//  Muse
//
//  Created by Kyle Thompson on 6/28/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct MuseUser: Codable, Identifiable {
  @DocumentID var id: String?
  @ServerTimestamp var createdTime: Timestamp?
  
  var userId: String
  var email: String
  var firstName: String
  var lastName: String
  var avatar: String?
  var teams: [String]
  var currentTeamId: String?
  
  init(userId: String, email: String, firstName: String, lastName: String) {
    self.userId = userId
    self.email = email
    self.firstName = firstName
    self.lastName = lastName
    self.teams = []
  }
}
