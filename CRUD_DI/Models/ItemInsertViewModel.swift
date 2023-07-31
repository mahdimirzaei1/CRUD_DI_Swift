//
//  ItemInsertViewModel.swift
//  CRUD_DI
//
//  Created by Mahdi Mirzaei on 7/25/23.
//

import Foundation
import UIPilot

class ItemInsertViewModel: ObservableObject {
    
    private let items: any PItem
    private let appPilot: UIPilot<AppRoute>
    
    @Published var _ItemString: String = ""
    @Published var _ItemDate: Date = Date()
    @Published var _ItemBool: Bool = Bool()
    
    init(appPilot: UIPilot<AppRoute>, itemRepo: any PItem) {
        self.appPilot = appPilot
        self.items = itemRepo
    }

    /// Events
    func OnInsert() {
        let item = Item(id: nil, stringEx: _ItemString, dateEx: _ItemDate, boolEx: _ItemBool)
        let id =  items.Insert(model: item)
        if id != nil {
           appPilot.pop()
        }
    }
}
