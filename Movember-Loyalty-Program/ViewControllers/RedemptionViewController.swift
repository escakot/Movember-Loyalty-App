//
//  RedemptionViewController.swift
//  Movember-Loyalty-Program
//
//  Created by Errol Cheong on 2018-11-18.
//  Copyright © 2018 Errol Cheong. All rights reserved.
//

import UIKit

class RedemptionViewController: UIViewController {
    
    var data: PartnerData?
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var codeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let data = data {
            switch data.rewardId {
            case 1:
                imageView.image = UIImage(named: "jimmys")
            case 2:
                imageView.image = UIImage(named: "lyft")
            case 3:
                imageView.image = UIImage(named: "skip")
            default:
                break
            }
            codeLabel.text = data.promoCode
        }
    }
}

