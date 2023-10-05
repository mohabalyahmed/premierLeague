//
//  ViewController.swift
//  PremierLeague
//
//  Created by Mohab Aly on 02/10/2023.
//

import UIKit

class ViewController: UIViewController, MatchesViewModelDelegate {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: MatchesViewModel = MatchesViewModel()

       override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view.
           tableView.dataSource = self
           tableView.delegate = self
           tableView.register(tableViewCell.nib(), forCellReuseIdentifier: tableViewCell.identifier)
           viewModel.delegate = self
           viewModel.fetchMatches()
       }

    func didFetchMatches(matches: [Matches]) {
            // Update your table view with the fetched matches
            self.tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Use the viewModel to determine the number of matches
        return viewModel.numberOfMatches()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCell.identifier, for: indexPath) as? tableViewCell
        
        // Use the viewModel to get match data
        if let match = viewModel.matchAtIndex(indexPath.row) {
            // Populate the cell with match data
            cell?.homeLabel.text = match.homeTeam?.name
            cell?.awayLabel.text = match.awayTeam?.name
            
            
            // Use optional binding to unwrap and convert the score to a string
            if let homeScore = viewModel.matchAtIndex(indexPath.row)?.score?.fullTime?.homeTeam, let awayScore = viewModel.matchAtIndex(indexPath.row)?.score?.fullTime?.awayTeam {
                cell?.homeScore.text = "\(homeScore)"
                cell?.separatorView.text = ":"
                cell?.awayScore.text = "\(awayScore)"
            } else {
                let dateString = viewModel.matchAtIndex(indexPath.row)?.utcDate ?? ""
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
                dateFormatter.timeZone = TimeZone(identifier: "UTC")
                if let date = dateFormatter.date(from: dateString) {
                    let calendar = Calendar.current
                    let hour = calendar.component(.hour, from: date)
                    let minute = calendar.component(.minute, from: date)
                    
                    let timeString = String(format: "%02d:%02d", hour, minute)
                    cell?.homeScore.text = timeString
                    cell?.awayScore.text = ""
                    cell?.separatorView.text = ""
                }
            }
        }
        return cell ?? UITableViewCell()
    }
}

