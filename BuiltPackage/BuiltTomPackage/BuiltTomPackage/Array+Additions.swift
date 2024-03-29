//
//  Array+Additions.swift
//  BuiltTomPackage
//
//  Created by Tomas Trujillo on 2024-02-12.
//

import Foundation

public extension Array {
  subscript(safe index: Int) -> Element? {
    guard index >= 0 && index < count else { return nil }
    return self[index]
  }
}
