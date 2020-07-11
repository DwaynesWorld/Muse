//
//  ActivityIndicator.swift
//  Muse
//
//  Created by Kyle Thompson on 6/27/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

struct ActivityIndicator: UIViewRepresentable {
  @Binding var isAnimating: Bool
  let style: UIActivityIndicatorView.Style
  let color: UIColor
  
  func makeUIView(context: Context) -> UIActivityIndicatorView {
    let indicator = UIActivityIndicatorView(style: style)
    indicator.color = color
    return indicator
  }
  
  func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
    self.isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
  }
}
