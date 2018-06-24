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
    
    private var users: [User]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupObjects()

        // Do any additional setup after loading the view.
        adapter.collectionView = userListCollectionView
        adapter.dataSource = self
        
        setDatas()
    }
    
    //ランダムなデータを導入
    private func setDatas() {
        var initialUsers: [User] = []
        for _ in 0..<10 {
            let user = User.makeMock()
            let isIncludeId = initialUsers.filter { $0.id == user.id }
            if isIncludeId.count == 0 || isIncludeId.isEmpty {
                initialUsers.append(user)
            }
        }
        users = initialUsers
        adapter.performUpdates(animated: true, completion: nil)
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
        for _ in 0..<5 {
            let user = User.makeMock()
            let isIncludeId = users?.filter { $0.id == user.id }
            
            if isIncludeId?.count == 0 || (isIncludeId?.isEmpty)! {
                users?.append(user)
            }
        }
        adapter.performUpdates(animated: true, completion: nil)
    }
    
    //データの更新
    @IBAction func changeData(_ sender: Any) {
        users?[0] = User(id: 0, name: "sa", email: "fdsa", image: "das")
        
        adapter.performUpdates(animated: true, completion: nil)
    }
}

extension UserListViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        if let _users = users {
            return _users
        } else {
            return [ListDiffable]()
        }
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        let sectionController = UserSectionController()
        return sectionController
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
