//
//  ObjectMapper+Extension.swift
//  IGList
//
//  Created by 尾之上翼 on 2018/06/24.
//  Copyright © 2018年 onoue. All rights reserved.
//

import ObjectMapper

extension Mappable {
    static func makeBlank() -> Self {
        return Self(JSONString: "{}")!
    }
}
