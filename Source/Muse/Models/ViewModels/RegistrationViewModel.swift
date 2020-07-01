//
//  RegistrationViewModel.swift
//  Muse
//
//  Created by Kyle Thompson on 6/27/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Combine

class RegistrationViewModel: ObservableObject {
  @Injected private var authenticationService: AuthenticationService
  @Injected private var userService: UserService
  @Published var isLoggingIn = false
  @Published var isSigningUp = false
  
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
  
  func register(
    withFirstName firstName: String,
    lastName: String,
    email: String,
    password: String,
    confirmPassword: String
  ) {
    guard firstName.count > 0 else {
      print("firstname length")
      return
    }
    
    guard lastName.count > 0 else {
      print("lastname length")
      return
    }
    
    guard email.count > 0 else {
      print("email length")
      return
    }
    
    guard password.count > 0 else {
      print("passwords length")
      return
    }
    
    guard password == confirmPassword else {
      print("passwords do not match")
      return
    }
    
    self.isSigningUp = true
    
    authenticationService.registerUser(withEmail: email, password: password) { result in
      switch result {
      case .success(let userId):
        do {
          var user = MuseUser(
            userId: userId,
            email: email,
            firstName: firstName,
            lastName: lastName
          )
          
          try self.userService.create(&user)
        } catch let error {
          print(error.localizedDescription)
        }
        
      case .failure(let error):
        print(error)
      }
      
      self.isSigningUp = false
    }
  }
}
