//
//  Task.swift
//  Muse
//
//  Created by Kyle Thompson on 6/28/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Task: Codable, Identifiable {
  @DocumentID var id: String?
  @ServerTimestamp var createdTime: Timestamp?
  
  var teamId: String
  var projectId: String
  var name: String
  var description: String
  var status: Status
  var dueDate: Date?
  var assignedTo: [String]
  var items: [TaskItem]
}

struct TaskItem: Codable, Identifiable {
  let id: String
  let description: String
  let isCompleted: Bool
}
