//
//  MyTableViewCell.swift
//  myapp
//
//  Created by Stuti Bhavsar  on 08/03/22.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    //MARK: IBOutlet
    @IBOutlet weak var myImage: UIImageView!
   
    @IBOutlet weak var labelName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
