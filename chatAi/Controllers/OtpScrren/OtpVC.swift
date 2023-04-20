//
//  OtpVC.swift
//  ChatBot
//
//  Created by MacBook M1 on 11/04/23.
//

import UIKit
//import OTPTextField
class OtpVC: UIViewController {

    @IBOutlet weak var txtField4: UITextField!
    @IBOutlet weak var txtField3: UITextField!
    @IBOutlet weak var txtField2: UITextField!
    @IBOutlet weak var TxtField1: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        TxtField1.delegate = self
        txtField2.delegate = self
        txtField3.delegate = self
        txtField4.delegate = self
        TxtField1.becomeFirstResponder()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
