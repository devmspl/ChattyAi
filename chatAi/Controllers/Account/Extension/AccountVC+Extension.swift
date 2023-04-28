//
//  AccountVC+Extension.swift
//  chatAi
//
//  Created by MacBook M1 on 14/04/23.
//

import Foundation
import UIKit

extension AccountVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = AccountCollectionView.dequeueReusableCell(withIdentifier: "AccountCell") as! AccountCell
        cell.settingName.text = settingNameArray[indexPath.item]
        cell.SettingImg.image = UIImage(systemName: SettingLogo[indexPath.item])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == 0){
            let  vc = StoryBoards.Account.instantiateViewController(withIdentifier: "PersonalinfoVC") as! PersonalinfoVC
            navigationController?.pushViewController(vc, animated: true)
            
        }else if (indexPath.row == 3){
            let  vc = StoryBoards.Account.instantiateViewController(withIdentifier: "AboutusVC") as! AboutusVC
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
}
