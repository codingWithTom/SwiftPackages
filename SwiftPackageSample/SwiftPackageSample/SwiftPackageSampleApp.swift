//
//  SwiftPackageSampleApp.swift
//  SwiftPackageSample
//
//  Created by Tomas Trujillo on 2024-02-05.
//

import SwiftUI
import TomBridge

@main
struct SwiftPackageSampleApp: App {
  init() {
    TomAuthentication.configure()
  }
  
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}
