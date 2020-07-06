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
  var icon: String
}

