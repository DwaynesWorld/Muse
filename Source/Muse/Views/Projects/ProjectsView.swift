//
//  ProjectsView.swift
//  Muse
//
//  Created by Kyle Thompson on 6/28/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI

struct ProjectsView: View {
  var body: some View {
    NavigationView {
      VStack(alignment: .leading) {
        List {
          ProjectRowView()
          ProjectRowView()
          ProjectRowView()
          ProjectRowView()
          ProjectRowView()
          ProjectRowView()
        }.navigationBarTitle("Projects")
      }
    }
  }
}

struct ProjectsView_Previews: PreviewProvider {
  static var previews: some View {
    ProjectsView()
  }
}
