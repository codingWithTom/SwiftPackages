//
//  SwiftUIView.swift
//  
//
//  Created by Tomas Trujillo on 2024-02-13.
//

import SwiftUI
import Lottie

public struct LottieViewWrapper: View {
  public init() { }
  public var body: some View {
    if let resourcePath = Bundle.module.path(forResource: "Animation", ofType: "json") {
      LottieView(animation: .filepath(resourcePath))
        .playbackMode(.playing(.fromProgress(0, toProgress: 1, loopMode: .loop)))
    } else {
      Text("Lottie asset not loaded")
    }
    
  }
}
