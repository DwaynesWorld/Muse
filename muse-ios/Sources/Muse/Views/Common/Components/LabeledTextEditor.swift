//
//  LabeledTextEditor.swift
//  Muse
//
//  Created by Kyle Thompson on 7/9/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI

struct LabeledTextEditor: View {
  var label: String
  var disabled: Bool?
  @Binding var text: String
  
  var body: some View {
    VStack(alignment: .leading, spacing: 5) {
      Text(label.uppercased())
        .font(.footnote)
        .foregroundColor(.secondary)
      
      TextEditor(text: self.$text)
        .frame(height: 75, alignment: .topLeading)
        .autocapitalization(.sentences)
        .keyboardType(.default)
        .disabled(disabled ?? true)
      
      Divider()
    }
  }
}

struct LabeledTextEditor_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      LabeledTextEditor(
        label: "Last Name",
        text: .constant("Something")
      )
    }.padding()
  }
}
