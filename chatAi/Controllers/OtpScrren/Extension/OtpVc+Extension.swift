//
//  OtpVc+Extension.swift
//  ChatBot
//
//  Created by MacBook M1 on 11/04/23.
//

import Foundation
import UIKit

extension OtpVC: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if ((textField.text?.count)! < 1) && (string.count > 0){
            
            if textField == TxtField1{
                txtField2.becomeFirstResponder()
            }
            if textField == txtField2{
                txtField3.becomeFirstResponder()
            }
            if textField == txtField3{
                txtField4.becomeFirstResponder()
            }
            if textField == txtField4{
                TxtField1.resignFirstResponder()
            }
            
            textField.text = string
            return false
            
            
        }else if((textField.text?.count)! >= 1) && (string.count < 0){
            
            if textField == txtField2{
                TxtField1.becomeFirstResponder()
            }
            if textField == txtField3{
                txtField2.becomeFirstResponder()
            }
            if textField == txtField4{
                txtField3.becomeFirstResponder()
            }
            if textField == TxtField1{
                TxtField1.resignFirstResponder()
            }
            
            textField.text = ""
            return false
            
            
        }else if((textField.text?.count)! >= 1){
            textField.text = string
            return false
            
        }
        
        
        return true
    }
}
