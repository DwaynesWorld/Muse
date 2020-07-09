//
//  Team.swift
//  Muse
//
//  Created by Kyle Thompson on 6/28/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Team: Codable, Identifiable {
  @DocumentID var id: String?
  @ServerTimestamp var createdTime: Timestamp?
  
  var ownerId: String
  var name: String
  var description: String
  var members: [String]
  
  init(ownerId: String, name: String, description: String, members: [String]) {
    self.ownerId = ownerId
    self.name = name
    self.description = description
    self.members = members
  }
}
