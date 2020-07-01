//
//  LabeledSecureField.swift
//  Muse
//
//  Created by Kyle Thompson on 6/30/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI

struct LabeledSecureField: View {
  var label: String
  var disabled: Bool
  @Binding var text: String
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(label.uppercased())
        .font(.footnote)
        .foregroundColor(.secondary)
      
      SecureField("", text: $text)
        .autocapitalization(.sentences)
        .keyboardType(.default)
        .disabled(disabled)
      
      Divider()
    }
  }
}

struct LabeledSecureField_Previews: PreviewProvider {
    static var previews: some View {
      VStack {
        LabeledSecureField(
          label: "Last Name",
          disabled: false,
          text: .constant("Somthing")
        )
      }.padding()
    }
}
