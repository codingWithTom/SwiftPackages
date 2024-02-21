//
//  ContentView.swift
//  SwiftPackageSample
//
//  Created by Tomas Trujillo on 2024-02-05.
//

import SwiftUI
import BuiltTomPackage

final class ContentViewModel: ObservableObject {
  private var messages: [String] = [
    "Hello World",
    "Coding with Tom",
    "Swift",
    "Swift Packages"
  ]
  
  func getMessageForIndex(_ index: Int) -> String {
    messages[safe: index] ?? "Please select a valid index"
  }
}

struct ContentView: View {
  @StateObject private var viewModel = ContentViewModel()
  @State private var index: Int = 0
  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
      Text(viewModel.getMessageForIndex(index))
      Stepper("Message # \(index)", value: $index)
      LottieViewWrapper()
    }
    .padding()
  }
}

#Preview {
  ContentView()
}
