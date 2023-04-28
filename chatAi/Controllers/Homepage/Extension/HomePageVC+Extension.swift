//
//  HomePageVC+Extension.swift
//  chatAi
//
//  Created by MacBook M1 on 17/04/23.
//

import Foundation
import UIKit
import Alamofire

extension HomePageVC: UITableViewDelegate,UITableViewDataSource,CustomCellDelegate{
    
    




    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if recever.count == 0 && SenderM.count == 0 {
//           return 0
//
//        }
//        else if recever.count >= SenderM.count {
//            return recever.count
//        }
//        else {
//            return SenderM.count
//        }
        
        return ChatData.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Recevercell = HompageTabelView.dequeueReusableCell(withIdentifier: "HomeReceverCell", for: indexPath) as! HomeReceverCell
        let sendercell = HompageTabelView.dequeueReusableCell(withIdentifier: "HomepageSenderTablecell" ,for: indexPath ) as! HomepageSenderTablecell

        let Type = ChatData[indexPath.row].type
        
        if Type == ChatType.Sender {
            sendercell.SenderTextField.text = ChatData[indexPath.row].Message
            return sendercell
        } else {
            Recevercell.delegate = self
            Recevercell.ReceverTextField.text = ChatData[indexPath.row].Message
            Recevercell.Txt = ChatData[indexPath.row].Message
            
            
            return Recevercell
        }


    }
    

    
    
    
    func didTapButton(withData data: String, inCell cell: HomeReceverCell) {
        // Create the activity view controller
            let activityVC = UIActivityViewController(activityItems: [data], applicationActivities: nil)
            guard let window = view.window ?? UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else {
                return
            }

            // Present the activity view controller
           self.view.endEditing(true)
            window.rootViewController?.present(activityVC, animated: true, completion: nil)
    }
}


extension HomePageVC: UITextViewDelegate{
    
    func textViewDidEndEditing(_ textView: UITextView) {
        self.view.layoutIfNeeded()
        self.textFiledViewHeight.constant = 3
        self.view.layoutIfNeeded()
    }
    // to change textview height according to txt
    func textViewDidChange(_ textView: UITextView) {
        let TxtviewNewHeight = self.textByUser.contentSize.height
        
        if TxtviewNewHeight < 150 {
            self.textViewHieght.constant = TxtviewNewHeight
        }
    }
    // to hide placeholderlabel
    func textViewDidBeginEditing(_ textView: UITextView) {
        placeholderLabel.isHidden = true
    }
    
}



