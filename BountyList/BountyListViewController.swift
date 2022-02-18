//
//  BountyListViewController.swift
//  BountyList
//
//  Created by chxhyxn on 2022/02/14.
//

import UIKit

class BountyListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numOfBountyInfoList
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellBounty", for: indexPath) as? CellBounty else{
            return UICollectionViewCell()
        }
        
        let bountyInfo = viewModel.bountyInfo(at: indexPath.item)
        cell.update(info: bountyInfo)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        performSegue(withIdentifier: "showDetail", sender: indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSpacing: CGFloat = 10
        let textAreaHeight: CGFloat = 65
        let width: CGFloat = (collectionView.bounds.width - itemSpacing)/2
        let height: CGFloat = (width * 10 / 7 +  textAreaHeight)
        return CGSize(width: width, height: height)
    }
}

class CellBounty: UICollectionViewCell{
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
