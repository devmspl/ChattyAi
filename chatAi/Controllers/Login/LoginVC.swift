//
//  LoginVC.swift
//  ChatBot
//
//  Created by MacBook M1 on 11/04/23.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitTapped(_ sender: UIButton) {
        let vc = StoryBoards.Auth.instantiateViewController(withIdentifier: "OtpVC") as! OtpVC
        self.navigationController?.pushViewController(vc, animated: true)
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
