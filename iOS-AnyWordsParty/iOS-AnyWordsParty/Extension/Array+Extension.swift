//
//  Array+Extension.swift
//  iOS-AnyWordsParty
//
//  Created by 1 on 2022/02/06.
//

import Foundation

extension Array {
    
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript(safe index: Index) -> Element? {
        
        switch indices.contains(index) {
        case true:
            return self[index]
        case false:
            return nil
        }
    }
}
