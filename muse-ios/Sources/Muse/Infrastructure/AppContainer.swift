//
//  AppContainer.swift
//  Muse
//
//  Created by Kyle Thompson on 6/27/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation
import Swinject

struct AppContainer {
  
  static let `default` = AppContainer()
  private let resolver: Resolver
  
  private init() {
    let container = Container()
    
    container.register(AuthenticationService.self) { _ in
      AuthenticationService()
    }.inObjectScope(.container)
    
    container.register(UserService.self) { _ in
      FirestoreUserService()
    }.inObjectScope(.container)
    
    container.register(ProjectService.self) { _ in
      FirestoreProjectService()
    }.inObjectScope(.container)
    
    container.register(TeamService.self) { _ in
      FirestoreTeamService()
    }.inObjectScope(.container)
    
    self.resolver = container.synchronize()
  }
  
  func resolve<Service>(_ serviceType: Service.Type) -> Service? {
    return resolver.resolve(serviceType)
  }
}
