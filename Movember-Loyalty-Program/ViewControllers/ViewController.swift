//
//  ViewController.swift
//  Movember-Loyalty-Program
//
//  Created by Errol Cheong on 2018-11-17.
//  Copyright © 2018 Errol Cheong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override var prefersStatusBarHidden: Bool {
        return true
    }

    @IBOutlet var scrollView: UIScrollView! {
        didSet {
            scrollView.contentInsetAdjustmentBehavior = .never
            scrollView.contentInset = .zero
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let navBar = navigationController?.navigationBar,
            !navBar.isHidden {
            navigationController?.setNavigationBarHidden(true, animated: true)
        }
    }


}

