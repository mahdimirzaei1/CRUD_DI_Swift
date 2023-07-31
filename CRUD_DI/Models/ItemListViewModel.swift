//
//  ItemListViewModel.swift
//  CRUD_DI
//
//  Created by Mahdi Mirzaei on 7/25/23.
//

import Foundation
import UIPilot

class ItemListViewModel: ObservableObject {

    private let items: any PItem
    
    let AppPilot: UIPilot<AppRoute>
    
    @Published var _Items: [Item] = []
    
    init(appPilot: UIPilot<AppRoute>, itemRepo: any PItem) {
        self.AppPilot = appPilot
        self.items = itemRepo
    }
    
    func GetItemList(){
        _Items = items.Get()
    }
    
    func DeleteItem(at index: IndexSet) {
        let id = index.map { self._Items[$0].id }.first
        if let id = id {
            let delete = items.Delete(id: id!)
            if delete {
                GetItemList()
            }
        }
    }
    
    /// Events
    func OnAdd(){
        AppPilot.push(.Insert)
    }
}
