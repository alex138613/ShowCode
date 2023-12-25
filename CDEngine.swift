//
//  CDEngine.swift
//  Convertor
//
//  Created by Alex on 10.04.2023.
//  Copyright © 2023 Alex. All rights reserved.
//

import CoreData


class CDEngine {

    var moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    var storeContainer: NSPersistentContainer!


    static var sharedinstance: CDEngine = {
        let instance = CDEngine()
        return instance
    }()

    init() {
        moc = CDManager.sharedinstance.managedContext
        storeContainer = CDManager.sharedinstance.storeContainer
    }
}
