//
//  ProjectDetailsView.swift
//  Muse
//
//  Created by Kyle Thompson on 7/11/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI

struct ProjectDetailsView: View {
  var project: Project
  
  var body: some View {
    VStack(alignment: .leading) {
      header
      ScrollView {
        HStack {
          Image(systemName: "map")
            .resizable()
            .frame(width: 25, height: 25, alignment: .center)
            .padding(.trailing, 10)
            .opacity(0.7)
          Text("Houston, TX")
          Spacer()
        }
        .padding(.top, 50)
        .padding(.leading, 20)
        
        HStack {
          Image(systemName: "calendar")
            .resizable()
            .frame(width: 25, height: 25, alignment: .center)
            .padding(.trailing, 10)
            .opacity(0.7)
          VStack(alignment: .leading) {
            Text("Monday, December 25th")
            Text("Tuesday, April 2nd")
          }
          Spacer()
        }
        .padding(.top, 25)
        .padding(.leading, 20)
        
        HStack {
          Image(systemName: "bell")
            .resizable()
            .frame(width: 25, height: 25, alignment: .center)
            .padding(.trailing, 10)
            .opacity(0.7)
          Text("4 weeks before the event")
          Spacer()
        }
        .padding(.top, 25)
        .padding(.leading, 20)
        
        VStack {
          HStack {
            Text("Members")
              .font(.callout)
              .padding(.top, 25)
              .padding(.leading, 20)
            Spacer()
          }
          
          HStack {
            ForEach(0..<5) { _ in
              Circle()
                .frame(width: 45, height: 45, alignment: .trailing)
                .foregroundColor(.purple)
                .padding(.leading, -20)
            }
            Circle()
              .frame(width: 45, height: 45, alignment: .trailing)
              .foregroundColor(.gray)
              .padding(.leading, 0)
            Spacer()
          }
          .padding(.leading, 40)
          
          HStack {
            Text("Description")
              .font(.callout)
              .padding(.top, 25)
              .padding(.leading, 20)
            Spacer()
          }
          
          HStack {
            TextEditor(text: .constant(project.description))
          }
        }
      }
      .background(Color.gray)
      .clipShape(RoundedCorner(radius: 25, corners: [.topLeft, .topRight]))
    }
  }
  
  var header: some View {
    VStack(alignment: .leading) {
      HStack {
        Spacer()
        Circle()
          .frame(width: 45, height: 45, alignment: .trailing)
          .foregroundColor(.purple)
      }
      .padding(.top, 10)
      .padding(.trailing, 10)
      
      VStack(alignment: .leading) {
        Text("Team Name")
          .font(.headline)
          .foregroundColor(.secondary)
        Text(project.name)
          .font(.title)
          .bold()
          .lineLimit(2)
      }
      .padding(.top, 10)
      .padding(.leading, 10)
    }
  }
}

#if DEBUG
struct ProjectDetailsView_Previews: PreviewProvider {
  static var previews: some View {
    ProjectDetailsView(project: testProject)
      
  }
}
#endif
