//
//  PageView.swift
//  Muse
//
//  Created by Kyle Thompson on 7/1/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI

struct PageView: View {
  var page: Page
  
  var body: some View {
    VStack {
      Image(page.image)
        .resizable()
        .scaledToFit()
        .padding(.horizontal, 10)
      
      VStack {
        Text(page.heading)
          .font(.title)
          .bold()
          .multilineTextAlignment(.center)
          .padding(.top, 10)
        
        Text(page.subSubheading)
          .multilineTextAlignment(.center)
          .padding(.top, 10)
      }.padding()
    }
  }
}

struct Page {
  let id: UUID
  let image: String
  let heading: String
  let subSubheading: String
}

struct PageView_Previews: PreviewProvider {
  static var previews: some View {
    let page = Page(
      id: UUID(),
      image: "process",
      heading: "Manage Projects",
      subSubheading: "Lorem ipsum dolor sit amet, " +
        "consectetur adipisicing elit, sed do eiusmod " +
        "tempor incididunt ut labore et dolore magna."
    )
    return PageView(page: page)
  }
}

