//
//  RandomGenerator.swift
//  IGList
//
//  Created by 尾之上翼 on 2018/06/24.
//  Copyright © 2018年 onoue. All rights reserved.
//

import UIKit

import UIKit

struct RandomGenerator {
    
    static func generateInt(max: UInt32 = 100) -> Int {
        return Int(arc4random_uniform(max))
    }
    
    static func generateBool() -> Bool {
        return arc4random_uniform(2) == 0
    }
    
    static func generateAlphabetString(length: Int = 5) -> String {
        let allowedChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let allowedCharsCount = UInt32(allowedChars.count)
        var randomString = ""
        
        for _ in 0..<length {
            let randomNum = Int(arc4random_uniform(allowedCharsCount))
            let randomIndex = allowedChars.index(allowedChars.startIndex, offsetBy: randomNum)
            let newCharacter = allowedChars[randomIndex]
            randomString += String(newCharacter)
        }
        
        return randomString
    }
    
    static func generateString(length: Int = 5) -> String {
        let allowedChars = "あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほ"
        let allowedCharsCount = UInt32(allowedChars.count)
        var randomString = ""
        
        for _ in 0..<length {
            let randomNum = Int(arc4random_uniform(allowedCharsCount))
            let randomIndex = allowedChars.index(allowedChars.startIndex, offsetBy: randomNum)
            let newCharacter = allowedChars[randomIndex]
            randomString += String(newCharacter)
        }
        
        return randomString
    }
    
    static func generateImageURL(width: Int = 256,
                                 height: Int = 256,
                                 backgroundColorHex: String = String(RandomGenerator.generateInt(max: 4096), radix: 16),
                                 textColorHex: String = String(RandomGenerator.generateInt(max: 4096), radix: 16),
                                 text: String = RandomGenerator.generateAlphabetString(length: 6)) -> String {
        return "https://dummyimage.com/\(width)x\(height)/\(backgroundColorHex)/\(textColorHex)&text=\(text)"
    }
    
    static func generateURL() -> String {
        return "https://localhost:8000/" + generateString(length: 10)
    }
    
    static func generateDate() -> Date {
        return Date()
    }
}
