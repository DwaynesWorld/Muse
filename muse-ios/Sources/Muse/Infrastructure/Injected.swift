//
//  Injected.swift
//  Muse
//
//  Created by Kyle Thompson on 6/27/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation
import Swinject

@propertyWrapper
public struct Injected<T> {
  private var service: T
  
  public init() {
    self.service = AppContainer.default.resolve(T.self)!
  }
  
  public var wrappedValue: T {
    get { return service }
    mutating set { service = newValue }
  }
  
  public var projectedValue: Injected<T> {
    get { return self }
    mutating set { self = newValue }
  }
}
