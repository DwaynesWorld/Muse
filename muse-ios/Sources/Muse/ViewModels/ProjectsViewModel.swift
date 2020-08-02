//
//  ProjectsViewModel.swift
//  Muse
//
//  Created by Kyle Thompson on 6/28/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation
import Combine
import Resolver

class ProjectsViewModel: ObservableObject {
  @Injected var projectRepository: ProjectRepository
  @Published var projects: [Project] = []
  
  private var cancellables = Set<AnyCancellable>()
  
  init() {
    projectRepository.$projects
      .assign(to: \.projects, on: self)
      .store(in: &cancellables)
  }
  
  deinit {
    cancellables.forEach { $0.cancel() }
    cancellables.removeAll()
  }
}
