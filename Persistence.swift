//
//  Persistence.swift
//  Projekt
//
//  Created by student on 13/06/2023.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        let c : [String] = ["PLN", "EUR", "USD", "GBP"]
        var curr : [Currency] = []
        let pv : [Float] = [1.00, 4.73, 4.10, 5.69]
        for i in 0..<pv.count {
            let newCurr = Currency(context: viewContext)
            curr.append(newCurr)
            newCurr.name = c[i]
        }
        for i in 0..<c.count {
            for j in 0..<c.count {
                let newPV = PairValue(context: viewContext)
                newPV.buying_currency = c[i]
                newPV.selling_currency = c[j]
                newPV.value = pv[i] / pv[j]
            }
        }
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = true) {
        container = NSPersistentContainer(name: "Projekt")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
