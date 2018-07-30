//
//  Item.swift
//  Todoey
//
//  Created by iMac 2012 on 29.07.2018.
//  Copyright © 2018 iMac2012. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var name : String = ""
    @objc dynamic var done : Bool = false
    @objc dynamic var dateCreated: Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
