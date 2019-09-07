//
//  settingsController.swift
//  sideMenuProject
//
//  Created by Abdalla on 9/7/19.
//  Copyright © 2019 edu.data. All rights reserved.
//

import UIKit

class settingsController: UIViewController {
    
    //MARK: - Properties
    
    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Selector
    @objc func HandleDissMiss(){
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Handlers
    func configureUI(){
        view.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Settings"

        navigationController?.navigationBar.barStyle = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "close").withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(HandleDissMiss))
    }
}
