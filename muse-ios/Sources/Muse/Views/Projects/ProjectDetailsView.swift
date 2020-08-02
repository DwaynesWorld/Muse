//
//  ProjectDetailsView.swift
//  Muse
//
//  Created by Kyle Thompson on 7/11/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI

struct ProjectDetailsView: View {
  var project: Project
  
  var body: some View {
    Text(project.name)
  }
}

#if DEBUG
struct ProjectDetailsView_Previews: PreviewProvider {
  static var previews: some View {
    ProjectDetailsView(project: testProject)
  }
}
#endif
