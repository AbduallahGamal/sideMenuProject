//
//  containerController.swift
//  sideMenuProject
//
//  Created by Abdalla on 9/6/19.
//  Copyright © 2019 edu.data. All rights reserved.
//

import UIKit

class containerController: UIViewController{
    
    //MARK: - Properties
    var MenuController: UIViewController!
    var CenterController: UIViewController!
    var isExpand = false
    
    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurationHomeController()
    }
    
    //MARK: - Handlers
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    func configurationHomeController(){
        let HomeController = homeController()
        HomeController.delegate = self
        CenterController = UINavigationController(rootViewController: HomeController)
        view.addSubview(CenterController.view)
        addChild(CenterController)
        CenterController.didMove(toParent: self)
    }
    
    func configurationMenuController(){
        if MenuController == nil {
            MenuController = menuController()
            view.insertSubview(MenuController.view, at: 0)
            addChild(MenuController)
            MenuController.didMove(toParent: self)
        }
    }
    
    func showMenuController(ShowExpand: Bool){
        if ShowExpand{
            
            UIView.animate(withDuration: 0.5, delay: 0,usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.CenterController.view.frame.origin.x = self.CenterController.view.frame.width - 80
            }, completion: nil)
            
        }else{
            UIView.animate(withDuration: 0.5, delay: 0,usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.CenterController.view.frame.origin.x = 0
            }, completion: nil)
        }
    }
}

extension containerController: HomeControllerDelegate{
    func HandleMenuToggle() {
        
        if !isExpand{
            configurationMenuController()
        }
        isExpand = !isExpand
        showMenuController(ShowExpand: isExpand)
    }
    
    
}
