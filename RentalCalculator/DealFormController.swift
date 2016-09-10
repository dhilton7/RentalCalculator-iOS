//
//  DealFormController.swift
//  RentalCalculator
//
//  Created by Dan Hilton on 9/10/16.
//  Copyright © 2016 Dan Hilton. All rights reserved.
//

import UIKit

class DealFormController: UITableViewController {

    var purchasePriceCell: EntryOnlyField!
    var closingCostsCell: EntryOnlyField!
    var estimatedRepairsCell: EntryOnlyField!
    var downPaymentCell: EntryOnlyField!
    var interestRate: EntryOnlyField!
    var loanPoints: EntryOnlyField!
    var amortizedYears: EntryOnlyField!
    var rentalIncomeCell: EntryOnlyField!
    var otherIncomeCell: EntryOnlyField!
    
    var cells :[UITableViewCell]?

    let cellNames = ["Purchase Price", "Closing Costs", "Estimated Repairs", "Down Payment", "Interest Rate", "Loan Points", "Amortization Schedule", "Rental Income", "Other Income"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        purchasePriceCell = tableView.dequeueReusableCell(withIdentifier: "EntryOnlyCell") as! EntryOnlyField
        closingCostsCell = tableView.dequeueReusableCell(withIdentifier: "EntryOnlyCell") as! EntryOnlyField
        estimatedRepairsCell = tableView.dequeueReusableCell(withIdentifier: "EntryOnlyCell") as! EntryOnlyField
        downPaymentCell = tableView.dequeueReusableCell(withIdentifier: "EntryOnlyCell") as! EntryOnlyField
        interestRate = tableView.dequeueReusableCell(withIdentifier: "EntryOnlyCell") as! EntryOnlyField
        loanPoints = tableView.dequeueReusableCell(withIdentifier: "EntryOnlyCell") as! EntryOnlyField
        amortizedYears = tableView.dequeueReusableCell(withIdentifier: "EntryOnlyCell") as! EntryOnlyField
        rentalIncomeCell = tableView.dequeueReusableCell(withIdentifier: "EntryOnlyCell") as! EntryOnlyField
        otherIncomeCell = tableView.dequeueReusableCell(withIdentifier: "EntryOnlyCell") as! EntryOnlyField
        
        cells = [purchasePriceCell, closingCostsCell, estimatedRepairsCell, downPaymentCell, interestRate, loanPoints, amortizedYears, rentalIncomeCell, otherIncomeCell]
    }
    
    
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = cells![indexPath.row] as? EntryOnlyField {
            cell.setupCell(name: cellNames[indexPath.row])
            return cell
        }
        else {
            return cells![indexPath.row]
        }
    }

}


class EntryOnlyField: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var labelContainerView: UIView! {
        didSet {
            labelContainerView.layer.borderColor = UIColor(red: 200/255.0, green: 201/255.0, blue: 200/255.0, alpha: 1.0).cgColor
            labelContainerView.layer.borderWidth = 1.5
            labelContainerView.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var entryField: UITextField!
    
    func setupCell(name:String) {
        nameLabel.text = name
    }
    
    func getValue() -> String {
        return entryField.text!
    }
    
}

class ToggleEntryField: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    func setupCell(name:String) {
        nameLabel.text = name
    }
    
}
