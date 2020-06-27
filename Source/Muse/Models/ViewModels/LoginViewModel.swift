//
//  LoginViewModel.swift
//  Muse
//
//  Created by Kyle Thompson on 6/27/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Combine

class LoginViewModel: ObservableObject {
  @Injected private var authenticationService: AuthenticationService
  @Published var isLoggingIn = false
  
  func login(withEmail email: String, password: String) {
    self.isLoggingIn = true
    
    authenticationService.signIn(withEmail: email, password: password) { result in
      switch result {
      case .success():
        print("success logging in")
      case .failure(let error):
        print(error)
      }
      
      self.isLoggingIn = false
    }
  }
}
