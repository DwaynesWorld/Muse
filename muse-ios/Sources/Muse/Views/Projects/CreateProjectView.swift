//
//  CreateProjectView.swift
//  Muse
//
//  Created by Kyle Thompson on 7/9/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI

struct CreateProjectView: View {
  var model = CreateProjectViewModel()
  
  @Binding var isPresented: Bool
  @State var name: String = ""
  @State var description: String = "default"
  
  var body: some View {
    VStack {
      header.padding()
      
      VStack {
        LabeledTextField(label: "Project Name", disabled: false, text: self.$name)
        
        LabeledTextEditor(label: "Description", text: self.$description)
          .padding(.top, 20)
        
        VStack {
          HStack {
            Circle()
              .foregroundColor(.blue)
              .frame(width: 30, height: 30, alignment: .center)
            
            Text("Icon")
            
            Spacer()
            
            Image(systemName: "chevron.right")
              .foregroundColor(.gray)
              .padding(.trailing, 5)
          }
          
          Divider()
        }.padding(.top, 20)
      }
      .padding()
      .padding(.top, 20)
      
      Spacer()
    }
  }
  
  var header: some View {
    HStack {
      Button("Cancel") {
        print("Cancel tapped!")
        self.isPresented.toggle()
      }
      
      Spacer()
      
      Text("New Project")
        .font(.headline)
      
      Spacer()
      
      Button("Create") {
        print("Create tapped!")
        self.model.createProject(name: self.name, description: self.description)
        self.isPresented.toggle()
      }
    }
  }
  
  
}

struct CreateProjectView_Previews: PreviewProvider {
  static var previews: some View {
    CreateProjectView(isPresented: .constant(true))
  }
}

