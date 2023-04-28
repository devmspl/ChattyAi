//
//  PlanScreenVC.swift
//  chatAi
//
//  Created by MacBook M1 on 13/04/23.
//

import UIKit

class PlanScreenVC: UIViewController {
    @IBOutlet weak var PlanPageControl: UIPageControl!
    @IBOutlet weak var PlanCollectionView: UICollectionView!
    let planArray = ["Basic plan","Standered Plan","Ultra Plan"]
    let tokenLimitArray = ["100k","500k","1 Million"]
    let imageGenerationArrray = ["100","200","500"]
    let transcriptionLimitArray = ["10Hrs","20Hrs","50Hrs"]
    let tokenlimitSubArray = ["With each token being roughly equivalent to 4 letters, our system allows you to generate an estimated 75,000 words by utilizing 100K tokens.","With each token being roughly equivalent to 4 letters, our system allows you to generate an estimated 350,000 words by utilizing 500k tokens.","With each token being roughly equivalent to 4 letters, our system allows you to generate an estimated 750,000 words by utilizing 1 Million tokens."]
    
    let imagenrationSubArray = ["Indulge in generating AI Images with our comprehensive 2 Months subscription plan, offering the ability to generate up to 100 high-quality images.","Indulge in generating AI Images with our comprehensive 6 Months subscription plan, offering the ability to generate up to 200 high-quality images.","Indulge in generating AI Images with our comprehensive 1 year subscription plan, offering the ability to generate up to 500 high-quality images."]
    let transcriptSubArray = ["Experience the convenience of 10 hours of accurate speech-to-text transcription services, available for a duration of two months.","Experience the convenience of 20 hours of accurate speech-to-text transcription services, available for a duration of six months.","Experience the convenience of 50 hours of accurate speech-to-text transcription services, available for a duration of 1 year."]
    
    let priceArray = ["$20","$50","$100"]
    let planDurArray = ["Two Month Subscription","Six Month Subscription","1 Year Subscription"]
    override func viewDidLoad() {
        super.viewDidLoad()
        PlanCollectionView.register(UINib(nibName: "PlanScreenCell", bundle: nil),forCellWithReuseIdentifier: "PlanScreenCell")
        PlanPageControl.numberOfPages = 3

    }
    
    @IBAction func CancelTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tryfreeTapped(_ sender: UIButton) {
        let vc = StoryBoards.TabBar.instantiateViewController(withIdentifier: "TabBarVC") as! TabBarVC
        navigationController?.pushViewController(vc, animated: true)
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
