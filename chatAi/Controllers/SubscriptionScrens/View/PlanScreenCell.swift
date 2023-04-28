//
//  PlanScreenCell.swift
//  chatAi
//
//  Created by MacBook M1 on 13/04/23.
//

import UIKit

class PlanScreenCell: UICollectionViewCell {
    @IBOutlet weak var offerView: UIView!
    @IBOutlet weak var PlanName: UILabel!
    @IBOutlet weak var PlanScreenBackView: UIView!
    
    @IBOutlet weak var tokenlimitLabel: UILabel!
    @IBOutlet weak var imageGenLimitLabel: UILabel!
    @IBOutlet weak var transcriptLimitLabel: UILabel!
    
    @IBOutlet weak var tokenLimitSubLabel: UILabel!
    
    @IBOutlet weak var imageGenSubLabel: UILabel!
    
    @IBOutlet weak var transcriptLimitSubLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var planDurLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
