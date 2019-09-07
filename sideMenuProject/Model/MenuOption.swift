//
//  MenuOption.swift
//  sideMenuProject
//
//  Created by Abdalla on 9/6/19.
//  Copyright © 2019 edu.data. All rights reserved.
//
import UIKit

enum MenuOption: Int, CustomStringConvertible{
    
    case Profile
    case Inbox
    case Notifications
    case settings
    
    var description: String{
        switch self{
            
        case .Profile: return "Profile"
        case .Inbox: return "Inbox"
        case .Notifications: return "Notifcations"
        case .settings: return "Settings"
        }
    }
    
    var image: UIImage{
        switch self{
            
        case .Profile: return UIImage(named: "profile") ?? UIImage()
        case .Inbox: return UIImage(named: "mail") ?? UIImage()
        case .Notifications: return UIImage(named: "notify") ?? UIImage()
        case .settings: return UIImage(named: "settings") ?? UIImage()
        }
    }
}
