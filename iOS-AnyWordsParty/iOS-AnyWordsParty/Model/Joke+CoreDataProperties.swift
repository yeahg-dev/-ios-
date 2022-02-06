//
//  Joke+CoreDataProperties.swift
//  iOS-AnyWordsParty
//
//  Created by 1 on 2022/02/03.
//
//

import Foundation
import CoreData


extension Joke {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Joke> {
        return NSFetchRequest<Joke>(entityName: "Joke")
    }
    
    // Entity가 활용하는 프로퍼티
    @NSManaged public var body: String?
    @NSManaged public var category: String?
    @NSManaged public var id: UUID?


}

extension Joke : Identifiable {

}
