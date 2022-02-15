//
//  BountyInfo.swift
//  BountyList
//
//  Created by chxhyxn on 2022/02/16.
//

import UIKit

struct BountyInfo{
    let name : String
    let bounty : Int
    
    var image : UIImage? {
        UIImage(named: "\(name).jpg")
    }
    
    init(name: String, bounty: Int){
        self.name = name
        self.bounty = bounty
    }
}
