//
//  HomeReceverCell.swift
//  chatAi
//
//  Created by MacBook M1 on 17/04/23.
//

import UIKit
protocol CustomCellDelegate: AnyObject {
    func didTapButton(withData data: String, inCell cell: HomeReceverCell)
}

class HomeReceverCell: UITableViewCell {
    @IBOutlet weak var ReceverTextField: UILabel!
    var Txt: String?
    weak var delegate: CustomCellDelegate?

    @IBOutlet weak var sharetxtBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func shareIconTapped(_ sender: UIButton) {
//        print("this the text \(Txt)")
        delegate?.didTapButton(withData: Txt ?? "", inCell: self)
        
//        print("this is txt  \(Txt)")
//        delegate?.didTapButton(withData: cellData, inCell: self)
//        let textToShare = Txt
//        let activityViewController = UIActivityViewController(activityItems: [Txt!], applicationActivities: nil)
//
//           // Find the topmost view controller and present the activity view controller from there
//           if let viewController = window?.rootViewController {
//               viewController.present(activityViewController, animated: true, completion: nil)
//           }

    }
    
}
