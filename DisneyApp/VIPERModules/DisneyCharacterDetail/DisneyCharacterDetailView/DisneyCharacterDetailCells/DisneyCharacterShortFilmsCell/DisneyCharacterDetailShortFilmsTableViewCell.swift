//
//  DisneyCharacterDetailShortFilmsTableViewCell.swift
//  DisneyApp
//
//  Created by ertugrul.ozvardar on 2.07.2023.
//

import UIKit

class DisneyCharacterDetailShortFilmsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var shortFilmLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Methods
    func configure(with shortFilm: String?) {
        if let shortFilmName = shortFilm {
            shortFilmLabel.text = shortFilmName
        } else {
            shortFilmLabel.text = "Karaktere ait short film bulunamadı."
        }
    }
}
