//
//  PageViewController.swift
//  Movember-Loyalty-Program
//
//  Created by Errol Cheong on 2018-11-17.
//  Copyright © 2018 Errol Cheong. All rights reserved.
//

import BetterSegmentedControl

class PageViewController: UIViewController {
    
    
    @IBOutlet var coinLabel: UILabel!
    @IBOutlet var segmentControl: BetterSegmentedControl! {
        didSet {
            let redeem = LabelSegment(text: "Redeem", normalBackgroundColor: .white, normalFont: nil, normalTextColor: UIColor.black.withAlphaComponent(0.3), selectedBackgroundColor: nil, selectedFont: nil, selectedTextColor: .black)
            let history = LabelSegment(text: "History", normalBackgroundColor: .white, normalFont: nil, normalTextColor: UIColor.black, selectedBackgroundColor: nil, selectedFont: nil, selectedTextColor: UIColor.black)
            let width = UIScreen.main.bounds.width / 2
            let rect = CGRect(x: 0, y: 36, width: width, height: 3).insetBy(dx: 35, dy: 0)
            let view = UIView(frame: rect)
            view.backgroundColor = .black
            segmentControl.addSubviewToIndicator(view)
            segmentControl.segments = [redeem, history]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
}
