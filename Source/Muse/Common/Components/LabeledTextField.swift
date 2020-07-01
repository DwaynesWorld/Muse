//
//  LabeledTextField.swift
//  Muse
//
//  Created by Kyle Thompson on 6/30/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI

struct LabeledTextField: View {
  var label: String
  var disabled: Bool
  @Binding var text: String
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(label.uppercased())
        .font(.footnote)
        .foregroundColor(.secondary)
      
      TextField("", text: $text)
        .autocapitalization(.sentences)
        .keyboardType(.default)
        .disabled(disabled)
      
      Divider()
    }
  }
}

struct LabeledTextField_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      LabeledTextField(
        label: "Last Name",
        disabled: false,
        text: .constant("Somthing")
      )
    }.padding()
  }
}
