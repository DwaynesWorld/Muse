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
  var firstName: String
  var email: String
  var avatar: String?
  var teams: [String]
  var currentTeamId: String?
}
