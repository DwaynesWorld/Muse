//
//  BaseRepository.swift
//  Muse
//
//  Created by Kyle Thompson on 7/8/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation
import Combine

class BaseRepository: ObservableObject {
  var cancellables = Set<AnyCancellable>()
  
  deinit {
    cancellables.forEach { $0.cancel() }
    cancellables.removeAll()
  }
}
