//
//  PairValue+CoreDataProperties.swift
//  Projekt
//
//  Created by student on 13/06/2023.
//
//

import Foundation
import CoreData


extension PairValue {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PairValue> {
        return NSFetchRequest<PairValue>(entityName: "PairValue")
    }

    @NSManaged public var buying_currency: String?
    @NSManaged public var selling_currency: String?
    @NSManaged public var value: Float
    @NSManaged public var buy_curr: Currency?
    @NSManaged public var sell_curr: Currency?
    
    @NSManaged public var toPairValue: NSSet?

    public var pairvalueArray: [PairValue] {
        let set = toPairValue as? Set<PairValue> ?? []
        
        return set.sorted {
            ($0.buy_curr?.name)! > ($1.buy_curr?.name)!
        }

    }

}

extension PairValue : Identifiable {

}
