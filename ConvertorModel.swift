//
//  ConvertorModel.swift
//  Convertor
//
//  Created by Alex on 04.04.2023.
//  Copyright © 2023 Alex. All rights reserved.
//

import Foundation


struct ConvertorModel {

    let rows: Int
    var currentKeyRow: Int
    var currentValueRow: Int

    var key_array           : [String] = []
    var key_arrayLocalize   : [String] = []
    var dictPicker          : [String : [String]] = [:]
    var dictPickerLocalize  : [String : [String]] = [:]
    var dict                : [String: StateModel] = [:]


    init(rows: Int = 2, currentKeyRow: Int = 0, currentValueRow: Int = 0) {
        self.rows = rows
        self.currentKeyRow = currentKeyRow
        self.currentValueRow = currentValueRow

        createData()
    }
}


extension ConvertorModel {

    private mutating func createData() {
        let comment = "Picker key"

        ListModels.allCases.forEach { i in
            let key = i.rawValue
            let keyL = NSLocalizedString(key.capitalized, comment: comment)

            key_array.append(key)
            key_arrayLocalize.append(keyL)

            dictPicker[key] = i.values
            dictPickerLocalize[key] = i.valuesLocalize
        }
    }
}


extension ConvertorModel {

    var valueArray: [String] {
        get {
            return dictPicker[currentKey] ?? []
        }
    }

    var valueArrayLocalize: [String] {
        get {
            return dictPickerLocalize[currentKey] ?? []
        }
    }


    var currentKeyLocalize: String {
        get {
            return key_arrayLocalize[currentKeyRow]
        }
    }

    var currentKey: String {
        get {
            return key_array[currentKeyRow]
        }
    }

    var lastIntex: Int {
        get {
            let size = valueArrayLocalize.count
            return size == 0 ? 0 : size - 1
        }
    }


    var currentValFromDict: StateModel? {
        get {
            return dict[currentKey]
        }
    }

    var getKeyIconName: String? {
        get {
            return currentKey.lowercased()
        }
    }
}
