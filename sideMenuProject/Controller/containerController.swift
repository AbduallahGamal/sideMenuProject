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
    var MenuController: menuController!
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
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation{
        return .slide
    }
    override var prefersStatusBarHidden: Bool{
        return isExpand
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
            MenuController.delegate = self
            view.insertSubview(MenuController.view, at: 0)
            addChild(MenuController)
            MenuController.didMove(toParent: self)
        }
    }
    
    func animatePanel(ShowExpand: Bool, menuOption: MenuOption?){
        if ShowExpand{
            // Show Menu
            
            UIView.animate(withDuration: 0.5, delay: 0,usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.CenterController.view.frame.origin.x = self.CenterController.view.frame.width - 80
            }, completion: nil)
            
        }else{
            // hidden Menu
            
            UIView.animate(withDuration: 0.5, delay: 0,usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.CenterController.view.frame.origin.x = 0
            }) { (_) in
                guard let menuOption = menuOption else { return }
                self.didSelectMenuOption(menuOption: menuOption)
            }
        }
        animatStatusBar()
    }
    
    func didSelectMenuOption(menuOption: MenuOption){
        
        switch menuOption{
        case .Profile:
            print("Show Profile")
        case .Inbox:
            print("Show Inbox")
        case .Notifications:
            print("Show Inbox")
        case .settings:
            let controller = settingsController()
            present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
        }
    }
    
    func animatStatusBar(){
        UIView.animate(withDuration: 0.5, delay: 0,usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.setNeedsStatusBarAppearanceUpdate()
        }, completion: nil)
    }
}

extension containerController: HomeControllerDelegate{
    func HandleMenuToggle(forMenuOption menuOption: MenuOption?) {
        if !isExpand{
            configurationMenuController()
        }
        isExpand = !isExpand
        animatePanel(ShowExpand: isExpand, menuOption: menuOption)
    }
}

