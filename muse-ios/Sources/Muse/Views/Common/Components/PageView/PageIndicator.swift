//
//  PageIndicator.swift
//  Muse
//
//  Created by Kyle Thompson on 7/1/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI

struct PageIndicator: View {
  var currentIndex: Int = 0
  var count: Int = 4
  var selectedForegroundcolor: Color = .accentColor
  var foregroundcolor: Color = .gray
  var height: CGFloat = 10
  var width: CGFloat = 10
  var selectedWidth: CGFloat = 30
  
  var body: some View {
    HStack {
      ForEach(0..<count) { index in
        RoundedRectangle(cornerRadius: .infinity)
          .foregroundColor(self.getForegroundColor(for: index))
          .frame(width: self.getWidth(for: index), height: self.height)
      }
    }
  }
  
  func getForegroundColor(for index: Int) -> Color {
    index == self.currentIndex
      ? self.selectedForegroundcolor
      : self.foregroundcolor
  }
  
  func getWidth(for index: Int) -> CGFloat {
    index == self.currentIndex
      ? self.selectedWidth
      : self.width
  }
}

struct PageIndicator_Previews: PreviewProvider {
  static var previews: some View {
    PageIndicator()
  }
}
