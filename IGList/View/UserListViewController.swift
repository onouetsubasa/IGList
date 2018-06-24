//
//  UserListViewController.swift
//  IGList
//
//  Created by 尾之上翼 on 2018/06/24.
//  Copyright © 2018年 onoue. All rights reserved.
//

import UIKit
import IGListKit

final class UserListViewController: UIViewController {

    @IBOutlet weak private var userListCollectionView: ListCollectionView!
    
    @IBOutlet weak private var addDataButton: UIButton!
    @IBOutlet weak private var changeDataButton: UIButton!
    
    private lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    
    private lazy var users: [User] = [
        User(id: 0, name: "あいお", email: "dsa", image: "tre"),
        User(id: 1, name: "fdsfdsfsf", email: "dsafr", image: "tre"),
        User(id: 2, name: "こうぬhdふぃうさf", email: "dsdasdfsfsv", image: "tre"),
        User(id: 3, name: "こうdふぃうさf", email: "dsdasdfsfsv", image: "tre"),
        User(id: 4, name: "こうぬぃうさf", email: "dsdfsfsv", image: "tre"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupObjects()

        // Do any additional setup after loading the view.
        adapter.collectionView = userListCollectionView
        adapter.dataSource = self
    }
    
    private func setupObjects() {
        userListCollectionView.backgroundColor = UIColor.lightGray
        
        addDataButton.setTitle("追加", for: .normal)
        addDataButton.layer.borderWidth = 1
        addDataButton.layer.borderColor = UIColor.blue.cgColor
        addDataButton.backgroundColor = .white
        changeDataButton.setTitle("修正", for: .normal)
        changeDataButton.layer.borderWidth = 1
        changeDataButton.layer.borderColor = UIColor.blue.cgColor
        changeDataButton.backgroundColor = .white
    }
    
    //データの追加
    @IBAction func addData(_ sender: Any) {
        var newUsers: [User] = []
        if let lastUserId = users.last?.id {
            for i in (lastUserId + 1)..<(lastUserId + 3) {
                let user = User(id: i, name: "\(i),太郎", email: "dsa", image: "dfsa")
                newUsers.append(user)
            }
            users.append(contentsOf: newUsers)
            adapter.performUpdates(animated: true, completion: nil)
        }
    }
    
    //データの更新
    @IBAction func changeData(_ sender: Any) {
        users[0] = User(id: 0, name: "sa", email: "fdsa", image: "das")
        
        adapter.performUpdates(animated: true, completion: nil)
    }
}

extension UserListViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return users as [ListDiffable]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        let sectionController = UserSectionController()
        return sectionController
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
