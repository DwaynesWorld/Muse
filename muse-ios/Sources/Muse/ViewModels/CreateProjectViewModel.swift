//
//  CreateProjectViewModel.swift
//  Muse
//
//  Created by Kyle Thompson on 7/9/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation
import Combine
import Resolver

class CreateProjectViewModel: ObservableObject {
  @Injected private var userRepository: UserRepository
  @Injected private var projectRepository: ProjectRepository
  
  func createProject(name: String, description: String) {
    guard let user = userRepository.user else { return }
    guard let teamId = user.currentTeamId else { return }
    
    var project = Project(teamId: teamId, name: name, description: description)
    
    do {
      try projectRepository.create(&project)
    } catch {
      print("Error creating project: \(error)")
    }
  }
}
