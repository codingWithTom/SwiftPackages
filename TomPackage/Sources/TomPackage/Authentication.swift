//
//  File.swift
//  
//
//  Created by Tomas Trujillo on 2024-02-26.
//

import Foundation
import FirebaseAuth
import Firebase

public class TomAuthentication {
  public static func configure() {
    FirebaseApp.configure()
  }
  
  public static func signIn(email: String, password: String, completion: @escaping (Bool) -> Void) {
    Auth.auth().signIn(withEmail: email, password: password) { result, _ in
      if result != nil {
        completion(true)
      } else {
        completion(false)
      }
    }
  }
  
  public static func signUp(email: String, password: String, completion: @escaping (Bool) -> Void) {
    Auth.auth().createUser(withEmail: email, password: password) { result, _ in
      if result != nil {
        completion(true)
      } else {
        completion(false)
      }
    }
  }
}

