//
//  OrderTableViewCell.swift
//  FeroFly
//
//  Created by Goutham Devaraju on 11/01/21.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

    @IBOutlet var labelOrder: UILabel!
    @IBOutlet var labelOrderNumber: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
