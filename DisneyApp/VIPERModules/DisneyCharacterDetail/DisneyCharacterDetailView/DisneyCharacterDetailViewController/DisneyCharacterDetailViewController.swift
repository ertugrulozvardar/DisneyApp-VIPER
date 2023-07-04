//
//  DisneyCharacterDetailViewController.swift
//  DisneyApp
//
//  Created by ertugrul.ozvardar on 21.06.2023.
//

import UIKit
import Kingfisher

class DisneyCharacterDetailViewController: UIViewController {
    
    // MARK: - UIComponents
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterFilmsTableView: UITableView!
    @IBOutlet weak var characterTvShowsTableView: UITableView!
    @IBOutlet weak var characterShortFilmsTableView: UITableView!
    
    // MARK: - Properties
    var characterId: Int = 0
    var presenter: DisneyCharacterDetailViewToPresenterProtocol?
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        buildTableViews()
        presenter?.updateUI(using: characterId)
    }
    
    private func buildTableViews() {
        // Character Films Table View
        characterFilmsTableView.dataSource = self
        characterFilmsTableView.delegate = self
        characterFilmsTableView.tableFooterView = UIView()
        characterFilmsTableView.register(UINib(nibName: "DisneyCharacterDetailFilmsTableViewCell", bundle: .main), forCellReuseIdentifier: "DisneyCharacterDetailFilmsTableViewCell")
        
        // Character Short Films Table View
        characterShortFilmsTableView.dataSource = self
        characterShortFilmsTableView.delegate = self
        characterShortFilmsTableView.tableFooterView = UIView()
        characterShortFilmsTableView.register(UINib(nibName: "DisneyCharacterDetailShortFilmsTableViewCell", bundle: .main), forCellReuseIdentifier: "DisneyCharacterDetailShortFilmsTableViewCell")
        
        // Character TV Shows Table View
        characterTvShowsTableView.dataSource = self
        characterTvShowsTableView.delegate = self
        characterTvShowsTableView.tableFooterView = UIView()
        characterTvShowsTableView.register(UINib(nibName: "DisneyCharacterDetailTvShowsTableViewCell", bundle: .main), forCellReuseIdentifier: "DisneyCharacterDetailTvShowsTableViewCell")
    }
}
// MARK: - UITableViewDataSource & Delegate
extension DisneyCharacterDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case characterFilmsTableView:
            return presenter?.getDisneyCharacterFilmsCount() ?? 0
        case characterShortFilmsTableView:
            return presenter?.getDisneyCharacterShortFilmsCount() ?? 0
        case characterTvShowsTableView:
            return presenter?.getDisneyCharacterTvShowsCount() ?? 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableRow = indexPath.row
        let disneyCharacter = presenter?.getDisneyCharacter()
        switch tableView {
        case characterFilmsTableView:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DisneyCharacterDetailFilmsTableViewCell", for: indexPath) as? DisneyCharacterDetailFilmsTableViewCell
            guard let characterFilm = disneyCharacter?.films?[tableRow] else {
                return cell ?? UITableViewCell()
            }
            cell?.configure(with: characterFilm)
            return cell ?? UITableViewCell()
        case characterShortFilmsTableView:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DisneyCharacterDetailShortFilmsTableViewCell", for: indexPath) as? DisneyCharacterDetailShortFilmsTableViewCell
            guard let characterShortFilm = disneyCharacter?.shortFilms?[tableRow] else {
                return cell ?? UITableViewCell()
            }
            cell?.configure(with: characterShortFilm)
            return cell ?? UITableViewCell()
        case characterTvShowsTableView:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DisneyCharacterDetailTvShowsTableViewCell", for: indexPath) as? DisneyCharacterDetailTvShowsTableViewCell
            guard let characterTvShow = disneyCharacter?.tvShows?[tableRow] else {
                return cell ?? UITableViewCell()
            }
            cell?.configure(with: characterTvShow)
            return cell ?? UITableViewCell()
        default:
            return UITableViewCell()
        }
    }
}
// MARK: - DisneyCharactersPresenterToViewProtocol
extension DisneyCharacterDetailViewController: DisneyCharacterDetailPresenterToViewProtocol {
    func displayDisneyCharacterDetail() {
        characterImageView.kf.indicatorType = .activity
        let disneyCharacter = presenter?.getDisneyCharacter()
        if let imageURL = disneyCharacter?.imageUrl, let characterName = disneyCharacter?.name {
            characterNameLabel.text = characterName
            characterImageView.kf.setImage(with: URL(string: imageURL)!)
        }
        characterFilmsTableView.reloadData()
        characterShortFilmsTableView.reloadData()
        characterTvShowsTableView.reloadData()
    }
    
    func displayError() {
        let errorAlert = UIAlertController(title: "Alert", message: "Disney Karakteri getirilirken bir hata ile karşılaşıldı.", preferredStyle: UIAlertController.Style.alert)
        errorAlert.addAction(UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil))
        self.present(errorAlert, animated: true, completion: nil)
    }
}
