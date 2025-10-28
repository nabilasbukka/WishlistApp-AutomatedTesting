//
//  WishModel.swift
//  WishlistApp-AutomatedTesting
//
//  Created by Nabila Putri Syafrina Bukka on 28/10/25.
//

import Foundation
import SwiftData

@Model
class Wish {
  var title: String
  
  init(title: String) {
    self.title = title
  }
}
