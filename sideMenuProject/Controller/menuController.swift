//
//  menuController.swift
//  sideMenuProject
//
//  Created by Abdalla on 9/6/19.
//  Copyright © 2019 edu.data. All rights reserved.
//

import UIKit

private let reuseIdentifier = "menuOptionCell"

class menuController: UIViewController{
    
    //MARK: - Properties
    var tableview: UITableView!
    
    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    //MARK: - Handlers
    func configureTableView(){
        tableview = UITableView()
        tableview.delegate = self
        tableview.dataSource = self
        
        tableview.register(menuOptionCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableview.backgroundColor = .darkGray
        tableview.separatorStyle = .none
        tableview.rowHeight = 80
        
        view.addSubview(tableview)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableview.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableview.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension menuController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! menuOptionCell
        return cell
    }
    
}
