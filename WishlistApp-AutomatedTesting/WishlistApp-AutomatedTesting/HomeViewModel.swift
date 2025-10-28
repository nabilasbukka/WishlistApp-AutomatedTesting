//
//  HomeViewModel.swift
//  WishlistApp-AutomatedTesting
//
//  Created by Nabila Putri Syafrina Bukka on 28/10/25.
//

import Foundation
import SwiftData

@Observable
final class HomeViewModel {
    var isAlertShowing = false
    var title = ""
    var wishes: [Wish] = []
    
    private let wishRepository: WishRepository
    
    init(wishRepository: WishRepository) {
        self.wishRepository = wishRepository
    }
    
    func fetchWishes() {
        self.wishes = wishRepository.fetchWishes()
    }
    
    func addWish() {
        let wish: Wish = Wish(title: title)
        wishRepository.insert(wish)
        
        fetchWishes()
        self.title = ""
    }
    
    func deleteWish(_ wish: Wish) {
        wishRepository.delete(wish)
        
        fetchWishes()
    }

    // MARK: - Helpers for View
    func hasWishes() -> Bool { !wishes.isEmpty }

    func counterText() -> String {
        "\(wishes.count) wish\(wishes.count > 1 ? "es" : "")"
    }
}

protocol WishRepository {
    func fetchWishes() -> [Wish]
    func insert(_ wish: Wish)
    func delete(_ wish: Wish)
}

class InMemoryWishRepository: WishRepository {
    private var storage: [Wish] = []
    
    func fetchWishes() -> [Wish] { storage }
    
    func insert(_ wish: Wish) {
        storage.append(wish)
    }
    
    func delete(_ wish: Wish) {
        if let index = storage.firstIndex(of: wish) {
            storage.remove(at: index)
        }
    }
}
