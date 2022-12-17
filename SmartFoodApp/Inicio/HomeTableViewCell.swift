//
//  HomeTableViewCell.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 5/12/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet private weak var foodCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
