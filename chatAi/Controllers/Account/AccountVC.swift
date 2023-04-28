//
//  AccountVC.swift
//  chatAi
//
//  Created by MacBook M1 on 14/04/23.
//

import UIKit

class AccountVC: UIViewController {
    @IBOutlet weak var AccountCollectionView: UITableView!
    @IBOutlet weak var UserImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    let settingNameArray = ["Personal Info","History",
                            "Privicy Policy","About OpenChat Ai","Feedback",
                            "ContactUs","Tell a Friend"]
    let SettingLogo = ["person.fill","clock.arrow.circlepath","lock.circle"
                       ,"info.circle","hand.thumbsup.circle","mail",
                       "heart.circle"]
    
//    var userName:String = ""
//    var userEmail:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
       
        AccountCollectionView.register(UINib(nibName: "AccountCell", bundle: nil),forCellReuseIdentifier: "AccountCell")
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        getUserByIdApiCall {[self] name, email, image, message in
            userNameLabel.text = name
            userEmailLabel.text = email
            print("img \(image!) ..")
            if image != "" {
                // set image
                
            }
            if message != nil {
                AlertDisplay(titleAlert: message!, messageAlert: "", ActionTitle: "ok")
            }
            
        }

    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        userNameLabel.text = userName
//        userEmailLabel.text = userEmail
//        print("\(userName)  ... ")
//        print("\(userEmail)  ... ")
//        print("\(userNameLabel.text)  ... ")
//        print("\(userEmailLabel.text)  ... ")
//    }
//    func setlabels(){
//        userNameLabel.text = userName
//        userEmailLabel.text = userEmail
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
