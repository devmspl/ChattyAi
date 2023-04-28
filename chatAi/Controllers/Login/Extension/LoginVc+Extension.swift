//
//  LoginVc+Extension.swift
//  chatAi
//
//  Created by MacBook M1 on 25/04/23.
//

import Foundation
import UIKit
import Alamofire
extension LoginVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension LoginVC{

    func apiLoginCall(){
        
        if ReachabilityNetwork.isConnectedToNetwork() {
            
            let parames:[String:Any] = ["email": Emailfield.text! ,"password": PassField.text!]
            print("this is parames\(parames)")
            AF.request(ApiUrls.login , method: .post , parameters: parames, encoding: JSONEncoding.default).response{[self] response in switch response.result{
                
            case .success(let data):do{
                let status = response.response?.statusCode
                
                let json = try? JSONSerialization.jsonObject(with: data!) as? [String:Any]
                
//                print( "this is the json \(json!)")
                
                if status == 200{
                    
                    let data = json?["data"] as? [String:Any]
                    let LoginToken = (data?["token"] as? String)!
                    let LoginId = (data?["_id"] as? String)!
                    //MARK: - SETTING THE DEFAULT VALLUES FOR LOGINID AND LOGIN TOKEN
//                    print(LoginToken)
                    UserDefaults.standard.set(LoginToken, forKey: "LoginToken")
                    UserDefaults.standard.set(LoginId, forKey: "LoginId")
                    //MARK: -
                    let vc = StoryBoards.Auth.instantiateViewController(withIdentifier: "PlanScreenVC") as! PlanScreenVC
                    self.navigationController?.pushViewController(vc, animated: true)
                }else{
                    let message = json?["message"] as! String
                AlertDisplay(titleAlert: message, messageAlert: "", ActionTitle: "OK")
                }
                
                
                
            }
                
            case .failure(_):
                AlertDisplay(titleAlert: "error", messageAlert: "Please try after sometime", ActionTitle: "OK")            }
                
            }
            
        }else{
            AlertDisplay(titleAlert: "Network error", messageAlert: "Please check Your Internet", ActionTitle: "OK")

        }
    }
}
