//
//  ListViewCell.swift
//  creatingList
//
//  Created by Gaurav Sara on 14/01/24.
//

import UIKit

class ListViewCell: UITableViewCell {
    @IBOutlet weak var labelView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCell(_ data: CompetitionSummaryList) {
        labelView.text = data.title
    }
    
    
}
