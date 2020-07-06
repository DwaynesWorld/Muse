//
//  RootView.swift
//  Muse
//
//  Created by Kyle Thompson on 6/27/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI

struct RootView: View {
  @ObservedObject var model = RootViewModel()
  
  var body: some View {
    Group {
      innerRootView()
    }.onAppear {
      self.model.signout()
    }
  }
  
  func innerRootView() -> AnyView {
    switch (self.model.isLoggedIn, self.model.onboardingComplete) {
    case (true, true): return AnyView(MainView())
    case (true, false): return AnyView(OnboardingView())
    default: return AnyView(LoginView())
    }
  }
}

struct RootView_Previews: PreviewProvider {
  static var previews: some View {
    RootView()
  }
}
