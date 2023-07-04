//
//  DisneyCharactersTableViewCell.swift
//  DisneyApp
//
//  Created by ertugrul.ozvardar on 19.06.2023.
//

import UIKit
import Kingfisher

protocol DisneyCharacterTableViewCellDelegate {
    func onCharacterPageButtonPressed(cell: DisneyCharactersTableViewCell)
}

class DisneyCharactersTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    
    var homepageURL: String?
    var delegate: DisneyCharacterTableViewCellDelegate!
    
    // MARK: - IBOUTLET Methods
    @IBAction func characterOfficialPageButtonPressed(_ sender: UIButton) {
        delegate?.onCharacterPageButtonPressed(cell: self)
    }
    
    // MARK: - Methods
    func configure(name: String?, url: String?) {
        characterImageView.kf.indicatorType = .activity
        if let imageURL = url, let characterName = name {
            characterNameLabel.text = characterName
            characterImageView.kf.setImage(with: URL(string: imageURL)!)
        } else {
            characterNameLabel.text = "Karaktere ait isim bulunamadı."
            characterImageView.image = UIImage(named: "characterImagePlaceholder")
        }
    }
    
    func transferHomepageURL(from url: String?) {
        self.homepageURL = url
    }
}
