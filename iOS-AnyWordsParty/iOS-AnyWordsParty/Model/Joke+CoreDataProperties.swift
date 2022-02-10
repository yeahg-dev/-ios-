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
    // entityName에 해당하는 모든 entity의 인스턴스(Joke타입)을 fetch하는 NSFetchRequest를 만드는 메서드
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Joke> {
        return NSFetchRequest<Joke>(entityName: "Joke")
    }
    
    @nonobjc public class func fetchRequest(of uuid: UUID) -> NSFetchRequest<NSManagedObject> {
        let NSFetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Joke")
        let id = uuid.uuidString
        let predicate = NSPredicate(format: "id = %@", id)
        NSFetchRequest.predicate = predicate
        return NSFetchRequest
    }
    
    // Entity가 활용하는 프로퍼티
    @NSManaged public var body: String?
    @NSManaged public var category: String?
    @NSManaged public var id: UUID?


}

extension Joke : Identifiable {

}
