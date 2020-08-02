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
    HStack(alignment: .top, spacing: 10) {
      Circle()
        .foregroundColor(.blue)
        .frame(width: 30, height: 30, alignment: .center)
      VStack(alignment: .leading) {
        Text(project.name)
          .font(.headline)
        Text(project.description)
          .font(.footnote)
          .foregroundColor(.secondary)
          .lineLimit(3)
          .padding(.top, 5)
      }
      Spacer()
    }.padding(.vertical, 5)
  }
}

#if DEBUG
struct ProjectRowView_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      List {
        ProjectRowView(project: testProject)
        ProjectRowView(project: testProject)
        ProjectRowView(project: testProject)
      }
      .listStyle(DefaultListStyle())
    }.preferredColorScheme(.dark)
  }
}
#endif
