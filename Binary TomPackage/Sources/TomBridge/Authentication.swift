//
//  File.swift
//  
//
//  Created by Tomas Trujillo on 2024-02-26.
//

import Foundation
import BuiltTomPackage
import Firebase
import FirebaseAuth

final class AuthenticationImplementation: AuthenticationAdapter {
  func configure() {
    FirebaseApp.configure()
  }
  
  func signIn(email: String, password: String, completion: @escaping (Bool) -> Void) {
    Auth.auth().signIn(withEmail: email, password: password) { result, _ in
      if result != nil {
        completion(true)
      } else {
        completion(false)
      }
    }
  }
  
  func signUp(email: String, password: String, completion: @escaping (Bool) -> Void) {
    Auth.auth().createUser(withEmail: email, password: password) { result, _ in
      if result != nil {
        completion(true)
      } else {
        completion(false)
      }
    }
  }
}

public class TomAuthentication {
  public static func configure() {
    BuiltTomPackageInstance.shared.configure(adapter: AuthenticationImplementation())
  }
}
