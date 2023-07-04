//
//  DisneyCharacterDetailTvShowsTableViewCell.swift
//  DisneyApp
//
//  Created by ertugrul.ozvardar on 21.06.2023.
//

import UIKit

class DisneyCharacterDetailTvShowsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var tvShowLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Methods
    func configure(with tvShow: String?) {
        if let tvShowName = tvShow {
            tvShowLabel.text = tvShowName
        } else {
            tvShowLabel.text = "Karaktere ait tv show bulunamadı."
        }
    }
    
}
