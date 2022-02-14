//
//  BountyListViewController.swift
//  BountyList
//
//  Created by chxhyxn on 2022/02/14.
//

import UIKit

class BountyListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let arrayName = ["Brook", "Chopper", "Franky", "Luffy", "Nami", "Robin", "Sanji", "Zoro"]
    let arrayBounty = [33000000, 50, 44000000, 300000000, 16000000, 80000000, 77000000, 120000000]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail"{
            let detailViewController = segue.destination as? DetailViewController
            if let indexPath = sender as? Int{
                detailViewController?.name = arrayName[indexPath]
                detailViewController?.bounty = arrayBounty[indexPath]
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayName.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CellBounty else{
            return UITableViewCell()
//            return
        }
        
        let img = UIImage(named: "\(arrayName[indexPath.row]).jpg")
        cell.imgViewBounty.image = img
        cell.lblName.text = arrayName[indexPath.row]
        cell.lblBounty.text = "$\(arrayBounty[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
}
class CellBounty: UITableViewCell{
    @IBOutlet weak var imgViewBounty: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblBounty: UILabel!
}
