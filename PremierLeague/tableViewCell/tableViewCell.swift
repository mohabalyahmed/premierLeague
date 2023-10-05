//
//  tableViewCellTableViewCell.swift
//  PremierLeague
//
//  Created by Mohab Aly on 02/10/2023.
//

import UIKit

class tableViewCell: UITableViewCell {
    
    @IBOutlet weak var homeLabel: UILabel!
    @IBOutlet weak var awayLabel: UILabel!
    @IBOutlet weak var homeScore: UILabel!
    @IBOutlet weak var awayScore: UILabel!
    @IBOutlet weak var separatorView: UILabel!
    @IBOutlet weak var addToFavBtn: UIButton!
    static let identifier = "tableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "tableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
