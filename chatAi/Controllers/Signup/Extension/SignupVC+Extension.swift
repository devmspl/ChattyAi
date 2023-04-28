//
//  SignupVC+Extension.swift
//  chatAi
//
//  Created by MacBook M1 on 27/04/23.
//

import Foundation
import UIKit
import Alamofire

extension SignupVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

extension SignupVC{
    func  SignupApiCall(){
        if ReachabilityNetwork.isConnectedToNetwork(){
            let randomDecimalNo = Double.random(in: 0..<1000)
            let parems: [String:Any] = ["fullname": nameField.text!,
                                        "email": EmailField.text!,
                                        "phone": "\(randomDecimalNo)",
                                        "deviceToken": "device_token",
                                        "password": passwordField.text!,
                                        "is_activated": true,
                                        "is_deleted": false
                                            ]
            
            AF.request(ApiUrls.SignUp, method: .post , parameters: parems , encoding: JSONEncoding.default).response{
              [self]  response in switch response.result{
                
            case .success(let data):do{
                let json = try? JSONSerialization.jsonObject(with: data!) as? [String: Any]
                let status = response.response?.statusCode
                print("This is Singup json \(json!)")
                if status == 200 {
                    let SignupData = json?["data"] as? [String: Any]
                    let SignupId = (SignupData?["_id"] as? String)!
                    print("This is Singup json \(SignupId)")
                     // MARK -  THIS IS DEFAULT TO SET SIGNUPID
                    UserDefaults.standard.set(SignupId, forKey: "SignupId")
                    let Alert = UIAlertController(title: "Sign Up Successfull", message: "Please login now", preferredStyle: .alert)
                    let Ok = UIAlertAction(title: "Ok", style: .default) {[self] Ok in
                        let vc = StoryBoards.Auth.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
                        navigationController?.pushViewController(vc, animated: true)
                       
                        
                    }
                    Alert.addAction(Ok)
                    present(Alert, animated: true)
                }else{
                    let message = (json?["message"] as? String)!
                    AlertDisplay(titleAlert: message, messageAlert: "", ActionTitle: "OK")
                    
                }
                
            }
                
            case .failure(_):
                AlertDisplay(titleAlert: "Somthing went wrong", messageAlert: "Please try after sometime", ActionTitle: "OK")
            }
                
            }
            
            
        }else{
            AlertDisplay(titleAlert: "Network Error", messageAlert: "Please Check Your Internet", ActionTitle: "OK")
        }
    }
}
