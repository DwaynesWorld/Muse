//
//  SignupView.swift
//  Muse
//
//  Created by Kyle Thompson on 6/27/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI

struct SignupView: View {
  private let textFieldPadding: CGFloat = 20.0
  
  @ObservedObject var model: RegistrationViewModel
  @State var page = 0

  #if DEBUG
  @State var firstName: String = "John"
  @State var lastName: String = "Doe"
  @State var email: String = "john.doe@example.com"
  @State var password: String = "123456"
  @State var confirmPassword: String = "123456"
  #else
  @State var firstName: String = ""
  @State var lastName: String = ""
  @State var email: String = ""
  @State var password: String = ""
  @State var confirmPassword: String = ""
  #endif
  
  var body: some View {
    VStack(alignment: .leading) {
      Text("New Account")
        .font(.title)
        .fontWeight(.heavy)
        .padding(.bottom, 20)
      
      Group {
        if page == 0 {
          LabeledTextField(
            label: "Email",
            disabled: self.model.isSigningUp,
            text: $email
          )
          
          LabeledSecureField(
            label: "Password",
            disabled: self.model.isSigningUp,
            text: $password
          )
          
          LabeledSecureField(
            label: "Confirm Password",
            disabled: self.model.isSigningUp,
            text: $confirmPassword
          )
        }
        
        if page == 1 {
          LabeledTextField(
            label: "First Name",
            disabled: self.model.isSigningUp,
            text: $firstName
          )
          
          LabeledTextField(
            label: "Last Name",
            disabled: self.model.isSigningUp,
            text: $lastName
          )
        }
      }.padding(.top, 20)
      
      HStack {
        Spacer()
        
        Button(action: { self.handleClick() }) {
          Text(page == 0 ? "Next" : "Done")
            .frame(width: 200, height: 20, alignment: .center)
            .padding()
        }
        .foregroundColor(.white)
        .background(Color.blue)
        .cornerRadius(10)
        .padding(.top, 30)
        
        Spacer()
      }

      Spacer()
    }
    .padding(.horizontal, 30)
    .padding(.vertical, 30)
  }
  
  private func handleClick() {
    if self.page == 0 {
      self.page = 1
    } else {
      self.model.register(
        withFirstName: self.firstName,
        lastName: self.lastName,
        email: self.email,
        password: self.password,
        confirmPassword: self.confirmPassword
      )
    }
  }
}

struct SignupView_Previews: PreviewProvider {
  static var previews: some View {
    SignupView(model: RegistrationViewModel())
  }
}
