//
//  File.swift
//  
//
//  Created by Tomas Trujillo on 2024-02-13.
//

import Foundation

public extension Array {
  subscript(safe index: Int) -> Element? {
    guard index >= 0, index < self.count else { return nil }
    return self[index]
  }
}
