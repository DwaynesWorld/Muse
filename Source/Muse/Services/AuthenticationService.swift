//
//  AuthenticationService.swift
//  Muse
//
//  Created by Kyle Thompson on 6/27/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation
import Firebase

enum AuthenticationError: Error {
  case generic
  // TODO: Handle errors correctly
  // FIRAuthErrorCodeNetworkError  Indicates a network error occurred during the operation.
  // FIRAuthErrorCodeUserNotFound  Indicates the user account was not found. This could happen if the user account has been deleted.
  // FIRAuthErrorCodeUserTokenExpired  Indicates the current user’s token has expired, for example, the user may have changed account password on another device. You must prompt the user to sign in again on this device.
  // FIRAuthErrorCodeTooManyRequests  Indicates that the request has been blocked after an abnormal number of requests have been made from the caller device to the Firebase Authentication servers. Retry again after some time.
  // FIRAuthErrorCodeInvalidAPIKey  Indicates the application has been configured with an invalid API key.
  // FIRAuthErrorCodeAppNotAuthorized  Indicates the App is not authorized to use Firebase Authentication with the provided API Key. go to the Google API Console and check under the credentials tab that the API key you are using has your application’s bundle ID whitelisted.
  // FIRAuthErrorCodeKeychainError  Indicates an error occurred when accessing the keychain. The NSLocalizedFailureReasonErrorKey and NSUnderlyingErrorKey fields in the NSError.userInfo dictionary will contain more information about the error encountered.
  // FIRAuthErrorCodeInternalError  Indicates an internal error occurred. Please report the error with the entire NSError object.
}

//class BaseAuthenticationService {
//
//}
//
//
//protocol AuthenticationService: BaseAuthenticationService {
//  func registerUser(
//    withEmail email: String,
//    password: String,
//    completion: @escaping (Result<Void, AuthenticationError>) -> Void
//  )
//
//  func signIn(
//    withEmail email: String,
//    password: String,
//    completion: @escaping (Result<Void, AuthenticationError>) -> Void
//  )
//
//  func signOut(completion: @escaping (Result<Void, AuthenticationError>) -> Void)
//}

class AuthenticationService: ObservableObject  {
  @Published var isLoggedIn = false
  private var handle: AuthStateDidChangeListenerHandle?
  
  init() {
    self.registerStateListener()
  }
  
  func registerUser(
    withEmail email: String,
    password: String,
    completion: @escaping (Result<Void, AuthenticationError>) -> Void
  ) {
    Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
      if let error = error {
        print("Failed to create user: \(error)")
        completion(.failure(.generic));
        return
      }
      
      guard let user = result?.user else { fatalError() }
      print("Successfully created user: \(user.uid).")
      completion(.success(()))
    }
  }
  
  func signIn(
    withEmail email: String,
    password: String,
    completion: @escaping (Result<Void, AuthenticationError>) -> Void
  ) {
    if Auth.auth().currentUser == nil {
      Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
        if let error = error {
          print(error)
          completion(.failure(.generic));
          return
        }
        
        completion(.success(()))
      }
    } else {
       completion(.success(()))
    }
  }
  
  func signOut(completion: @escaping (Result<Void, AuthenticationError>) -> Void) {
    do {
      try Auth.auth().signOut()
    } catch {
      print(error)
      completion(.failure(.generic))
    }
    
    completion(.success(()))
  }
  
  private func registerStateListener() {
    if let handle = handle {
      Auth.auth().removeStateDidChangeListener(handle)
    }
    
    self.handle = Auth.auth().addStateDidChangeListener { (auth, user) in
      if user != nil {
        print("auth state changed - logged in")
        self.isLoggedIn = true
      } else {
        print("auth state changed - logged in")
        self.isLoggedIn = false
      }
    }
  }
}
