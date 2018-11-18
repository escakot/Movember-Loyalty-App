//
//  PartnerData.swift
//  Movember-Loyalty-Program
//
//  Created by Errol Cheong on 2018-11-18.
//  Copyright © 2018 Errol Cheong. All rights reserved.
//

import Foundation

struct PartnerData: Decodable {
    var rewardsPartner: String
    var rewardId: Int
    var promoPescription: String
    var discount: Int
    var promoCode: String
    var imageAssetPath: String
    var pointsToRedeem: Int
}

let pData = [
        [
        "rewardsPartner": "Jimmy's Coffee",
        "rewardId": 001,
        "promoPescription": "Enjoy 100% off your next coffee",
        "discount": 100,
        "promoCode": "jimmysmo2018",
        "imageAssetPath": "./img/jimmys.png",
        "pointsToRedeem": 10,
        ],
        [
        "rewardsPartner": "Lyft",
        "rewardId": 002,
        "promoPescription": "Enjoy 20% off your next Lyft ride",
        "discount": 20,
        "promoCode": "movember2018",
        "imageAssetPath": "./img/lyft.png",
        "pointsToRedeem": 20,
        ],
        [
        "rewardsPartner": "Skip the Dishes",
        "rewardId": 003,
        "promoPescription": "Enjoy 30% off your next meal from Skip the Dishes",
        "discount": 50,
        "promoCode": "skipthedishes2018",
        "imageAssetPath": "./img/skip.jpeg",
        "pointsToRedeem": 15,
        ]
]


