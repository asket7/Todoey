//
//  Category.swift
//  Todoey
//
//  Created by iMac 2012 on 29.07.2018.
//  Copyright © 2018 iMac2012. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name : String = ""
    let items = List<Item>()
}
