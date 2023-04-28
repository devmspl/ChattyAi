//
//  personalinfoVC+Extension.swift
//  chatAi
//
//  Created by MacBook M1 on 15/04/23.
//

import Foundation
import UIKit
import PhotosUI
extension PersonalinfoVC: PHPickerViewControllerDelegate{
    
    func PickImage(){
        var configu = PHPickerConfiguration()
        configu.filter = .images
        configu.selectionLimit = 1
        
        
        let PikerController = PHPickerViewController(configuration: configu)
        PikerController.delegate = self
        present(PikerController, animated: true)
    
    }
    
    
    
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true,completion: nil)
        for result in results {
            result.itemProvider.loadObject(ofClass: UIImage.self){obj , error in
                if let Image = obj as? UIImage {
                    self.imageUser = Image
                    DispatchQueue.main.async {
                        self.profilePic.image = Image
                    }
                }
                
            }
        }
        
        
    }
    
    func pickerDidCancel(_ picker: PHPickerViewController) {
            dismiss(animated: true, completion: nil)
        }
    
   
    
    
    
}
