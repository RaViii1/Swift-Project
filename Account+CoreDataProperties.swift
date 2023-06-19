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
    
    @NSManaged public var toAccount: NSSet?

    public var accountArray: [Account] {
        let set = toAccount as? Set<Account> ?? []
        
        return set.sorted{
            $0.user! < $1.user!
        }

    }

}

extension Account : Identifiable {

}
