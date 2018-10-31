//
//  ListViewTableViewCell.swift
//  GeneratedPackList
//
//  Created by Marcus Thuvesen on 2018-10-30.
//  Copyright © 2018 Marcus Thuvesen. All rights reserved.
//

import UIKit

class ListViewTableViewCell: UITableViewCell {

    @IBOutlet weak var checkMarkOutl: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    var checked = false
    @IBAction func checkMarkBtn(_ sender: Any) {
        
        if checked == false{
            self.checkMarkOutl.setImage(UIImage(named: "Checkmark.png"), for: .normal)
            checked = true
            self.alpha = 0.3
        }else{
            self.checkMarkOutl.setImage(UIImage(named: "Checkmarkempty.png"), for: .normal)
            checked = false
            self.alpha = 1
        }
        
    }
}
