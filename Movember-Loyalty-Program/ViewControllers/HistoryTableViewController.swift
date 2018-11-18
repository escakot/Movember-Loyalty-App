//
//  HistoryTableViewController.swift
//  Movember-Loyalty-Program
//
//  Created by Errol Cheong on 2018-11-17.
//  Copyright © 2018 Errol Cheong. All rights reserved.
//

import UIKit

class HistoryTableViewController: UITableViewController {
    
    var loyaltyData: [LoyaltyData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        if let jsonData = try? JSONSerialization.data(withJSONObject: data, options: []) {
            loyaltyData = try! JSONDecoder().decode([LoyaltyData].self, from: jsonData)
        }
    
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    func text(date: Date) -> String {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "h:mma"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "M/d/yyyy"
        let timeDate = timeFormatter.string(from: date)
        let dateDate = dateFormatter.string(from: date)
        return "\(timeDate), \(dateDate)."
    }
}

extension HistoryTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath)
        
        let viewData = loyaltyData[indexPath.row]
        let date = Date(timeIntervalSince1970: TimeInterval(viewData.date))
        if let cell = cell as? HistoryTableViewCell {
            cell.dateLabel.text = text(date: date)
            if viewData.value < 0 {
                cell.label.text = "You redeemed \(viewData.value.magnitude) MoCoins"
            } else {
                cell.label.text = "You earned \(viewData.value.magnitude) MoCoins"
            }
        }

        return cell
    }
}
