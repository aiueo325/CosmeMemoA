//
//  CosmeItem.swift
//  CosmeMemoA
//
//  Created by Apple Green on 2024/03/15.
//

import Foundation
import RealmSwift

class CosmeItem: Object {
    @Persisted var brand: String = ""
    @Persisted var Item: String = ""
    @Persisted var number: String = ""
    @Persisted var slider: Float = 0
    }
    

