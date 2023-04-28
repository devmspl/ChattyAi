//
//  UiviewController+Extension.swift
//  chatAi
//
//  Created by MacBook M1 on 15/04/23.
//

import Foundation
import UIKit
import Alamofire
extension UIViewController{
    
    // MARK: FOR RGB COLOR TO UICOR CONVAERSION
    func SetcolorRgb(red: Int,green: Int ,blue: Int) -> UIColor{
        let redValue: CGFloat = CGFloat(red)/255 // 0.392
        let greenValue: CGFloat = CGFloat(green)/255 // 0.588
        let blueValue: CGFloat = CGFloat(blue)/255 // 0.784
        

        // Create a UIColor object with the desired RGB values
        let myColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)

        // Set the background color of the view to the UIColor object
       return myColor
    }
    
    
//  MARK:  for place holder color chane
    
    func setTextfieldPlachoderColor(textFieldArray: [UITextField]){
        for txtfield in textFieldArray{
            if let placeholder = txtfield.placeholder {
                txtfield.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightText])
            }
            
        }
        
    }
    
    // MARK: - for Tabel Scrole According to chat data
    
    func TabelScrole(ROW: Int, tabelToScrole: UITableView!){
        let indexpath = IndexPath(row: ROW, section: 0)
        tabelToScrole.scrollToRow(at: indexpath, at: .bottom, animated: true)
        
    }
    
    // MARK: - when textfiled is empty
    func AlertDisplay(titleAlert: String, messageAlert: String, ActionTitle: String) {
        let Alert = UIAlertController(title: titleAlert, message: messageAlert, preferredStyle: .alert)
        let ActionAlert = UIAlertAction(title: ActionTitle, style: .cancel)
        Alert.addAction(ActionAlert)
        present(Alert, animated: true)
        
    }
    
    // MARK: - validation
    func isValidEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }

    //MARK: - getuser api call
    func getUserByIdApiCall(completion: @escaping (_ name: String?,_ email: String?,_ image: String?,_ MessageApi: String?) -> Void){
        if ReachabilityNetwork.isConnectedToNetwork(){
            let Logid:String = UserDefaults.standard.value(forKey: "LoginId") as! String
            let LogToken:String = UserDefaults.standard.value(forKey: "LoginToken") as! String
            
            let header:HTTPHeaders = ["x-access-token": LogToken]
            
            AF.request(ApiUrls.GetUser+Logid,method: .get,headers: header).response{
               response in switch response.result{
                    
                case .success(let data):do{
                    let json = try? JSONSerialization.jsonObject(with: data!) as? [String:Any]
                    let status = response.response?.statusCode
//                    print("This is userget json \(json)")
                    
                    if status == 200{
                        let data = json?["data"] as? [String: Any]
                        let  fullname = (data?["fullname"] as? String)!
                        let  email = (data?["email"] as? String)!
                        let  img = (data?["image"] as? String)!
                        
                    
                        completion(fullname,email,img,nil)
//
                    }else{
                        let message = (json?["message"] as? String)!
//                        AlertDisplay(titleAlert: message, messageAlert: "", ActionTitle: "OK")
                        completion(nil,nil,nil,message)
                        
                    }
                        
    
                    
                }
                    
                case .failure(_):
//                    AlertDisplay(titleAlert: "Somthing went wrong", messageAlert: "Try later", ActionTitle: "Ok")
                  completion(nil,nil,nil,"Something went wrong")
                }
            }
            
        }else{
//            AlertDisplay(titleAlert: "Network Error", messageAlert: "Please check your connection", ActionTitle: "Ok")
            completion(nil,nil,nil,"Network Error")
        }
    }
    
}
