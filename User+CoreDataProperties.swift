//
//  User+CoreDataProperties.swift
//  Projekt
//
//  Created by student on 13/06/2023.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var password: String?
    @NSManaged public var toAccount: Account?

}

extension User : Identifiable {

}
