//
//  NestedListViewCell.swift
//  creatingList
//
//  Created by Gaurav Sara on 14/01/24.
//

import UIKit

class NestedListViewCell: UITableViewCell {
    @IBOutlet weak var nestedTableView: UITableView!
    
    var teamList: CompetitionSummaryList?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nestedTableView.delegate = self
        nestedTableView.dataSource = self
        nestedTableView.register(UINib(nibName: "PlayersSubHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "PlayersSubHeaderView")
        nestedTableView.register(UINib(nibName: "ListViewCell", bundle: nil), forCellReuseIdentifier: "ListViewCell")
        
        if #available(iOS 15.0, *) {
            nestedTableView.sectionHeaderTopPadding = 0
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension NestedListViewCell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "PlayersSubHeaderView") as? PlayersSubHeaderView else { return nil }
        headerView.updateCell(teamList!)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = teamList?.items?.count {
            return count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListViewCell", for: indexPath) as! ListViewCell
        cell.updateCell(teamList!.items![indexPath.row])
        
        return cell
    }
}
