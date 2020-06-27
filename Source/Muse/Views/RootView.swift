//
//  RootView.swift
//  Muse
//
//  Created by Kyle Thompson on 6/27/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI

struct RootView: View {
  @ObservedObject private var authenticationService: AuthenticationService

  init() {
    self.authenticationService = AppContainer.default.resolve(AuthenticationService.self)!
  }
  
  var body: some View {
    NavigationView {
      if self.authenticationService.isLoggedIn {
        MainView()
      } else {
        LoginView()
      }
    }
    .navigationViewStyle(StackNavigationViewStyle())
    .onTapGesture {
      print(self.authenticationService.isLoggedIn)
    }
  }
}

struct RootView_Previews: PreviewProvider {
  static var previews: some View {
    RootView()
  }
}
