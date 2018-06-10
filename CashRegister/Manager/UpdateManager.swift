//
//  UpdateManager.swift
//  CashRegister
//
//  Created by akuraru on 2018/06/10.
//  Copyright © 2018年 akuraru. All rights reserved.
//

import Foundation

struct UpdateManager {
    static func shared() -> UpdateManager {
        return ApplicationManager.shared.update
    }
    
    func update() -> Bool {
        let application = applicationVersion()
        let last = self.lastVersion()
        self.set(lastVersion: application)
        return application != last
    }
    
    func applicationVersion() -> String {
        guard let version: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String else {
            fatalError()
        }
        return version
    }
    
    func lastVersion() -> String? {
        return UserDefaults.standard.string(forKey: "version") as String?
    }
    
    func set(lastVersion: String) {
        let defaults = UserDefaults.standard
        defaults.set(lastVersion, forKey: "version")
        defaults.synchronize()
    }
}
