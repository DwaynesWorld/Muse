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
  @State var teamName = ""
  
  var body: some View {
    VStack(alignment: .leading)  {
      Text("Let")
        .font(.largeTitle)
        .bold() +
        Text("'")
          .foregroundColor(.accentColor)
          .font(.largeTitle)
          .bold() +
        Text("s create your first team")
          .font(.largeTitle)
          .bold()
      
      Group {
        Text("Create projects, share ideas, organize task and complete your goals together. ")
          .foregroundColor(.secondary)
          .font(.subheadline)
          .bold() +
          Text("\n\nIt's okay if you are creating a personal team. You can invite others at any time.")
            .font(.subheadline)
            .bold()
          .foregroundColor(.secondary)
      }.padding(.top, 25)
      
      LabeledTextField(label: "team name", disabled: false, text: $teamName)
        .padding(.top, 50)
        .transition(.slide)
      
      HStack {
        Spacer()
        
        VStack {
          Button(action: self.complete) {
            Text("Done")
              .frame(width: 200, height: 20, alignment: .center)
              .padding()
          }
          .foregroundColor(.white)
          .background(Color.blue)
          .cornerRadius(10)
          .padding(.top, 25)
          
          Button(action: {}) {
            Text("Joining a team?")
              .font(.subheadline)
              .bold()
              .foregroundColor(.accentColor)
              .padding()
          }
        }
        
        Spacer()
      }
      
      Spacer()
    }
    .padding()
    .padding(.top, 30)
  }
  
  private func complete() {
    self.model.completeOnboarding(name: self.teamName)
  }
}

struct GettingStartedView_Previews: PreviewProvider {
  static var previews: some View {
    GettingStartedView()
  }
}
