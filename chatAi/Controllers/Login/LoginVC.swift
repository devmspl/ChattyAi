//
//  LoginVC.swift
//  ChatBot
//
//  Created by MacBook M1 on 11/04/23.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var Emailfield: UITextField!
    @IBOutlet weak var PassField: UITextField!
    
    @IBOutlet weak var backgroundLightView: UIView!
    @IBOutlet weak var bacgroundDarkView: UIView!
//    let loginResponseData = loginRespone
    override func viewDidLoad() {
        super.viewDidLoad()
        Emailfield.delegate = self
        PassField.delegate = self
        setTextfieldPlachoderColor(textFieldArray: [Emailfield,PassField])
        
        let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.viewTapped))
//        self.bacgroundDarkView.addGestureRecognizer(tapGesture)
        self.backgroundLightView.addGestureRecognizer(tapGesture)
//        let  filedArray = [Emailfield,PassField]
//        for txtfield in filedArray{
//            if let placeholder = txtfield?.placeholder {
//                txtfield?.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightText])
//            }
//        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func LoginTapped(_ sender: UIButton) {
        
        let Email =  Emailfield.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = PassField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        if Email != "" && password != ""{
            apiLoginCall()
        }
        else if Email == ""{
            AlertDisplay(titleAlert: "Email Missing", messageAlert: "Please fill Email", ActionTitle: "OK")
        }
        else if  password == ""{
            AlertDisplay(titleAlert: "Password Missing", messageAlert: "Please fill password", ActionTitle: "OK")

        }
        

    }
    
    @IBAction func SignupTapped(_ sender: UIButton){
        let vc = StoryBoards.Auth.instantiateViewController(withIdentifier: "SignupVC") as! SignupVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
   @objc func viewTapped(){
        self.Emailfield.endEditing(true)
        self.PassField.endEditing(true)
    }
    
//  MARK: -   this is for alert
//    func AlertDisplay(titleAlert: String, messageAlert: String, ActionTitle: String) {
//        let Alert = UIAlertController(title: titleAlert, message: messageAlert, preferredStyle: .alert)
//        let ActionAlert = UIAlertAction(title: ActionTitle, style: .cancel)
//        Alert.addAction(ActionAlert)
//        present(Alert, animated: true)
//
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

}
