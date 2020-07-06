//
//  ProjectRowView.swift
//  Muse
//
//  Created by Kyle Thompson on 6/28/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI

struct ProjectRowView: View {
    var body: some View {
      HStack {
        Circle()
          .foregroundColor(.blue)
          .frame(width: 40, height: 40, alignment: .center)
        
        VStack(alignment: .leading) {
          Text("Houston Waterworks")
            .font(.headline)
          
          Text("Building a new tree house for the Houston Waterworks playground")
            .font(.footnote)
            .foregroundColor(.secondary)
            .lineLimit(2)
        }.padding(.leading)
        
        Spacer()
        
        Text("32")
          .font(.headline)
          .padding(8)
      }
      .padding()

    }
}

struct ProjectRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectRowView()
    }
}
