//
//  AppDelegate+Injection.swift
//  Muse
//
//  Created by Kyle Thompson on 8/2/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
  public static func registerAllServices() {
    // register application components
    register { AuthenticationService() }.scope(application)
    register { FirestoreUserRepository() as UserRepository }.scope(application)
    register { FirestoreProjectRepository() as ProjectRepository }.scope(application)
    register { FirestoreTeamRepository() as TeamRepository }.scope(application)
  }
}
