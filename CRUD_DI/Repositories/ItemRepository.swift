//
//  ItemRepository.swift
//  CRUD_DI
//
//  Created by Mahdi Mirzaei on 7/25/23.
//

import Foundation
import SQLite

class ItemRepository: PItem{
    
    var db : Connection? = nil
    var itemsTb: Table? = nil
    
    init() {
        self.db = AppDataStore.shared.db
        self.itemsTb = AppDataStore.shared.Tasks
    }
    
    func Get() -> [Item] {
        var items: [Item] = []
        guard let database = db else { return [] }

        do {
            for item in try database.prepare(itemsTb!) {
                items.append(Item(id: item[ItemDbModel.id], stringEx: item[ItemDbModel.stringEx],
                                  dateEx: item[ItemDbModel.dateEx], boolEx: item[ItemDbModel.boolEx]))
            }
        } catch {
            print(error)
        }
        return items

    }
    
    func Get(id: Int64) -> Item? {
        var item: Item = Item(id: id, stringEx: "", dateEx: Date(), boolEx: false)
        guard let database = db else { return nil }

        if let items = itemsTb
        {
            let filter = items.filter(ItemDbModel.id == id)
            do {
                for i in try database.prepare(filter) {
                    item.stringEx = i[ItemDbModel.stringEx]
                    item.dateEx = i[ItemDbModel.dateEx]
                    item.boolEx = i[ItemDbModel.boolEx]
                }
            } catch {
                print(error)
            }
            return item

        } else {
            return nil
        }
    }
    
    func Insert(model: Item) -> Int64? {
        guard let database = db else { return nil }

        if let items = itemsTb {
            
            let insert = items.insert(ItemDbModel.stringEx <- model.stringEx,
                                      ItemDbModel.dateEx <- model.dateEx,
                                      ItemDbModel.boolEx <- model.boolEx)
            do {
                let rowID = try database.run(insert)
                return rowID
            } catch {
                print(error)
                return nil
            }

        } else {
            return nil
        }
    }
    
    func Update(id: Int64, model: Item) -> Bool {
        guard let database = db else { return false }
        
        if let items = itemsTb {
            
            let item = items.filter(ItemDbModel.id == id)
            do {
                let update = item.update([
                    ItemDbModel.stringEx <- model.stringEx,
                    ItemDbModel.dateEx <- model.dateEx,
                    ItemDbModel.boolEx <- model.boolEx
                ])
                if try database.run(update) > 0 {
                    return true
                }
            } catch {
                print(error)
            }
            return false
            
        } else {
            return false
        }
    }
    
    func Delete(id: Int64) -> Bool {
        guard let database = db else {
            return false
        }
        do {
            if let items = itemsTb{
                let filter = items.filter(ItemDbModel.id == id)
                try database.run(filter.delete())
                return true
            } else {
                return false
            }
        } catch {
            print(error)
            return false
        }
    }
}
