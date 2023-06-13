//
//  Currency+CoreDataProperties.swift
//  Projekt
//
//  Created by student on 13/06/2023.
//
//

import Foundation
import CoreData


extension Currency {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Currency> {
        return NSFetchRequest<Currency>(entityName: "Currency")
    }

    @NSManaged public var name: String?
    @NSManaged public var toPairBuy: PairValue?
    @NSManaged public var toPairSell: PairValue?
    @NSManaged public var toAccount: Account?
    
    @NSManaged public var toCurrency: NSSet?

    public var currencyArray: [Currency] {
        let set = toCurrency as? Set<Currency> ?? []
        
        return set.sorted{
            $0.name! < $1.name!
        }

    }

}

extension Currency : Identifiable {

}
