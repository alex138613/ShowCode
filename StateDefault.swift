//
//  StateDefault.swift
//  Convertor
//
//  Created by Alex on 10.04.2023.
//  Copyright © 2023 Alex. All rights reserved.
//

import Foundation


final class StateDefault {

    static private let key = "indexName"
    static private let color = "indexColor"


    static func readDefaultKey() -> String? {
        guard let value = UserDefaults.standard.value(forKey: key) as? String else { return nil }
        return value
    }

    static func saveDefaultKey(_ indexName: String) {
        let valueDefault = UserDefaults.standard
        valueDefault.setValue(indexName, forKey: key)
        valueDefault.synchronize()
    }


    static func readDefaultColor() -> Int {
        guard let value = UserDefaults.standard.value(forKey: color) as? Int else { return 0 }
        return value
    }

    static func saveDefaultColor(_ indexColor: Int) {
        let valueDefault = UserDefaults.standard
        valueDefault.setValue(indexColor, forKey: color)
        valueDefault.synchronize()
    }
}
