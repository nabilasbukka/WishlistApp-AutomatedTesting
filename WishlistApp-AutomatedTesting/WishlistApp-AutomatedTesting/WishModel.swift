//
//  WishModel.swift
//  WishlistApp-AutomatedTesting
//
//  Created by Nabila Putri Syafrina Bukka on 28/10/25.
//

import Foundation

struct Wish: Identifiable, Equatable {
    var id = UUID().uuidString
    var title: String
    
    init(title: String) {
        self.title = title
    }
}
