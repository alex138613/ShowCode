//
//  CDManager.swift
//  Convertor
//
//  Created by Alex on 10.04.2023.
//  Copyright © 2023 Alex. All rights reserved.
//

import CoreData


final class CDManager {

    private let modelName: String = "Model"


    static var sharedinstance: CDManager = {
        let instance = CDManager()
        return instance
    }()


    lazy var managedContext: NSManagedObjectContext = {
        let moc = storeContainer.viewContext
        return moc
    }()


    lazy var storeContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: modelName)
        container.loadPersistentStores { storeDescription, error in

            if let nserror = error as? NSError {
                let str = "Unresolved *** STORE CONTAINER *** error: \(nserror), userInfo: \(nserror.userInfo)"
                print(#function, str)
            }
            container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
            container.viewContext.automaticallyMergesChangesFromParent = true
        }
        return container
    }()
}
