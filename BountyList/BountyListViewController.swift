//
//  BountyListViewController.swift
//  BountyList
//
//  Created by chxhyxn on 2022/02/14.
//

import UIKit

class BountyListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let viewModel = BountyListViewModel()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail"{
            let detailViewController = segue.destination as? DetailViewController
            if let indexPath = sender as? Int{
                let bountyInfo = viewModel.bountyInfo(at: indexPath)
                detailViewController?.viewModel.update(model: bountyInfo)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numOfBountyInfoList
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CellBounty else{
            return UITableViewCell()
//            return
        }
        
        let bountyInfo = viewModel.bountyInfo(at: indexPath.row)
        
        cell.update(info: bountyInfo)
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
    
    func update(info: BountyInfo){
        imgViewBounty.image = info.image
        lblName.text = info.name
        lblBounty.text = "$\(info.bounty)"
    }
}

class BountyListViewModel{
    let bountyInfoList: [BountyInfo] = [
        BountyInfo(name: "Brook", bounty: 33000000),
        BountyInfo(name: "Chopper", bounty: 50),
        BountyInfo(name: "Franky", bounty: 44000000),
        BountyInfo(name: "Luffy", bounty: 300000000),
        BountyInfo(name: "Nami", bounty: 16000000),
        BountyInfo(name: "Robin", bounty: 80000000),
        BountyInfo(name: "Sanji", bounty: 77000000),
        BountyInfo(name: "Zoro", bounty: 120000000)
    ]
    
    var sortedBountyInfoList : [BountyInfo]{
        let sortedBountyInfoList = bountyInfoList.sorted(by: {
            $0.bounty > $1.bounty
        })
        return sortedBountyInfoList
    }
    
    var numOfBountyInfoList: Int{
        return bountyInfoList.count
    }
    
    func bountyInfo(at index: Int) -> BountyInfo{
        return sortedBountyInfoList[index]
    }
    
}
