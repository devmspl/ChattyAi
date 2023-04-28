//
//  PersonalinfoVC.swift
//  chatAi
//
//  Created by MacBook M1 on 15/04/23.
//

import UIKit

class PersonalinfoVC: UIViewController {
    @IBOutlet weak var fullnameFild: UITextField!
    @IBOutlet weak var EmailField: UITextField!
    @IBOutlet weak var ChanePasswordFiled: UITextField!
    @IBOutlet weak var profilePic: UIImageView!
    var imageUser: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
    
    @IBAction func PlusTapped(_ sender: UIButton) {
        
        PickImage()
    }
    @IBAction func DeactiveTapped(_ sender: UIButton){
        navigationController?.popViewController(animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        getUserByIdApiCall {[self] name, email, image, MessageApi in
            fullnameFild.text = name
            EmailField.text = email
            DispatchQueue.main.asyncAfter(deadline: .now()+3){
                if MessageApi != nil {
                    self.AlertDisplay(titleAlert: MessageApi!, messageAlert: "", ActionTitle: "OK")
                }
            }
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        
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
