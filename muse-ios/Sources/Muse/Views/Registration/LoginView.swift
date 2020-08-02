//
//  LoginView.swift
//  Muse
//
//  Created by Kyle Thompson on 6/27/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI

struct LoginView: View {
  @ObservedObject var model = RegistrationViewModel()
  @State private var showSignupView = false

  #if DEBUG
  @State var email: String = "john.doe@example.com"
  @State var password: String = "123456"
  #else
  @State var email: String = ""
  @State var password: String = ""
  #endif
  
  
  var body: some View {
    ZStack(alignment: .center) {
      VStack {
        Text("Muse")
          .font(Font.librarySoft(size: 64))
          .foregroundGradient([.red, .purple, .blue])
          .padding(.top, 80)
        Text("Welcome back! Please login to your account to get started.")
          .fontWeight(.light)
          .foregroundColor(.secondary)
          .multilineTextAlignment(.center)
          .padding(.top, 5)
        Button(action: { self.signup() }) {
          HStack {
            Text("Don't have an account?")
              .font(.footnote)
            Text("Signup")
              .font(.footnote)
              .fontWeight(.semibold)
          }.padding(.top, 5)
        }.sheet(isPresented: self.$showSignupView) {
          SignupView(model: self.model)
        }
        VStack {
          HStack {
            Image(systemName: "envelope")
              .foregroundColor(.gray)
              .frame(width: 30, height: 30, alignment: .center)
            TextField("Email", text: $email)
              .autocapitalization(.none)
              .keyboardType(.emailAddress)
              .disabled(self.model.isLoggingIn)
          }
          Divider()
        }.padding(.top, 50)
        VStack(alignment: .leading) {
          HStack {
            Image(systemName: "lock")
              .foregroundColor(.gray)
              .frame(width: 30, height: 30, alignment: .center)
            SecureField("Password", text: $password)
              .autocapitalization(.none)
              .keyboardType(.alphabet)
              .disabled(self.model.isLoggingIn)
          }
          Divider()
          Text("Forgot Password?")
            .font(.footnote)
            .foregroundColor(.secondary)
        }.padding(.top, 10)
        Button(action: { self.login() }) {
          Text("Login")
            .frame(width: 200, height: 20, alignment: .center)
            .padding()
        }
        .foregroundColor(.white)
        .background(Color.blue)
        .cornerRadius(10)
        .padding(.top, 25)
        Spacer()
        VStack {
          Text("By Signing up, you agree to MUSE's")
            .font(.footnote)
            .foregroundColor(.secondary)
          Text("Terms & Conditions and Privacy")
            .font(.footnote)
            .foregroundColor(.primary)
            .fontWeight(.semibold)
            .opacity(0.8)
        }
      }
      .padding(.horizontal, 30)
      .padding(.vertical, 20)
      
      if self.model.isLoggingIn {
        ActivityIndicator(isAnimating: .constant(true), style: .large, color: .darkGray)
      }
    }
  }
  
  func signup() {
    self.showSignupView.toggle()
  }
  
  func login() {
    guard !self.model.isLoggingIn else { return }

    self.model.login(withEmail: self.email, password: self.password)
  }
}

#if DEBUG
struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}
#endif
