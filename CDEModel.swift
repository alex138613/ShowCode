//
//  CDEModel.swift
//  Convertor
//
//  Created by Alex on 09.04.2023.
//  Copyright © 2023 Alex. All rights reserved.
//

import CoreData


final class CDEModel: CDEngine {

    static var sharedinstanceModel: CDEModel = {
        let instance = CDEModel()
        return instance
    }()


    private func save(data: StateModel, moc: NSManagedObjectContext) {
        let value = ModelCD(entity: ModelCD.entity(), insertInto: moc)

        value.indexKey = Int16(data.indexKey)
        value.indexKeyName = data.indexKeyName

        value.inputIndexValue = Int16(data.inputIndexValue)
        value.inputVal = data.inputVal

        value.oldIndexValue = Int16(data.oldIndexValue)
        value.newIndexValue = Int16(data.newIndexValue)

        value.oldVal = data.oldVal
        value.val = data.newVal
    }

    func update(data: StateModel, moc: NSManagedObjectContext) {
        let indexKeyName = data.indexKeyName
        let predicate = NSPredicate(format: "%K == %@", #keyPath(ModelCD.indexKeyName), indexKeyName)

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ModelCD")
        fetchRequest.predicate = predicate

        do {
            let results = try? moc.fetch(fetchRequest)
            let values = results as? [ModelCD]

            if let value = values?.first {
                value.indexKey = Int16(data.indexKey)
                value.indexKeyName = data.indexKeyName

                value.inputIndexValue = Int16(data.inputIndexValue)
                value.inputVal = data.inputVal

                value.oldIndexValue = Int16(data.oldIndexValue)
                value.newIndexValue = Int16(data.newIndexValue)

                value.oldVal = data.oldVal
                value.val = data.newVal

            } else {
                save(data: data, moc: moc)
            }


            if moc.hasChanges {
                try? moc.save()
            }


        } catch let nserror as NSError {
            let str = "Error userInfo: \(nserror.userInfo)"
            print(#function, str)
        }
    }


    func read(moc: NSManagedObjectContext) -> [ModelCD] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ModelCD")

        do {
            let results = try? moc.fetch(fetchRequest)
            return results as? [ModelCD] ?? []

        } catch let nserror as NSError {
            let str = "Error userInfo: \(nserror.userInfo)"
            print(#function, str)
        }
    }
}
