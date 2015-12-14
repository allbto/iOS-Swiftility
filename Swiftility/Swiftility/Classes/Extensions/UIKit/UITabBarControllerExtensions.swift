//
//  UITabBarController.swift
//  PuraScents
//
//  Created by Allan Barbato on 11/2/15.
//  Copyright © 2015 Pura Scents. All rights reserved.
//

import Foundation

extension UITabBarController
{
    func viewController<T: UIViewController>(type: T.Type) -> T?
    {
        guard let vcs = viewControllers else { return nil }
        
        for vc in vcs {
            if let vc = vc as? T {
                return vc
            } else if let navVC = vc as? UINavigationController, vc = navVC.viewControllers.first as? T {
                return vc
            }
        }
        
        return nil
    }
}