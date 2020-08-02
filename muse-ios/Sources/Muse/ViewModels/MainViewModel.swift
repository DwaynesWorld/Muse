//
//  MainViewModel.swift
//  Muse
//
//  Created by Kyle Thompson on 7/1/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation
import Resolver

class MainViewModel: ObservableObject {
  @Injected private var userService: UserRepository
  
  func hasTeam() -> Bool {
    userService.user?.hasTeam ?? false
  }
}
