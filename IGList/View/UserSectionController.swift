//
//  UserSectionController.swift
//  IGList
//
//  Created by 尾之上翼 on 2018/06/24.
//  Copyright © 2018年 onoue. All rights reserved.
//

import UIKit
import IGListKit

final class UserSectionController: ListSectionController {
    
    private var user: User?
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext else { return .zero }
        return CGSize(width: context.containerSize.width, height: 100)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(withNibName: "UserListCell", bundle: nil, for: self, at: index) as? UserListCell else {
            return UICollectionViewCell()
        }
        
        if let _user = user {
            cell.setupContents(user: _user)
        }
        
        return cell
    }
    
    override func didUpdate(to object: Any) {
        self.user = object as? User
    }
    
    override func didSelectItem(at index: Int) {
        if let _user = user {
            let id = _user.id
            let name = _user.name
            print(id, name)
        }
    }
    
}
