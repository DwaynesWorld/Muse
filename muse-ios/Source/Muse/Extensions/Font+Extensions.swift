//
//  UIFont+Extension.swift
//  Muse
//
//  Created by Kyle Thompson on 6/27/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI

extension Font {
  static func libraryRegular(size: CGFloat) -> Font {
    Font.custom("LIBRARY3AM", size: size)
  }
  
  static func librarySoft(size: CGFloat) -> Font {
    Font.custom("LIBRARY3AMsoft", size: size)
  }
}
