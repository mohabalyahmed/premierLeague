//
//  ViewController.swift
//  PremierLeague
//
//  Created by Mohab Aly on 02/10/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var viewModel: MatchesViewModel = MatchesViewModel()

       override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view.
           tableView.dataSource = self
           tableView.delegate = self
           tableView.register(tableViewCell.nib(), forCellReuseIdentifier: tableViewCell.identifier)
       }
    override func viewDidAppear(_ animated: Bool) {
        viewModel.fetchMatches()
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           // Use the viewModel to determine the number of matches
           return 3
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCell.identifier, for: indexPath) as? tableViewCell
           
           // Use the viewModel to get match data
           if let match = viewModel.matchAtIndex(indexPath.row) {
               // Populate the cell with match data
               cell?.homeLabel.text = "Man UTD"
               cell?.awayLabel.text = "Arsenal"
               cell?.homeScore.text = "\(0)"
               cell?.awayScore.text = "\(3))"
           }
           
           return cell ?? UITableViewCell()
       }
}

