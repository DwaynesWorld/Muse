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
  @State var showCreateModal = false
  @State var selectedProject: Project? = nil
  
  var body: some View {
    NavigationView {
      VStack(alignment: .leading) {
        if self.model.projects.count > 0 {
          List(self.model.projects, id: \.id) { project in
            ProjectRowView(project: project)
              .onTapGesture { self.selectedProject = project }
          }.listStyle(InsetGroupedListStyle())
        } else {
          Text("No Projects - Empty State")
        }
      }.sheet(isPresented: self.$showCreateModal) {
        CreateProjectView(isPresented: self.$showCreateModal)
      }
      .sheet(item: self.$selectedProject) { project in
        ProjectDetailsView(project: project)
      }
      .navigationBarTitle("Projects")
      .navigationBarItems(trailing: Button("Create") {
        print("Create tapped!")
        self.showCreateModal.toggle()
      })
    }
  }
}

#if DEBUG
struct ProjectsView_Previews: PreviewProvider {
  static var previews: some View {
    ProjectsView()
  }
}
#endif
