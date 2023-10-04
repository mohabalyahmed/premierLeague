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
               cell?.homeLabel.text = viewModel.matchAtIndex(indexPath.row)?.homeTeam?.name
               cell?.awayLabel.text = viewModel.matchAtIndex(indexPath.row)?.awayTeam?.name
               
               // Use optional binding to unwrap and convert the score to a string
               if let homeScore = viewModel.matchAtIndex(indexPath.row)?.score?.fullTime?.homeTeam {
                   cell?.homeScore.text = "\(homeScore)"
               } else {
                   cell?.homeScore.text = "" // Set an empty string or a default value if it's nil
               }
               
               // Similarly, do the same for away score
               if let awayScore = viewModel.matchAtIndex(indexPath.row)?.score?.fullTime?.awayTeam {
                   cell?.awayScore.text = "\(awayScore)"
               } else {
                   cell?.awayScore.text = "" // Set an empty string or a default value if it's nil
               }
           }
           
           return cell ?? UITableViewCell()
       }
}

