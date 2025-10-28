//
//  HomeViewModel.swift
//  WishlistApp-AutomatedTesting
//
//  Created by Nabila Putri Syafrina Bukka on 28/10/25.
//

import Foundation
import SwiftData
import Combine

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var isAlertShowing = false
    @Published var title = ""

    func addWish(using context: ModelContext) {
        let trimmed = title.trimmingCharacters(in: .whitespacesAndNewlines)
        guard trimmed.isEmpty == false else { return }
        context.insert(Wish(title: trimmed))
        title = ""
    }

    func delete(_ wish: Wish, using context: ModelContext) {
        context.delete(wish)
    }

    // MARK: - Helpers for View
    func hasWishes(_ wishes: [Wish]) -> Bool { !wishes.isEmpty }

    func counterText(for wishes: [Wish]) -> String {
        "\(wishes.count) wish\(wishes.count > 1 ? "es" : "")"
    }
}
