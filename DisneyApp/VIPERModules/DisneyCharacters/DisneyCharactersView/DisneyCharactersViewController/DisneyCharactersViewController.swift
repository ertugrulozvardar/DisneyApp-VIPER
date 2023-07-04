//
//  DisneyCharactersViewController.swift
//  DisneyApp
//
//  Created by ertugrul.ozvardar on 19.06.2023.
//

import UIKit
import SafariServices

class DisneyCharactersViewController: UIViewController, DisneyCharacterTableViewCellDelegate {
    
    // MARK: - UIComponents
    @IBOutlet weak var disneyCharactersTableView: UITableView!
    
    // MARK: - Properties
    var currentPageNumber: Int = 1
    var presenter: DisneyCharactersViewToPresenterProtocol?
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        buildTableView()
        presenter?.updateUI(using: currentPageNumber)
    }
    
    private func buildTableView() {
        disneyCharactersTableView.dataSource = self
        disneyCharactersTableView.delegate = self
        disneyCharactersTableView.tableFooterView = UIView()
        disneyCharactersTableView.register(UINib(nibName: "DisneyCharactersTableViewCell", bundle: .main), forCellReuseIdentifier: "DisneyCharactersTableViewCell")
    }
    
    func onCharacterPageButtonPressed(cell: DisneyCharactersTableViewCell) {
        if let characterHomePageURL = cell.homepageURL, !characterHomePageURL.isEmpty {
            presenter?.requestNavigateToHomePage(with: characterHomePageURL)
        } else {
            displayHomePageError()
        }
    }
}
// MARK: - UITableViewDataSource & Delegate
extension DisneyCharactersViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getAllDisneyCharactersCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DisneyCharactersTableViewCell", for: indexPath) as? DisneyCharactersTableViewCell
        let tableRow = indexPath.row
        let disneyCharacters = presenter?.getAllDisneyCharacters(at: tableRow)
        guard let characterName = disneyCharacters?.name, let characterImageURL = disneyCharacters?.imageUrl, let sourceURL = disneyCharacters?.sourceUrl else {
            return cell ?? UITableViewCell()
        }
        cell?.delegate = self
        cell?.configure(name: characterName, url: characterImageURL)
        cell?.transferHomepageURL(from: sourceURL)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let characters = presenter?.getAllDisneyCharacters() {
            if indexPath.row == characters.count - 1 {
                currentPageNumber = currentPageNumber + 1
                presenter?.updateUI(using: currentPageNumber)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tableRow = indexPath.row
        let disneyCharacter = presenter?.getAllDisneyCharacters(at: tableRow)
        presenter?.didSelectDisneyCharacter(with: disneyCharacter?.id ?? 0)
    }
}
// MARK: - DisneyCharactersPresenterToViewProtocol
extension DisneyCharactersViewController: DisneyCharactersPresenterToViewProtocol {
    func displayAllDisneyCharacters() {
        disneyCharactersTableView.reloadData()
    }
    
    func displayError() {
        let errorAlert = UIAlertController(title: "Hata", message: "Disney Karakterleri getirilirken bir hata ile karşılaşıldı.", preferredStyle: UIAlertController.Style.alert)
        errorAlert.addAction(UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil))
        self.present(errorAlert, animated: true, completion: nil)
    }
    
    func displayHomePage(with safariController: SFSafariViewController) {
        present(safariController, animated: true)
    }
    
    func displayHomePageError() {
        let errorAlert = UIAlertController(title: "Hata", message: "Disney Karakteri Web Sayfasına erişilirken bir hata ile karşılaşıldı.", preferredStyle: UIAlertController.Style.alert)
        errorAlert.addAction(UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil))
        self.present(errorAlert, animated: true, completion: nil)
    }
}


