//
//  ContentPageViewController.swift
//  Movember-Loyalty-Program
//
//  Created by Errol Cheong on 2018-11-17.
//  Copyright © 2018 Errol Cheong. All rights reserved.
//

import UIKit

class ContentPageViewController: UIPageViewController {
    
    var content: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let historyVC = storyboard?.instantiateViewController(withIdentifier: "historyVC") as? TableViewController {
            content.append(historyVC)
        }

        dataSource = self
        delegate = self
    }
}

extension ContentPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return nil
    }
}

extension ContentPageViewController: UIPageViewControllerDelegate {
    
}
