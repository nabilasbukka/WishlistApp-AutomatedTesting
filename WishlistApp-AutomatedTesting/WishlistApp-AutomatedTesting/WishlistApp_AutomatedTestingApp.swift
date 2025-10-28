//
//  WishlistApp_AutomatedTestingApp.swift
//  WishlistApp-AutomatedTesting
//
//  Created by Nabila Putri Syafrina Bukka on 28/10/25.
//

import SwiftUI
import SwiftData

@main
struct WishlistApp: App {
  var body: some Scene {
    WindowGroup {
      HomeView()
        .modelContainer(for: Wish.self)
    }
  }
}
