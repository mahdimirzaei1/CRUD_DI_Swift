//
//  ItemDbModel.swift
//  CRUD_DI
//
//  Created by Mahdi Mirzaei on 7/25/23.
//

import Foundation
import SQLite

struct ItemDbModel{
    public static let id = Expression<Int64>("id")
    public static let stringEx = Expression<String>("stringEx")
    public static let dateEx = Expression<Date>("dateEx")
    public static let boolEx = Expression<Bool>("boolEx")
    
    public static func CreateQuery (table: Table) -> String
    {
        table.create {
            table in
            table.column(ItemDbModel.id, primaryKey: .autoincrement)
            table.column(ItemDbModel.stringEx)
            table.column(ItemDbModel.dateEx)
            table.column(ItemDbModel.boolEx)
        }
    }
}
