//
//  StateModel.swift
//  Convertor
//
//  Created by Alex on 21.04.2023.
//  Copyright © 2023 Alex. All rights reserved.
//

import Foundation


struct StateModel {

    var indexKey: Int
    var indexKeyName: String

    var inputIndexValue: Int
    var inputVal: Double

    var oldIndexValue: Int
    var newIndexValue: Int

    var oldVal: Double
    var newVal: Double




    init(indexKey: Int = 0,
         indexKeyName: String,
         inputIndexValue: Int = 0,
         inputVal: Double = 0,
         oldIndexValue: Int = 0,
         newIndexValue: Int = 0,
         oldVal: Double = 0,
         newVal: Double = 0) {

        self.indexKey = indexKey
        self.indexKeyName = indexKeyName
        self.inputIndexValue = inputIndexValue
        self.inputVal = inputVal
        self.oldIndexValue = oldIndexValue
        self.newIndexValue = newIndexValue
        self.oldVal = oldVal
        self.newVal = newVal
    }
}


extension StateModel {

    var isTemperature: Bool {
        get {
            return indexKeyName == ListModels.temperature.rawValue
        }
    }
}
