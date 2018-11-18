//
//  RedeemTableViewController.swift
//  Movember-Loyalty-Program
//
//  Created by Errol Cheong on 2018-11-18.
//  Copyright © 2018 Errol Cheong. All rights reserved.
//

import UIKit

class RedeemTableViewController: UITableViewController {
    
    var partnerData: [PartnerData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        if let jsonData = try? JSONSerialization.data(withJSONObject: pData, options: []) {
            partnerData = try! JSONDecoder().decode([PartnerData].self, from: jsonData)
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partnerData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "redeemCell", for: indexPath)

        // Configure the cell...
        let data = partnerData[indexPath.row]
        if let cell = cell as? RedeemTableViewCell {
            switch data.rewardId {
            case 1:
                cell.logoImageView.image = UIImage(named: "jimmys")
            case 2:
                cell.logoImageView.image = UIImage(named: "lyft")
            case 3:
                cell.logoImageView.image = UIImage(named: "skip")
            default:
                break
            }
            cell.companyLabel.text = data.rewardsPartner
            cell.descriptionLabel.text = data.promoPescription
            cell.pointsLabel.text = "\(data.pointsToRedeem) Points Required"
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = partnerData[indexPath.row]
        
        let alertController = UIAlertController(title: "Redeem Reward", message: """
            Use \(data.pointsToRedeem) MoCoins to redeem:
            
            \(data.rewardsPartner)
            \(data.promoPescription)
            """
            , preferredStyle: .alert)
        
        let confirm = UIAlertAction(title: "Yes, redeem!", style: .default, handler: { (action) in
            if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "redemptionVC") as? RedemptionViewController {
                viewController.data = data
                NotificationCenter.default.post(name: NSNotification.Name("redeemCoins"), object: nil, userInfo: ["mocoin": data.pointsToRedeem])
                self.present(viewController, animated: true, completion: nil)
            }
        })
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        [confirm, cancel].forEach(alertController.addAction)
        alertController.preferredAction = confirm
        
        
        present(alertController, animated: true, completion: nil)
    }
}
