//
//  View+Extensions.swift
//  Muse
//
//  Created by Kyle Thompson on 6/27/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI

// MARK: - API
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {
  public func foregroundGradient(_ colors: [Color]) -> some View {
    let gradient = LinearGradient(
      gradient: .init(colors: colors),
      startPoint: .topLeading,
      endPoint: .bottomTrailing
    )
    
    return self.overlay(gradient).mask(self)
  }
}
