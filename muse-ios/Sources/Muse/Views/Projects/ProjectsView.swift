//
//  ProjectsView.swift
//  Muse
//
//  Created by Kyle Thompson on 6/28/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI

struct ProjectsView: View {
  @ObservedObject var model = ProjectsViewModel()
  @State var showModal = false
  
  var body: some View {
    NavigationView {
      VStack(alignment: .leading) {
        if self.model.projects.count > 0 {
          List(self.model.projects, id: \.id) { project in
            NavigationLink(destination: Text("Destination")) {
              ProjectRowView(project: project)
            }
          }.listStyle(InsetGroupedListStyle())
        } else {
          Text("No Projects - Empty State")
        }
      }.sheet(isPresented: self.$showModal) {
        CreateProjectView(isPresented: self.$showModal)
      }
      .navigationBarTitle("Projects")
      .navigationBarItems(trailing:
        Button("Create") {
          print("Create tapped!")
          self.showModal.toggle()
        }
      )
    }
  }
}

struct ProjectsView_Previews: PreviewProvider {
  static var previews: some View {
    ProjectsView()
  }
}
