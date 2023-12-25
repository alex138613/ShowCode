//
//  LayerSave.swift
//  Convertor
//
//  Created by Alex on 10.04.2023.
//  Copyright © 2023 Alex. All rights reserved.
//

import Foundation
import CoreData


final class LayerSave {

    func readDefaultColor() -> Int {
        return StateDefault.readDefaultColor()
    }

    func saveDefaultColor(_ index: Int) {
        StateDefault.saveDefaultColor(index)
    }


    func readDefaultKey() -> String? {
        return StateDefault.readDefaultKey()
    }

    func saveDefaultKey(_ key: String) {
        StateDefault.saveDefaultKey(key)
    }




    func readDB() -> [String: StateModel] {
        let moc = CDEModel.sharedinstanceModel.moc
        let list = CDEModel.sharedinstanceModel.read(moc: moc)

        var dict = [String: StateModel]()
        list.forEach { i in
            if let key = i.indexKeyName {
                dict[key] = StateModel(indexKey: Int(i.indexKey),
                                   indexKeyName: key,
                                   inputIndexValue: Int(i.inputIndexValue),
                                   inputVal: i.inputVal,
                                   oldIndexValue: Int(i.oldIndexValue),
                                   newIndexValue: Int(i.newIndexValue),
                                   oldVal: i.oldVal,
                                   newVal: i.val)
            }
        }

        return dict
    }

    func updateDB(_ state: StateModel) {
        let moc = CDEModel.sharedinstanceModel.moc
        CDEModel.sharedinstanceModel.update(data: state, moc: moc)
    }
}
