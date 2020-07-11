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
    }
  }
  
  func innerRootView() -> AnyView {
    let isLoggedIn = self.model.isLoggedIn
    let userInitialized = self.model.userInitialized
    let onboardingComplete = self.model.onboardingComplete
    
    switch (isLoggedIn, userInitialized, onboardingComplete) {
    case (false, _, _): return AnyView(LoginView())
    case (true, true, true): return AnyView(MainView())
    case (true, true, false): return AnyView(OnboardingView())
    default: return AnyView(LoadingView())
    }
  }
}

struct RootView_Previews: PreviewProvider {
  static var previews: some View {
    RootView()
  }
}
