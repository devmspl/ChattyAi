//
//  AccountCell.swift
//  chatAi
//
//  Created by MacBook M1 on 14/04/23.
//

import UIKit

class AccountCell: UITableViewCell {
    @IBOutlet weak var settingName: UILabel!
    @IBOutlet weak var SettingImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
