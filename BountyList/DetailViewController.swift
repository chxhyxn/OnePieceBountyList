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
    @IBOutlet weak var lblNameCenterX: NSLayoutConstraint!
    @IBOutlet weak var lblBountyCenterX: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        prepareAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAnimation()
    }
    
    private func prepareAnimation(){
//        lblNameCenterX.constant = view.bounds.width
//        lblBountyCenterX.constant = view.bounds.width
        
        lblName.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 180)
        lblBounty.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 180)
        
        lblName.alpha = 0
        lblBounty.alpha = 0
    }
    
    private func showAnimation(){
//        lblNameCenterX.constant = 0
//        lblBountyCenterX.constant = 0
//
//        UIView.animate(withDuration: 0.3, animations: {
//            self.view.layoutIfNeeded()
//        })
        
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
            self.lblName.transform = CGAffineTransform.identity
            self.lblName.alpha = 1
        }, completion: nil)
        
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {            self.lblBounty.transform = CGAffineTransform.identity
            self.lblBounty.alpha = 1
        }, completion: nil)
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
