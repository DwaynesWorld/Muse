//
//  PageViewController.swift
//  Muse
//
//  Created by Kyle Thompson on 7/1/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI

struct PageViewController: UIViewControllerRepresentable {
  var controllers: [UIViewController]
  @Binding var currentPage: Int
  @Binding var direction: UIPageViewController.NavigationDirection
  
  func makeUIViewController(context: Context) -> UIPageViewController {
    let pageViewController = UIPageViewController(
      transitionStyle: .scroll,
      navigationOrientation: .horizontal
    )
    
    pageViewController.dataSource = context.coordinator
    pageViewController.delegate = context.coordinator
    pageViewController.view.backgroundColor = UIColor(named: "bgColor")
    
    self.controllers.forEach { $0.view.backgroundColor = UIColor(named: "bgColor") }
    
    return pageViewController
  }
  
  func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {    
    uiViewController.setViewControllers(
      [self.controllers[self.currentPage]],
      direction: self.direction,
      animated: true
    )
  }
  
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
  
  class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    var parent: PageViewController
    
    init(_ controller: PageViewController) {
      self.parent = controller
    }
    
    func pageViewController(
      _ pageViewController: UIPageViewController,
      viewControllerBefore viewController: UIViewController
    ) -> UIViewController? {
      guard let index = parent.controllers.firstIndex(of: viewController) else {
        return nil
      }
      
      if index == 0 {
        return nil
      }
      
      return parent.controllers[index - 1]
    }
    
    func pageViewController(
      _ pageViewController: UIPageViewController,
      viewControllerAfter viewController: UIViewController
    ) -> UIViewController? {
      guard let index = parent.controllers.firstIndex(of: viewController) else {
        return nil
      }
      
      if index == parent.controllers.count - 1{
        return nil
      }
      
      return parent.controllers[index + 1]
    }
    
    func pageViewController(
      _ pageViewController: UIPageViewController,
      didFinishAnimating finished: Bool,
      previousViewControllers: [UIViewController],
      transitionCompleted completed: Bool
    ) {
      if completed,
        let visibleViewController = pageViewController.viewControllers?.first,
        let index = parent.controllers.firstIndex(of: visibleViewController) {
        parent.currentPage = index
      }
    }
  }
}
