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
  @Injected private var userService: UserRepository
  @Injected private var teamService: TeamRepository
  
  func completeOnboarding(name: String) {
    guard var user = userService.user else { return }

    var team = Team(ownerId: user.userId, name: name, description: "", members: [user.userId])
    
    do {
      try self.teamService.create(&team)
    } catch {
      print("Unable to create team: \(error)")
      return
    }
    
    do {
      user.currentTeamId = team.id
      user.onboardingCompleted = true
      try self.userService.update(&user)
    } catch {
      print("Unable to update user: \(error)")
    }
  }
}
