//
//  User.swift
//  IGList
//
//  Created by 尾之上翼 on 2018/06/24.
//  Copyright © 2018年 onoue. All rights reserved.
//

import ObjectMapper
import IGListKit

class User: Mappable {
    
    var id: Int!
    var name: String!
    var email: String!
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        email <- map["eail"]
    }
}

extension User: ListDiffable {
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if let user = object as? User {
            return id == user.id
        }
        
        return false
    }
    
    
    func diffIdentifier() -> NSObjectProtocol {
        return id as NSObjectProtocol
    }
    
}
