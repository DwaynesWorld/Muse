//
//  PageViewContainer.swift
//  Muse
//
//  Created by Kyle Thompson on 7/1/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI

struct PageViewContainer<Page: View>: View {
  @State var currentPage = 0
  @State var direction: UIPageViewController.NavigationDirection  = .forward
  
  var viewControllers: [UIHostingController<Page>]
  var onComplete: () -> Void
  
  var body: some View {
    VStack {
      HStack {
        Spacer()
        Button(action: self.onComplete) {
          Text("Skip")
            .foregroundColor(.accentColor)
            .padding()
        }
      }
      PageViewController(
        controllers: viewControllers,
        currentPage: self.$currentPage,
        direction: self.$direction
      )
      PageIndicator(
        currentIndex: self.currentPage,
        count: viewControllers.count
      )
      Button(action: self.onNext) {
        Text(self.getButtonText())
          .frame(width: 200, height: 20, alignment: .center)
          .padding()
      }
      .foregroundColor(.white)
      .background(Color.blue)
      .cornerRadius(10)
      .padding(.top, 25)
    }
    .gesture(DragGesture().onEnded(self.onDragEnded))
  }
  
  func onNext() {
    if self.currentPage < self.viewControllers.count - 1 {
      self.currentPage += 1
      self.direction = .forward
    } else {
      self.onComplete()
    }
  }
  
  func onDragEnded(gesture: DragGesture.Value) {
    let dragThreshold: CGFloat = 5
    let start = gesture.startLocation.x
    let end = gesture.location.x
    
    guard abs(start - end) > dragThreshold else { return }
    
    if start < end {
      if self.currentPage > 0 {
        self.currentPage -= 1
        self.direction = .reverse
      }
    } else {
      if self.currentPage < self.viewControllers.count - 1 {
        self.currentPage += 1
        self.direction = .forward
      }
    }
  }
  
  func getButtonText() -> String {
    self.currentPage == self.viewControllers.count - 1
      ? "Get started"
      : "Next"
  }
}

#if DEBUG
struct PageViewContainer_Previews: PreviewProvider {
  static var previews: some View {
    let pages = [
      Page(
        id: UUID(),
        image: "process",
        heading: "Manage Projects",
        subSubheading: "Lorem ipsum dolor sit amet, " +
          "consectetur adipisicing elit, sed do eiusmod tempor " +
          "incididunt ut labore et dolore magna."
      ),
      Page(
        id: UUID(),
        image: "schedule",
        heading: "Track Tasks",
        subSubheading: "Lorem ipsum dolor sit amet, " +
          "consectetur adipisicing elit, sed do eiusmod tempor " +
          "incididunt ut labore et dolore magna."
      ),
      Page(
        id: UUID(),
        image: "google_docs",
        heading: "Share Documents",
        subSubheading: "Lorem ipsum dolor sit amet, " +
          "consectetur adipisicing elit, sed do eiusmod tempor " +
          "incididunt ut labore et dolore magna."
      ),
      Page(
        id: UUID(),
        image: "time_management",
        heading: "Save Time",
        subSubheading: "Lorem ipsum dolor sit amet, " +
          "consectetur adipisicing elit, sed do eiusmod tempor " +
          "incididunt ut labore et dolore magna."
      ),
      Page(
        id: UUID(),
        image: "visual_data",
        heading: "Analyze Metrics",
        subSubheading: "Lorem ipsum dolor sit amet, " +
          "consectetur adipisicing elit, sed do eiusmod tempor " +
          "incididunt ut labore et dolore magna."
      )
    ]
    
    let controllers = pages.map {
      UIHostingController(rootView: PageView(page: $0))
    }
    
    return PageViewContainer(viewControllers: controllers, onComplete: {})
  }
}
#endif
