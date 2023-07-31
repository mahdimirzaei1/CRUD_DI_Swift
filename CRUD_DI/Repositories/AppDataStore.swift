//
//  AppDataStore.swift
//  CRUD_DI
//
//  Created by Mahdi Mirzaei on 7/25/23.
//

import SQLite
import Foundation

class AppDataStore{
    static let DIR_DB = "CRUD_DI_DB"
    static let STORE_NAME = "App.sqlite3"
    
    private let tasks = Table("items")
    public var Tasks: Table {
        get{
            return tasks
        }
    }
    
    static let shared = AppDataStore()
    
    public var db: Connection? = nil
    
    private init() {
        if let docDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let dirPath = docDir.appendingPathComponent(Self.DIR_DB)
            
            do{
                try FileManager.default.createDirectory(atPath: dirPath.path, withIntermediateDirectories: true, attributes: nil)
                
                let dbPath = NSSearchPathForDirectoriesInDomains(
                    .documentDirectory, .userDomainMask, true
                ).first!

                db = try Connection("\(dbPath)/db.sqlite3")
                
                createTables()
                print("SQLiteDateStore init successfully at: \(dbPath)")
            } catch {
                db = nil
                print("SQLiteDateStore init error: \(error)")
            }
        } else {
            db = nil
        }
    }
    
    private func createTables() {
        guard let database = db else {
            return
        }
        do {
            try database.run(ItemDbModel.CreateQuery(table: tasks))
        } catch {
            print(error)
        }
    }
}
