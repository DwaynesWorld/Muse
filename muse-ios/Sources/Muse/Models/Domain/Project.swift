//
//  Project.swift
//  Muse
//
//  Created by Kyle Thompson on 6/28/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Project: Codable, Identifiable {
  
  @DocumentID var id: String?
  @ServerTimestamp var createdTime: Timestamp?

  var teamId: String
  var name: String
  var description: String
  var status: Status
  var startDate: Date?
  var endDate: Date?
  var location: String
  var icon: String?
  
  init(teamId: String, name: String, description: String) {
    self.teamId = teamId
    self.name = name
    self.description = description
    self.status = .notStarted
    self.location = ""
  }
  
  init(
    id: String?,
    createdTime: Timestamp?,
    teamId: String,
    name: String,
    description: String,
    status: Status,
    startDate: Date? = nil,
    endDate: Date? = nil,
    location: String,
    icon: String? = nil
  ) {
    self.id = id
    self.createdTime = createdTime
    self.teamId = teamId
    self.name = name
    self.description = description
    self.status = status
    self.startDate = startDate
    self.endDate = endDate
    self.location = location
    self.icon = icon
  }
}

