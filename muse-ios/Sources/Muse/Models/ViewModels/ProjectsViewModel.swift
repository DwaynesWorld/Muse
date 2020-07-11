//
//  ProjectsViewModel.swift
//  Muse
//
//  Created by Kyle Thompson on 6/28/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation
import Combine

class ProjectsViewModel: ObservableObject {
  @Injected var projectService: ProjectService
  @Published var projects: [Project] = []
  
  private var cancellables = Set<AnyCancellable>()
  
  init() {
    projectService.$projects
      .assign(to: \.projects, on: self)
      .store(in: &cancellables)
  }
  
  deinit {
    cancellables.forEach { $0.cancel() }
    cancellables.removeAll()
  }
}
