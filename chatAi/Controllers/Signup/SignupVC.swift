//
//  SignupVC.swift
//  chatAi
//
//  Created by MacBook M1 on 27/04/23.
//

import UIKit

class SignupVC: UIViewController {
    @IBOutlet weak var backGroundView: UIView!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var EmailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
//    let fieldArray = [nameField,EmailField,passwordField]
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - GIVING DELEGATE TO FIELDS
        let fieldArray = [nameField,EmailField,passwordField]
        setTextfieldPlachoderColor(textFieldArray: (fieldArray) as! [UITextField])
        for Fields in fieldArray{
            Fields?.delegate = self
        }
        
//        setTextfieldPlachoderColor(textFieldArray: fieldArray)
        
        
 
// MARK: - GESTURE TO HIDE KEYBOARD WHEN BACKGROUND TAPPED
        let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.ViewTapped))
        backGroundView.addGestureRecognizer(tapGesture)


        // Do any additional setup after loading the view.
    }
   @objc func ViewTapped(){
        self.passwordField.endEditing(true)
        self.EmailField.endEditing(true)
        self.nameField.endEditing(true)
    }
    
    
    @IBAction func SignUpTapped(_ sender: UIButton){
        let userName = nameField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let userEmail = EmailField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let userPassword = passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let emailValidation = isValidEmail(email: userEmail!)
        if userName != "" && userEmail != "" && userPassword != "" && emailValidation == true{
            SignupApiCall()
        }
        else if userName == ""{
            AlertDisplay(titleAlert: "Name Missing", messageAlert: "Please fill name", ActionTitle: "OK")
        }else if userEmail == ""{
            AlertDisplay(titleAlert: "Email Missing", messageAlert: "Please fill Email", ActionTitle: "OK")
        }else if userPassword == ""{
            AlertDisplay(titleAlert: "Password Missing", messageAlert: "Please fill Password", ActionTitle: "OK")
        }else if emailValidation == false{
            AlertDisplay(titleAlert: "Email not valid", messageAlert: "Please fill Correct email", ActionTitle: "OK")
        }
        
    }
    @IBAction func LoginTapped(_ sender: UIButton){
        let vc = StoryBoards.Auth.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        navigationController?.pushViewController(vc, animated: true)
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
