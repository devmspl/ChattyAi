//
//  AboutusVC.swift
//  chatAi
//
//  Created by MacBook M1 on 15/04/23.
//

import UIKit

class AboutusVC: UIViewController {
    
    @IBOutlet weak var AboutusTxtLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
   @IBAction func backTapped(_ sender: UIButton){
       navigationController?.popViewController(animated: true)
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
