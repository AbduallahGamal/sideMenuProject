//
//  homeController.swift
//  sideMenuProject
//
//  Created by Abdalla on 9/6/19.
//  Copyright © 2019 edu.data. All rights reserved.
//

import UIKit

class homeController: UIViewController{
    
    //MARK: - Properties
    var delegate: HomeControllerDelegate?
    
    
    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        configureNavigationBar()
    }
    
    //MARK: - Handlers
    @objc func HandleMenuToggle(){
        delegate?.HandleMenuToggle()
    }
    
    func configureNavigationBar(){
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "Side Menu"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "iconfinder_menu_1814109").withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(HandleMenuToggle))
    }
}
