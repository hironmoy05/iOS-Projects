//
//  PlayerHeaderView.swift
//  creatingList
//
//  Created by Gaurav Sara on 14/01/24.
//

import UIKit

class PlayersHeaderView: UITableViewHeaderFooterView {
    @IBOutlet weak var labelView: UILabel!
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        // Load the XIB file
        _ = UINib(nibName: "PlayersHeaderView", bundle: nil)
    }
    
    func updateCell(_ data: CompetitionSummaryList) {
        labelView.text = data.title
    }
}
