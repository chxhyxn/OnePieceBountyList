//
//  DetailViewController.swift
//  BountyList
//
//  Created by chxhyxn on 2022/02/14.
//

import UIKit

class DetailViewController: UIViewController {

    let viewModel = DetailViewModel()
    
    @IBOutlet weak var imgViewBounty: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblBounty: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI(){
        if let bountyInfo = viewModel.bountyInfo {
            imgViewBounty.image = bountyInfo.image
            lblName.text = bountyInfo.name
            lblBounty.text = "$\(bountyInfo.bounty)"
        }
    }
    
    @IBAction func btnClose(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    class DetailViewModel{
        var bountyInfo: BountyInfo?
        
        func update(model: BountyInfo?){
            bountyInfo = model
        }
    }
    
}
