//
//  ProjectRowView.swift
//  Muse
//
//  Created by Kyle Thompson on 6/28/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

struct ProjectRowView: View {
  var project: Project
  
  var body: some View {
    HStack(spacing: 10) {
      Circle()
        .foregroundColor(.blue)
        .frame(width: 40, height: 40, alignment: .center)
      
      VStack(alignment: .leading) {
        Text(project.name)
          .font(.headline)
        
        Text(project.description)
          .font(.footnote)
          .foregroundColor(.secondary)
          .lineLimit(2)
      }
      
      Spacer()
    }.padding(.vertical, 5)
  }
}

struct ProjectRowView_Previews: PreviewProvider {
  static var previews: some View {
    let project = Project(
      id: UUID().uuidString,
      createdTime: Timestamp(),
      teamId: UUID().uuidString,
      name: "Houston Waterworks",
      description: "Building a new tree house for the Houston Waterworks playground",
      status: .notStarted,
      startDate: Date(timeIntervalSinceNow: TimeInterval(exactly: -300)!),
      endDate: Date(timeIntervalSinceNow: TimeInterval(exactly: 300)!),
      location: "",
      icon: ""
    )
    
    return VStack {
      List {
        ProjectRowView(project: project)
        ProjectRowView(project: project)
        ProjectRowView(project: project)
      }
      .listStyle(DefaultListStyle())
//      .listStyle(GroupedListStyle())
//      .listStyle(InsetGroupedListStyle())
//      .listStyle(InsetListStyle())
//      .listStyle(PlainListStyle())
//      .listStyle(SidebarListStyle())
      
    }.preferredColorScheme(.dark)
  }
}
