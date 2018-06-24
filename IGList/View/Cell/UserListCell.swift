//
//  UserListCell.swift
//  IGList
//
//  Created by 尾之上翼 on 2018/06/24.
//  Copyright © 2018年 onoue. All rights reserved.
//

import UIKit
import AlamofireImage

final class UserListCell: UICollectionViewCell {
    
    @IBOutlet weak private var userImage: UIImageView!
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var mailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initSet()
    }
    
    private func initSet() {
        backgroundColor = .white
        
        userImage.layer.cornerRadius = userImage.bounds.width / 2
        userImage.layer.masksToBounds = true
    }
    
    func setupContents(user: User) {
        nameLabel.text = user.name
        mailLabel.text = user.email
        
        let imageUrl = URL(string: user.image)
        userImage.af_setImage(withURL: imageUrl!)
    }
}
