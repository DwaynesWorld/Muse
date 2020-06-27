//
//  MainView.swift
//  Muse
//
//  Created by Kyle Thompson on 6/27/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI

struct MainView: View {
  @State private var selectedTab = 0
  
  var body: some View {
    TabView(selection: $selectedTab) {
      Text("Home")
        .onTapGesture {
          self.selectedTab = 0
        }.tabItem {
          Image(systemName: selectedTab == 0 ? "house" : "house.fill")
          Text("Home")
        }
      
      Text("Projects").onTapGesture {
        self.selectedTab = 1
      }.tabItem {
        Image(systemName: "tray.full")
          Text("Projects")
      }
      
      Text("Analytics").onTapGesture {
        self.selectedTab = 2
      }.tabItem {
        Image(systemName: "chart.bar")
        Text("Analytics")
      }
      
      Text("Settings").onTapGesture {
        self.selectedTab = 3
      }.tabItem {
        Image(systemName: "gear")
          Text("Settings")
      }
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
