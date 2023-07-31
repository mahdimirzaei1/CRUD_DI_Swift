//
//  PGeneric.swift
//  CRUD_DI
//
//  Created by Mahdi Mirzaei on 7/25/23.
//

public protocol PGeneric {
    associatedtype T

    func Get() -> [T]
    func Get(id: Int64) -> T?
    func Insert(model: T) -> Int64?
    func Update(id: Int64, model: T) -> Bool
    func Delete(id: Int64) -> Bool
}
