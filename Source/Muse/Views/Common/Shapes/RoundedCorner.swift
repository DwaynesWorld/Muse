//
//  RoundedCorner.swift
//  Algolab
//
//  Created by Kyle Thompson on 6/21/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI

/// A custom shape which allows for configurable rounded corners.
struct RoundedCorner: Shape {
  var radius: CGFloat = .infinity
  var corners: UIRectCorner = .allCorners
  
  func path(in rect: CGRect) -> Path {
    let path = UIBezierPath(
      roundedRect: rect,
      byRoundingCorners: corners,
      cornerRadii: CGSize(width: radius, height: radius)
    )
    
    return Path(path.cgPath)
  }
}
