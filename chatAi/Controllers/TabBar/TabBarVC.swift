//
//  TabBarVC.swift
//  chatAi
//
//  Created by MacBook M1 on 12/04/23.
//

import UIKit

class TabBarVC: UITabBarController {
  //  @IBOutlet weak var barButtonItem : UITabBarItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        let colortabText = SetcolorRgb(red: 23, green: 206, blue: 146)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: colortabText], for: .selected)
        
        self.tabBar.unselectedItemTintColor = UIColor.white
        
        // Do any additional setup after loading the view.
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
