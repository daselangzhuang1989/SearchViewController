//
//  Item.swift
//  SearchVC
//
//  Created by 庄园 on 2019/1/11.
//  Copyright © 2019年 庄园. All rights reserved.
//

import UIKit

class Item: NSObject {
    var name:String?
    var value:Int?
    fileprivate static var items:[Item]?
    
    init(name:String, value:Int) {
        self.name = name
        self.value = value
    }
    
    class func allItems() -> [Item] {
        if self.items != nil {
            return self.items!
        }
        var array = Array<Item>()
        for index in 1...26 {
            let a:Character = "a"
            let numberFormA = Int(String(a).unicodeScalars.first!.value)
            array.append(Item.init(name: "\(Character(UnicodeScalar(numberFormA - 1 + index) ?? "a"))Data", value: index))
        }
        return array;
    }
    
    class func findItemNameContains(string:String) -> [Item] {
        return self.allItems().filter { (item) -> Bool in
            return item.name?.lowercased().contains(string.lowercased()) ?? false
        };
    }
    
}
