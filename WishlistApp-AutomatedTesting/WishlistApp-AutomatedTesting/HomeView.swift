//
//  HomeView.swift
//  WishlistApp-AutomatedTesting
//
//  Created by Nabila Putri Syafrina Bukka on 28/10/25.
//

import SwiftUI

struct HomeView: View {
    @State private var viewModel: HomeViewModel = HomeViewModel(wishRepository: InMemoryWishRepository())
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.wishes) { wish in
                    Text(wish.title)
                        .font(.title.weight(.light))
                        .padding(.vertical, 2)
                        .swipeActions {
                            Button("Delete", role: .destructive) {
                                viewModel.deleteWish(wish)
                            }
                        }
                }
            }
            .navigationTitle("Wishlist")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button { viewModel.isAlertShowing.toggle() } label: {
                        Image(systemName: "plus").imageScale(.large)
                    }
                    .accessibilityIdentifier("addButton")
                }
                
                if viewModel.hasWishes() {
                    ToolbarItem(placement: .bottomBar) {
                        Text(viewModel.counterText())
                    }
                }
            }
            .alert("Create a new wish", isPresented: $viewModel.isAlertShowing) {
                TextField("Enter a wish", text: $viewModel.title)
                Button("Save") { viewModel.addWish() }
            }
            .overlay {
                if viewModel.wishes.isEmpty {
                    ContentUnavailableView(
                        "My Wishlist",
                        systemImage: "heart.circle",
                        description: Text("No wishes yet. Add one to get started.")
                    )
                    .accessibilityElement(children: .contain)
                    .accessibilityIdentifier("emptyState")
                }
            }
        }
    }
}
#Preview {
    HomeView()
}
