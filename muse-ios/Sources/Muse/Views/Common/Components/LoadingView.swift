//
//  LoadingView.swift
//  Algolab
//
//  Created by Kyle Thompson on 6/25/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
      VStack {
        LottieView(filename: "loading")
          .frame(width: 100, height: 100)
      }
    }
}

#if DEBUG
struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
#endif
