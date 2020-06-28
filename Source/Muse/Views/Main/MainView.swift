//
//  MainView.swift
//  Muse
//
//  Created by Kyle Thompson on 6/27/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI

struct MainView: View {
  @State private var selectedTab = 1
  
  var body: some View {
    TabView(selection: $selectedTab) {
      DashboardView()
        .tabItem {
          Image(systemName: selectedTab == 0 ? "house.fill" : "house")
          Text("Dashboard")
      }.tag(0)
      
      ProjectsView()
        .tabItem {
          Image(systemName:  selectedTab == 1 ? "tray.full.fill" : "tray.full")
          Text("Projects")
      }.tag(1)
      
      Text("Analytics")
        .tabItem {
          Image(systemName:  selectedTab == 2 ? "chart.bar.fill" : "chart.bar")
          Text("Analytics")
      }.tag(2)
      
      Text("Settings")
        .tabItem {
          Image(systemName: "gear")
          Text("Settings")
      }.tag(3)
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
      MainView()
  }
}
