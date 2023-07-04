//
//  DisneyCharacterDetailFilmsTableViewCell.swift
//  DisneyApp
//
//  Created by ertugrul.ozvardar on 21.06.2023.
//

import UIKit

class DisneyCharacterDetailFilmsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var filmLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Methods
    func configure(with film: String?) {
        if let filmName = film {
            filmLabel.text = filmName
        } else {
            filmLabel.text = "Karaktere ait film bulunamadı."
        }
    }
    
}
