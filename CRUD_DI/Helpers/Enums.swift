//
//  Equatables.swift
//  StoringBuddy
//
//  Created by Mahdi Mirzaei on 7/25/23.
//

import Foundation


enum AppRoute: Equatable {
    case List
    case Insert
    case Detail(id: Int64)
}
