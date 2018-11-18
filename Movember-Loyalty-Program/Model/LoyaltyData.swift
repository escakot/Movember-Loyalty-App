//
//  LoyaltyData.swift
//  Movember-Loyalty-Program
//
//  Created by Errol Cheong on 2018-11-17.
//  Copyright © 2018 Errol Cheong. All rights reserved.
//

import Foundation

struct LoyaltyData: Codable {
    var member_id: Int
    var partner_id: Int
    var transaction_id: Int
    var value: Float
    var date: Int
}
