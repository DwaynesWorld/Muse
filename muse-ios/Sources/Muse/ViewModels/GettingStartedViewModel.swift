//
//  GettingStartedViewModel.swift
//  Muse
//
//  Created by Kyle Thompson on 7/6/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation
import Combine
import Resolver

class GettingStartedViewModel: ObservableObject {
  @Injected private var userRepository: UserRepository
  @Injected private var teamRepository: TeamRepository
  
  func completeOnboarding(name: String) {
    guard var user = userRepository.user else { return }

    var team = Team(ownerId: user.userId, name: name, description: "", members: [user.userId])
    
    do {
      try self.teamRepository.create(&team)
    } catch {
      print("Unable to create team: \(error)")
      return
    }
    
    do {
      user.currentTeamId = team.id
      user.onboardingCompleted = true
      try self.userRepository.update(&user)
    } catch {
      print("Unable to update user: \(error)")
    }
  }
}
