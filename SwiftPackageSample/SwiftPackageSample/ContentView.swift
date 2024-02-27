//
//  ContentView.swift
//  SwiftPackageSample
//
//  Created by Tomas Trujillo on 2024-02-05.
//

import SwiftUI
import BuiltTomPackage

enum ContentState {
  case success(String)
  case error(String)
}

final class ContentViewModel: ObservableObject {
  @Published var email: String = ""
  @Published var password: String = ""
  @Published var state: ContentState?
  private var messages: [String] = [
    "Hello World",
    "Coding with Tom",
    "Swift",
    "Swift Packages"
  ]
  
  func getMessageForIndex(_ index: Int) -> String {
    messages[safe: index] ?? "Please select a valid index"
  }
  
  func signUpUser() {
    BuiltTomPackageInstance.shared.signUp(email: email, password: password) {
      if $0 {
        Task {
          await self.updateMessage(isSuccess: true, action: "created")
        }
      } else {
        Task {
          await self.updateMessage(isSuccess: false, action: "creation")
        }
      }
    }
  }
  
  func signInUser() {
    BuiltTomPackageInstance.shared.signIn(email: email, password: password) {
      if $0 {
        Task {
          await self.updateMessage(isSuccess: true, action: "signed in")
        }
      } else {
        Task {
          await self.updateMessage(isSuccess: false, action: "login")
        }
      }
    }
  }
  
  @MainActor
  private func updateMessage(isSuccess: Bool, action: String) {
    if isSuccess {
      state = .success("Successfully \(action) the user")
    } else {
      state = .error("There was an error with the \(action) of the user")
    }
  }
}

struct ContentView: View {
  @StateObject private var viewModel = ContentViewModel()
  @State private var index: Int = 0
  var body: some View {
    VStack {
      fields
      Spacer()
      Text(viewModel.getMessageForIndex(index))
      Stepper("Message # \(index)", value: $index)
      LottieViewWrapper()
    }
    .padding()
  }
  
  private var fields: some View {
    VStack(spacing: 20) {
      HStack {
        Text("Email")
        TextField("", text: $viewModel.email)
          .textFieldStyle(.roundedBorder)
      }
      HStack {
        Text("Password")
        TextField("", text: $viewModel.password)
          .textFieldStyle(.roundedBorder)
      }
      if let state = viewModel.state {
        getStateMessage(for: state)
      }
      HStack {
        Spacer()
        Button(action: { viewModel.signInUser() }) {
          Text("Sign In")
        }
        Spacer()
        Button(action: { viewModel.signUpUser() }) {
          Text("Sign Up")
        }
        Spacer()
      }
    }
  }
  
  @ViewBuilder
  private func getStateMessage(for state: ContentState) -> some View {
    switch state {
    case .success(let message):
      Text(message)
        .font(.headline)
        .foregroundStyle(Color.green)
    case .error(let message):
      Text(message)
        .font(.headline)
        .foregroundStyle(Color.red)
    }
  }
}

#Preview {
  ContentView()
}
