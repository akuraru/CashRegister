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
        if let checkout = realm.objects(Checkout.self).filter("state = %d", Checkout.State.order.rawValue).first {
            return checkout
        } else {
            let checkout = Checkout(with: realm)
            try! realm.write {
                realm.add(checkout)
            }
            return checkout
        }
    }
}
