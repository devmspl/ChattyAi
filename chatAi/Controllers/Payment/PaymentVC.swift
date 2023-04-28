//
//  PaymentVC.swift
//  chatAi
//
//  Created by MacBook M1 on 15/04/23.
//

import UIKit

class PaymentVC: UIViewController {

    @IBOutlet weak var PaypalCircleBtnView: UIView!
    @IBOutlet weak var AddcardCircleBtnView: UIView!
    var selectedPayMethod = "none"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func PaypalTapped(_ sender: UIButton) {
        var colorback = SetcolorRgb(red: 23, green: 206, blue: 146)
        PaypalCircleBtnView.backgroundColor = colorback
         colorback = SetcolorRgb(red: 19, green: 27, blue: 43)
        AddcardCircleBtnView.backgroundColor = colorback
        self.selectedPayMethod = "PayPal"
    }
    
    @IBAction func AddCardTapped(_ sender: UIButton) {
        var colorback = SetcolorRgb(red: 23, green: 206, blue: 146)
        AddcardCircleBtnView.backgroundColor = colorback
         colorback = SetcolorRgb(red: 19, green: 27, blue: 43)
        PaypalCircleBtnView.backgroundColor = colorback
        selectedPayMethod = "Addcard"
    }
    
    @IBAction func continueTapped(_ sender: UIButton) {
        print("this is the selected method  \(selectedPayMethod)")
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
