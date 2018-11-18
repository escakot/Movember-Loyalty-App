//
//  TableViewController.swift
//  Movember-Loyalty-Program
//
//  Created by Errol Cheong on 2018-11-17.
//  Copyright © 2018 Errol Cheong. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
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
    
    
    func text(for value: Float, date: Date) -> String {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "h:mma"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "M/d/yyyy"
        
        let timeDate = timeFormatter.string(from: date)
        let dateDate = dateFormatter.string(from: date)
        
        if value < 0 {
            return "You redeemed \(value.magnitude) MoCoins at \(timeDate) on \(dateDate)."
        } else {
            return "You earned \(value.magnitude) MoCoins at \(timeDate) on \(dateDate)."
        }
    }
}

extension TableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let viewData = loyaltyData[indexPath.row]
        let date = Date(timeIntervalSince1970: TimeInterval(viewData.date))
        if let cell = cell as? TableViewCell {
            cell.label?.text = text(for: viewData.value, date: date)
        }

        return cell
    }
}
