//
//  UserListTableViewCell.swift
//  myapp
//
//  Created by Stuti Bhavsar  on 28/03/22.
//

import UIKit

class UserListTableViewCell: UITableViewCell {
    
    //MARK: - IBOutlet
    @IBOutlet weak var ivImageView: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       
    }
    //MARK: - function to set Value to cell
    func configureCellValue(name: String, email: String, imageName: URL) {
        DispatchQueue.global().async {
            let imageData = try? Data(contentsOf: imageName)
            DispatchQueue.main.async
            {[weak self] in
                guard let uSelf = self else {return}
                uSelf.lblUserName.text = name
                uSelf.lblEmail.text = email
                uSelf.ivImageView.image = UIImage(data: imageData!)
            }
        }
    }
}
