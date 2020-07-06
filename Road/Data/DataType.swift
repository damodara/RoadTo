//
//  DataType.swift
//  Road
//
//  Created by ddas on 06.07.2020.
//  Copyright © 2020 ddas. All rights reserved.
//

import RealmSwift

class dataItem: Object {
    @objc dynamic var itemTitle = ""
    @objc dynamic var itemPhoto = ""
    @objc dynamic var itemType = ""
    @objc dynamic var itemCity = ""
    @objc dynamic var itemLatitude = ""
    @objc dynamic var itemLongitude = ""
    @objc dynamic var itemDescription = ""
}
