//
//  MoCoinPageViewController.swift
//  Movember-Loyalty-Program
//
//  Created by Errol Cheong on 2018-11-17.
//  Copyright © 2018 Errol Cheong. All rights reserved.
//

import UIKit

class MoCoinPageViewController: UIPageViewController {
    
    var doUpdateSelection: ((UInt) -> Void)?
    var content: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let redeemVC = storyboard?.instantiateViewController(withIdentifier: "redeemVC") as? RedeemTableViewController {
            content.append(redeemVC)
        }
        
        if let historyVC = storyboard?.instantiateViewController(withIdentifier: "historyVC") as? HistoryTableViewController {
            content.append(historyVC)
        }
        
        setViewControllers([content.first!], direction: .forward, animated: true, completion: nil)
        

        dataSource = self
        delegate = self
    }
}

extension MoCoinPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if viewController == content.last {
            return content.first
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController == content.first {
            return content.last
        }
        return nil
    }
}

extension MoCoinPageViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if finished && completed {
            if previousViewControllers.first == content.first {
                doUpdateSelection?(UInt(1))
            } else {
                doUpdateSelection?(UInt(0))
            }
        }
    }
    
}
