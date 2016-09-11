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
    var downPaymentCell: TogglePercentField!
    var interestRate: EntryOnlyField!
    var loanPoints: EntryOnlyField!
    var amortizedYears: EntryOnlyField!
    var rentalIncomeCell: EntryOnlyField!
    var otherIncomeCell: EntryOnlyField!
    var insuranceCell: ToggleYearField!
    var propertyTaxCell: ToggleYearField!
    var vacancyCell: TogglePercentField!
    var repairsCell: TogglePercentField!
    var capExCell: TogglePercentField!
    var propertyMgmtCell: TogglePercentField!
    
    var cells :[UITableViewCell]?
    
    let cellNames = ["Purchase Price", "Closing Costs", "Estimated Repairs", "Down Payment", "Interest Rate (%)", "Loan Points", "Amortization Years", "Rental Income", "Other Income", "Insurance", "Property Tax", "Vacancy", "Repairs", "CapEx", "Property Mgmt"]
    
    let ENTRY_ONLY_ID = "EntryOnlyCell"
    let TOGGLE_PERCENT_ID = "TogglePercentCell"
    let TOGGLE_YEAR_ID = "ToggleYearCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        purchasePriceCell = tableView.dequeueReusableCell(withIdentifier: ENTRY_ONLY_ID) as! EntryOnlyField
        closingCostsCell = tableView.dequeueReusableCell(withIdentifier: ENTRY_ONLY_ID) as! EntryOnlyField
        estimatedRepairsCell = tableView.dequeueReusableCell(withIdentifier: ENTRY_ONLY_ID) as! EntryOnlyField
        downPaymentCell = tableView.dequeueReusableCell(withIdentifier: TOGGLE_PERCENT_ID) as! TogglePercentField
        interestRate = tableView.dequeueReusableCell(withIdentifier: ENTRY_ONLY_ID) as! EntryOnlyField
        loanPoints = tableView.dequeueReusableCell(withIdentifier: ENTRY_ONLY_ID) as! EntryOnlyField
        amortizedYears = tableView.dequeueReusableCell(withIdentifier: ENTRY_ONLY_ID) as! EntryOnlyField
        rentalIncomeCell = tableView.dequeueReusableCell(withIdentifier: ENTRY_ONLY_ID) as! EntryOnlyField
        otherIncomeCell = tableView.dequeueReusableCell(withIdentifier: ENTRY_ONLY_ID) as! EntryOnlyField
        insuranceCell = tableView.dequeueReusableCell(withIdentifier: TOGGLE_YEAR_ID) as! ToggleYearField
        propertyTaxCell = tableView.dequeueReusableCell(withIdentifier: TOGGLE_YEAR_ID) as! ToggleYearField
        vacancyCell = tableView.dequeueReusableCell(withIdentifier: TOGGLE_PERCENT_ID) as! TogglePercentField
        repairsCell = tableView.dequeueReusableCell(withIdentifier: TOGGLE_PERCENT_ID) as! TogglePercentField
        capExCell = tableView.dequeueReusableCell(withIdentifier: TOGGLE_PERCENT_ID) as! TogglePercentField
        propertyMgmtCell = tableView.dequeueReusableCell(withIdentifier: TOGGLE_PERCENT_ID) as! TogglePercentField
        
        cells = [purchasePriceCell, closingCostsCell, estimatedRepairsCell, downPaymentCell, interestRate, loanPoints, amortizedYears, rentalIncomeCell, otherIncomeCell, insuranceCell, propertyTaxCell, vacancyCell, repairsCell, capExCell, propertyMgmtCell]
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
        else if let cell = cells![indexPath.row] as? ToggleEntryField {
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
    
    func getIntValue() -> Int? {
        return Int(entryField.text!)
    }
    
    func getStringValue() -> String? {
        return entryField.text
    }
}

class ToggleEntryField: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var labelContainerView: UIView! {
        didSet {
            labelContainerView.layer.borderColor = UIColor(red: 200/255.0, green: 201/255.0, blue: 200/255.0, alpha: 1.0).cgColor
            labelContainerView.layer.borderWidth = 1.5
            labelContainerView.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var entryField: UITextField!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    func setupCell(name:String) {
        nameLabel.text = name
    }
    
}

class TogglePercentField: ToggleEntryField {
    
    func getValue(of:Int) -> Int {
        let val = Int(entryField.text!)!
        return segmentedControl.selectedSegmentIndex == 0 ? val : val / 100 * of
    }
}

class ToggleYearField: ToggleEntryField {

    
}
