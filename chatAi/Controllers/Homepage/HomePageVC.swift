//
//  HomePageVC.swift
//  chatAi
//
//  Created by MacBook M1 on 14/04/23.
//

import UIKit

class HomePageVC: UIViewController{
    
    
    var ChatData = [chat]()
    var indexForShareText:String?
    @IBOutlet weak var ProfileBtn: UIButton!
    @IBOutlet weak var textFiledViewHeight: NSLayoutConstraint!
    @IBOutlet weak var textViewHieght: NSLayoutConstraint!
    @IBOutlet weak var textByUser: UITextView!
    @IBOutlet weak var HompageTabelView: UITableView!
    @IBOutlet weak var placeholderLabel: UILabel!
    
    //MARK - THIS VC IS FOR AFTER API DATA GOT AN LOADED IN ACCPUNT VC
   // var VC: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // PLACHOLDER COLOR CHANGE
        placeholderLabel.textColor = UIColor.lightText
        //TO SET THE TEXTFIELD ACCORDING TO KEYPAD
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        //TEXT FIELD DELELGATE
        textByUser.delegate = self
        
        // TABEL DELIGATE
        HompageTabelView.delegate = self
        HompageTabelView.dataSource = self
        // REGISTERED UINIB
        HompageTabelView.register(UINib(nibName: "HomeReceverCell", bundle: nil),forCellReuseIdentifier: "HomeReceverCell")
        HompageTabelView.register(UINib(nibName: "HomepageSenderTablecell", bundle: nil),forCellReuseIdentifier: "HomepageSenderTablecell")
//         gesture for tabel so that keyboard removed when tapped
        let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.TableViewTapped))
        self.HompageTabelView.addGestureRecognizer(tapGesture)

        
        
//         Do any additional setup after loading the view.
//isModalInPresentation = true
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
//        getUserByIdApiCall(){[self] nam , emai ,imag , MessageApi in
//
//            let vc = StoryBoards.Account.instantiateViewController(withIdentifier: "AccountVC") as! AccountVC
//
//            vc.userName = nam ?? "default"
//            vc.userEmail = emai ?? "default"
//
//            VC = vc
//
//        }
    }
   
    
    @IBAction func ProfileTapped(_ sender: UIButton) {
    
//        getUserByIdApiCall(){[self] nam , emai ,imag , MessageApi in
//
            
//
//            vc.userName = nam ?? "default"
//            vc.userEmail = emai ?? "default"
        let vc = StoryBoards.Account.instantiateViewController(withIdentifier: "AccountVC") as! AccountVC
            navigationController?.pushViewController(vc, animated: true)
//
//
//        }
////
    }
    
    @IBAction func sendTapped(_ sender: UIButton)
    {
//        self.textByUser.endEditing(true)
        let txt = textByUser.text?.trimmingCharacters(in: .whitespacesAndNewlines)
//        textViewHieght.constant = 40
        if txt ==  ""{
            textByUser.text = ""
        }
        textViewHieght.constant = 40
        
        if txt != "" {
//            placeholderLabel.isHidden = false
//            self.textByUser.endEditing(true)
            let senderMessage = chat(userName: "", Message: txt, type: .Sender)
            ChatData.append(senderMessage)
            
            
            
            DispatchQueue.main.asyncAfter(deadline: .now()+2){ [self] in
                let recevedMessage = "how are you who are you. how can i help you"
                let recevedMessage2 = "ok"
                if recevedMessage != ""{
                    let ReceverMessage = chat(userName: "", Message: recevedMessage, type: .Recever)
                    let ReceverMessage2 = chat(userName: "", Message: recevedMessage2, type: .Recever)

                    ChatData.append(ReceverMessage)
                    ChatData.append(ReceverMessage2)
                    HompageTabelView.reloadData()
                    TabelScrole(ROW: ChatData.count-1, tabelToScrole: HompageTabelView)
                }
            }
            self.textByUser.text = ""
        }
//        DispatchQueue.main.asyncAfter(deadline: .now()+2){ [self] in
//            let recevedMessage = "how are you who are you can you give me some of your fruits"
//            let recevedMessage2 = "ok"
//            if recevedMessage != ""{
//                let ReceverMessage = chat(userName: "", Message: recevedMessage, type: .Recever)
//                let ReceverMessage2 = chat(userName: "", Message: recevedMessage2, type: .Recever)
//
//                ChatData.append(ReceverMessage)
//                ChatData.append(ReceverMessage2)
//                HompageTabelView.reloadData()
//
//            }
//        }
        
        HompageTabelView.reloadData()
        if txt != ""{
            TabelScrole(ROW: ChatData.count-1, tabelToScrole: HompageTabelView)
        }
    }
    
   @objc func TableViewTapped(){
        self.textByUser.endEditing(true)
//       self.textFiledViewHeight.constant = 50
       let textuser = textByUser.text.trimmingCharacters(in: .whitespacesAndNewlines)
       if textuser == ""{
           textByUser.text = ""
           textViewHieght.constant = 40
           placeholderLabel.isHidden = false
       }
    }
    
    
    // for textfield according to keyboard
    
    
   @objc func keyboardWillShow(notification: Notification)  {
//        if let info = notification.userInfo{
//            let rect:CGRect = notification.info["UIKeyboardFrameEndUserInfoKey"] as! CGRect
//            return (Int)(rect.height+50)
//        }else{
//            return  (350)
//        }
       
       guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
           let keyboardHeight = keyboardFrame.height
       if self.textFiledViewHeight.constant != keyboardHeight{
           self.view.layoutIfNeeded()
           UIView.animate(withDuration: 0.5) {
               
               self.textFiledViewHeight.constant = keyboardHeight-80
               
               
               self.view.layoutIfNeeded()
           }
       }
    }
    
    
    
    @objc func keyboardWillHide(notification: Notification) {
      
        if self.textFiledViewHeight.constant != 3 {
            self.view.layoutIfNeeded()
            UIView.animate(withDuration: 0.5) {
                self.textFiledViewHeight.constant = 3
                
                self.view.layoutIfNeeded()
            }
        }
    }
    
    deinit {
            NotificationCenter.default.removeObserver(self)
        }
    
    
    

}
