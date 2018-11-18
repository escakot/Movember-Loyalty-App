//
//  MoCoinViewController.swift
//  Movember-Loyalty-Program
//
//  Created by Errol Cheong on 2018-11-17.
//  Copyright © 2018 Errol Cheong. All rights reserved.
//

import UIKit

class MoCoinViewController: UIViewController {

    var pageController: MoCoinPageViewController!
    var coinBalance: Int = 218 {
        didSet {
            coinLabel.text = "\(coinBalance)"
        }
    }
    @IBOutlet var stackView: UIStackView!
    @IBOutlet var coinLabel: UILabel! {
        didSet {
            coinLabel.text = "\(coinBalance)"
        }
    }
    @IBOutlet var segmentControl: BetterSegmentedControl! {
        didSet {
            let screenWidth = UIScreen.main.bounds.width
            let barRect = CGRect(x: 0, y: 41, width: screenWidth, height: 1)
            let bar = UIView(frame: barRect)
            bar.backgroundColor = UIColor.black.withAlphaComponent(0.15)
            segmentControl.addSubview(bar)
            let rect = CGRect(x: 0, y: 38, width: screenWidth / 2, height: 2).insetBy(dx: 35, dy: 0)
            let view = UIView(frame: rect)
            view.backgroundColor = .black
            segmentControl.titles = ["Redeem", "History"]
            segmentControl.addSubviewToIndicator(view)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(redeemCoins), name: NSNotification.Name("redeemCoins"), object: nil)
    }
    
    @objc func redeemCoins(_ notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        if let value = userInfo["mocoin"] as? Int {
            coinBalance -= value
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let dvc = segue.destination as? MoCoinPageViewController {
            dvc.doUpdateSelection = { [unowned self] index in
                try? self.segmentControl.setIndex(index, animated: true)
            }
            pageController = dvc
        }
    }
    
    @IBAction func selectionChanged(_ sender: BetterSegmentedControl) {
        let index = Int(sender.index)
        let viewController = pageController.content[index]
        let direction: UIPageViewController.NavigationDirection
        if index == 0 {
            direction = .reverse
        } else {
            direction = .forward
        }
        pageController.setViewControllers([viewController], direction: direction, animated: true, completion: nil)
    }
}
