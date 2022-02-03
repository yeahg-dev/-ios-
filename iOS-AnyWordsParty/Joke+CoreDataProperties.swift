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


}

extension Joke : Identifiable {

}
