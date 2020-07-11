//
//  StoryboardRouter.swift
//  NewsAppAlTayer
//
//  Created by Fazeel Ahmed on 7/9/20.
//  Copyright © 2020 Sun and Sand Sports LLC. All rights reserved.
//

import UIKit

enum Storyboard {
    case newViewController
    case recentSearchViewController
    case newDetailsController
    
    var viewController: UIViewController {
        switch self {
            
        case .newViewController:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            return storyboard.instantiateViewController(withIdentifier: String(describing: NewsViewController.self)) as! NewsViewController
            
        case .recentSearchViewController:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            return storyboard.instantiateViewController(withIdentifier: String(describing: RecentSearchResultViewController.self)) as! RecentSearchResultViewController
            
        case .newDetailsController:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            return storyboard.instantiateViewController(withIdentifier: String(describing: NewsDetailViewController.self)) as! NewsDetailViewController
        }
    }
}

