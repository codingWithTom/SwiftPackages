//
//  AuthenticationAdapter.swift
//  BuiltTomPackage
//
//  Created by Tomas Trujillo on 2024-02-26.
//

import Foundation

public protocol AuthenticationAdapter {
  func configure()
  func signIn(email: String, password: String, completion: @escaping (Bool) -> Void)
  func signUp(email: String, password: String, completion: @escaping (Bool) -> Void)
}
