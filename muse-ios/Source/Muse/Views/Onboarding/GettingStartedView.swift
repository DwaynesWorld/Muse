//
//  GettingStartedView.swift
//  Muse
//
//  Created by Kyle Thompson on 7/1/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI

struct GettingStartedView: View {
  @ObservedObject var model = GettingStartedViewModel()
  
  var body: some View {
    VStack(alignment: .leading) {
      // TODO: Get lottie loading animation
      Text("Something")
    }
  }
}

struct GettingStartedView_Previews: PreviewProvider {
  static var previews: some View {
    GettingStartedView()
  }
}
