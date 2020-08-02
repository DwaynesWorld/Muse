//
//  OnboardingView.swift
//  Muse
//
//  Created by Kyle Thompson on 7/1/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI

struct OnboardingView: View {
  @State var showGetStarted = false
  
  
  let pages = [
    Page(id: UUID(), image: "process", heading: "Manage Projects", subSubheading: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna."),
    Page(id: UUID(), image: "schedule", heading: "Track Tasks", subSubheading: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna."),
    Page(id: UUID(), image: "google_docs", heading: "Share Documents", subSubheading: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna."),
    Page(id: UUID(), image: "time_management", heading: "Save Time", subSubheading: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna."),
    Page(id: UUID(), image: "visual_data", heading: "Analyze Metrics", subSubheading: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.")
  ]
  
  var body: some View {
    Group {
      if showGetStarted {
        GettingStartedView()
      } else {
        PageViewContainer(
          viewControllers: self.getControllers(),
          onComplete: self.onComplete
        )
      }
    }
  }
  
  func onComplete() {
    self.showGetStarted.toggle()
  }
  
  func getControllers() -> [UIHostingController<PageView>] {
    pages.map { UIHostingController(rootView: PageView(page: $0))}
  }
}

#if DEBUG
struct OnboardingView_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingView()
  }
}
#endif
