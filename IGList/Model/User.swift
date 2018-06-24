//
//  User.swift
//  IGList
//
//  Created by 尾之上翼 on 2018/06/24.
//  Copyright © 2018年 onoue. All rights reserved.
//

import IGListKit

class User {
    
    let id: Int!
    let name: String!
    let email: String!
    let image: String!
    
    init(id: Int, name: String, email: String, image: String) {
        self.id = id
        self.name = name
        self.email = email
        self.image = image
    }
}

extension User: ListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return id as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if let user = object as? User {
            return name == user.name
        }

        return false
    }
}
