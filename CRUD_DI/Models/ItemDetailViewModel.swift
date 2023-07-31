//
//  ItemDetailViewModel.swift
//  CRUD_DI
//
//  Created by Mahdi Mirzaei on 7/25/23.
//

import Foundation
import UIPilot

class ItemDetailViewModel: ObservableObject {
    
    private let items: any PItem
    private let appPilot: UIPilot<AppRoute>
    
    var Id: Int64
    var CurrentItem: Item?

    @Published var _ItemString: String = ""
    @Published var _ItemDate: Date = Date()
    @Published var _ItemBool: Bool = Bool()


    init(id: Int64, appPilot: UIPilot<AppRoute>, itemRepo: any PItem) {
        self.Id = id
        self.appPilot = appPilot
        self.items = itemRepo
        GetItem()
    }

    func GetItem() {
        CurrentItem = items.Get(id: Id)
        _ItemString = CurrentItem?.stringEx ?? ""
        _ItemDate = CurrentItem?.dateEx ?? Date()
        _ItemBool = CurrentItem!.boolEx
    }
    
    /// Events    
    func OnEdit() {
        let item = Item(id: Id, stringEx: _ItemString, dateEx: _ItemDate, boolEx: _ItemBool)
        let update = items.Update(id: Id, model: item)
            if update {
                appPilot.pop()
            }
    }
}
