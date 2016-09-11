//
//  Deal.swift
//  RentalCalculator
//
//  Created by Dan Hilton on 9/11/16.
//  Copyright © 2016 Dan Hilton. All rights reserved.
//

import UIKit

class Deal {
    
    var purchasePrice: Int?
    var closingCosts: Int?
    var estimatedRepairs: Int?
    var downPayment: Int?
    var interestRate: Double?
    var loanPoints: Double?
    var amortizedYears: Int?
    var rentalIncome: Int?
    var otherIncome: Int?
    
    init(dict:NSDictionary) {
        purchasePrice = dict.object(forKey: "purchasePrice") as? Int
        closingCosts = dict.object(forKey: "closingCosts") as? Int
        estimatedRepairs = dict.object(forKey: "estimatedRepairs") as? Int
        downPayment = dict.object(forKey: "downPayment") as? Int
        interestRate = dict.object(forKey: "interestRate") as? Double
        loanPoints = dict.object(forKey: "loanPoints") as? Double
        amortizedYears = dict.object(forKey: "amortizedYears") as? Int
        rentalIncome = dict.object(forKey: "rentalIncome") as? Int
        otherIncome = dict.object(forKey: "otherIncome") as? Int
    }
}
