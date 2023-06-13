//
//  Account+CoreDataProperties.swift
//  Projekt
//
//  Created by student on 13/06/2023.
//
//

import Foundation
import CoreData


extension Account {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Account> {
        return NSFetchRequest<Account>(entityName: "Account")
    }

    @NSManaged public var user: String?
    @NSManaged public var currency: String?
    @NSManaged public var amount: Float
    @NSManaged public var toUser: User?
    @NSManaged public var toCurrency: Currency?

}

extension Account : Identifiable {

}
