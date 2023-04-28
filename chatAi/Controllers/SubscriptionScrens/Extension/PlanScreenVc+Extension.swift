//
//  PlanScreenVc+Extension.swift
//  chatAi
//
//  Created by MacBook M1 on 13/04/23.
//

import Foundation
import UIKit

extension PlanScreenVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate{
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return planArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/1, height: collectionView.frame.height/1)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = PlanCollectionView.dequeueReusableCell(withReuseIdentifier: "PlanScreenCell", for: indexPath) as! PlanScreenCell
        if(indexPath.item == 1){
            let backGround = SetcolorRgb(red: 59, green: 172, blue: 174)
            cell.offerView.backgroundColor = backGround
            
        }
        else if(indexPath.item == 2){
            let backGround = SetcolorRgb(red: 116, green: 212, blue: 119)
            cell.offerView.backgroundColor = backGround
        }
        
        cell.PlanName.text = planArray[indexPath.row]
        cell.tokenlimitLabel.text = tokenLimitArray[indexPath.row]
        cell.tokenLimitSubLabel.text = tokenlimitSubArray[indexPath.row]
        cell.imageGenLimitLabel.text = imageGenerationArrray[indexPath.row]
        cell.imageGenSubLabel.text = imagenrationSubArray[indexPath.row]
        cell.transcriptLimitLabel.text = transcriptionLimitArray[indexPath.row]
        cell.transcriptLimitSubLabel.text = transcriptSubArray[indexPath.row]
        cell.priceLabel.text = priceArray[indexPath.row]
        cell.planDurLabel.text = planDurArray[indexPath.row]
        return cell
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = Int(scrollView.contentOffset.x / scrollView.bounds.size.width)
            self.PlanPageControl.currentPage = currentPage    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = StoryBoards.Auth.instantiateViewController(withIdentifier: "PaymentVC") as! PaymentVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}



//extension PlanScreenVC{
//    func SetcolorRgb(red: Int,green: Int ,blue: Int) -> UIColor{
//        let redValue: CGFloat = CGFloat(red)/255 // 0.392
//        let greenValue: CGFloat = CGFloat(green)/255 // 0.588
//        let blueValue: CGFloat = CGFloat(blue)/255 // 0.784
//        
//
//        // Create a UIColor object with the desired RGB values
//        let myColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
//
//        // Set the background color of the view to the UIColor object
//       return myColor
//    }
//}
