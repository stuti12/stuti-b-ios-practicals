//
//  MyCollectionViewCell.swift
//  myapp
//
//  Created by Stuti Bhavsar  on 08/03/22.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    //MARK: IBOutlet
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

