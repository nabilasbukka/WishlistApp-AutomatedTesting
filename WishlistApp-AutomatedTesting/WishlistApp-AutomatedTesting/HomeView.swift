//
//  HomeView.swift
//  WishlistApp-AutomatedTesting
//
//  Created by Nabila Putri Syafrina Bukka on 28/10/25.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var wishes: [Wish]
    
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        NavigationStack {
            List {
                ForEach(wishes) { wish in
                    Text(wish.title)
                        .font(.title.weight(.light))
                        .padding(.vertical, 2)
                        .swipeActions {
                            Button("Delete", role: .destructive) {
                                viewModel.delete(wish, using: modelContext)
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
                }

                if viewModel.hasWishes(wishes) {
                    ToolbarItem(placement: .bottomBar) {
                        Text(viewModel.counterText(for: wishes))
                    }
                }
            }
            .alert("Create a new wish", isPresented: $viewModel.isAlertShowing) {
                TextField("Enter a wish", text: $viewModel.title)
                Button("Save") { viewModel.addWish(using: modelContext) }
            }
            .overlay {
                if wishes.isEmpty {
                    ContentUnavailableView(
                        "My Wishlist",
                        systemImage: "heart.circle",
                        description: Text("No wishes yet. Add one to get started.")
                    )
                }
            }
        }
    }
}
#Preview {
    HomeView()
}
