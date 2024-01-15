//
//  ViewController.swift
//  creatingList
//
//  Created by Gaurav Sara on 14/01/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var listTableView: UITableView!
    var competitionList: [CompetitionSummaryList]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        gettingLists()
    }

    func gettingLists() {
        listTableView.register(UINib(nibName: "PlayersHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "PlayersHeaderView")
        listTableView.register(UINib(nibName: "NestedListViewCell", bundle: nil), forCellReuseIdentifier: "NestedListViewCell")
        
        listTableView.translatesAutoresizingMaskIntoConstraints = true
        listTableView.rowHeight = UITableView.automaticDimension
        listTableView.estimatedRowHeight = 28
        
        if #available(iOS 15.0, *) {
            listTableView.sectionHeaderTopPadding = 0
        }
        
        if let path = Bundle.main.path(forResource: "jsonformatter", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                if let jsonArray = json as? [[String: Any]] {
                    let competitionListArray = jsonArray.map { CompetitionSummaryList(fromDictionary: $0) }
                    competitionList = competitionListArray
//                    for competition in competitionListArray {
//                        print(competition)
//                    }
                }
            } catch {
                print("Error reading JSON file: \(error)")
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let numberOfSection = self.competitionList?.count else { return 0 }
        
        return numberOfSection
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "PlayersHeaderView") as? PlayersHeaderView else { return nil }
        headerView.updateCell(competitionList![section])
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        print(competitionList![indexPath.section].items!.count)
        return (CGFloat(self.competitionList![indexPath.section].items!.count) + CGFloat(self.competitionList![indexPath.section].items![indexPath.row].items!.count)) * 40
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let competition = self.competitionList else { return 0 }
           
           if section < competition.count {
               return competition[section].items?.count ?? 0
           } else {
               return 0
           }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NestedListViewCell", for: indexPath) as! NestedListViewCell
        cell.teamList = competitionList![indexPath.section].items![indexPath.row]
        
        cell.nestedTableView.reloadData()
        
        return cell
    }
    
    
}
