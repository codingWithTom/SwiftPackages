//
//  Instance.swift
//  BuiltTomPackage
//
//  Created by Tomas Trujillo on 2024-02-26.
//

import Foundation

public final class BuiltTomPackageInstance {
  public static var shared = BuiltTomPackageInstance()
  var adapter: AuthenticationAdapter?
  private init() { }
  
  public func configure(adapter: AuthenticationAdapter) {
    adapter.configure()
    self.adapter = adapter
  }
  
  public func signIn(email: String, password: String, completion: @escaping (Bool) -> Void) {
    adapter?.signIn(email: email, password: password, completion: completion)
  }
  
  public func signUp(email: String, password: String, completion: @escaping (Bool) -> Void) {
    adapter?.signUp(email: email, password: password, completion: completion)
  }
}
