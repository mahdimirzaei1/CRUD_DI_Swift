//
//  CRUD_DIApp.swift
//  CRUD_DI
//
//  Created by Mahdi Mirzaei on 7/31/23.
//

import SwiftUI
import UIPilot

@main
struct CRUD_DIApp: App {
    private let pilot: UIPilot<AppRoute>
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    init() {
        pilot = .init(initial: .List)
    }
    
    // Create an object of itme repository to be injected
    let items = ItemRepository()
    var body: some Scene {
        WindowGroup {
            UIPilotHost(pilot){ route in
                switch route {
                case .List:
                    // Injecting repository for each view
                    AnyView(ItemListView(viewModel: ItemListViewModel(appPilot: pilot, itemRepo: items)))
                case .Insert:
                    AnyView(ItemInsertView(viewModel: ItemInsertViewModel(appPilot: pilot, itemRepo: items)))
                case .Detail(let id):
                    AnyView(ItemDetailView(viewModel: ItemDetailViewModel(id: id, appPilot: pilot, itemRepo: items)))
                }
            }
        }
    }
}


