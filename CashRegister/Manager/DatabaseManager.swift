//
//  DatabaseManager.swift
//  CashRegister
//
//  Created by akuraru on 2018/06/10.
//  Copyright © 2018年 akuraru. All rights reserved.
//

import Foundation
import RealmSwift

struct DatabaseManager {
    static func shared() -> DatabaseManager {
        return ApplicationManager.shared.database
    }
    
    func orderCheckout() -> Checkout {
        let realm = try! Realm()
        let checkout = Checkout(with: realm)
        return checkout
    }
    func write(_ checkout: Checkout) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(checkout)
        }
    }
}
