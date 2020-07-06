//
//  DashboardView.swift
//  Muse
//
//  Created by Kyle Thompson on 6/28/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI

struct DashboardView: View {
  var body: some View {
    NavigationView {
      VStack(alignment: .leading) {
        Spacer()
      }.navigationBarTitle("Dashboard")
    }
  }
}

struct DashboardView_Previews: PreviewProvider {
  static var previews: some View {
    DashboardView()
  }
}
