//
//  DetailViewController.swift
//  BountyList
//
//  Created by chxhyxn on 2022/02/14.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imgViewBounty: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblBounty: UILabel!
    
    var name: String?
    var bounty: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI(){
        if let name = name, let bounty = bounty {
            let img = UIImage(named: "\(name).jpg")
            imgViewBounty.image = img
            lblName.text = name
            lblBounty.text = "$\(bounty)"
        }
    }
    
    @IBAction func btnClose(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
