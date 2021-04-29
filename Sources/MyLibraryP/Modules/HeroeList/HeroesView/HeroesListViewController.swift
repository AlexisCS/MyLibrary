//
//  HeroesListViewController.swift
//  ViperExample
//
//  Created by Alexis Celestino Solís on 06/10/20.
//  Copyright © 2020 Alexis Celestino Solís. All rights reserved.
//

import UIKit

class HeroesListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let hud = UIActivityIndicatorView(frame: UIScreen.main.bounds)
    private let searchController = UISearchController(searchResultsController: nil)
    private var heroesInSection: [[Heroe]] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    private var filterHeroes: [Heroe] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    private var tallestHeroes: [[Heroe]] = []
    private var currentSection = 0
    
    var presenter: HeoroesListPresenterProtocol?
    
    init() {
        super.init(nibName: "HeroesListViewController", bundle: .module)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        hubSetup()
        initSetup()
        navigationSetup()
        searchControllerSetup()
    }
    
    private func initSetup() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(HeroeTableViewCell.nib,
                           forCellReuseIdentifier: HeroeTableViewCell.id)
        tableView.register(HeroesListHeader.nib,
                           forHeaderFooterViewReuseIdentifier: HeroesListHeader.id)
    }
    
    private func navigationSetup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Heroes"
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    private func searchControllerSetup() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Heroe"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    private func hubSetup() {
        hud.backgroundColor = .lightGray
        hud.color = .white
        view.addSubview(hud)
        hud.startAnimating()
    }
}

//MARK:- HeroesListViewProtocol
extension HeroesListViewController: HeroesListViewProtocol {
    func showHeroes(_ heroes: [[Heroe]]) {
        hud.stopAnimating()
        heroesInSection = heroes	
    }
    
    func showTallest(heroes: [[Heroe]]) {
        tallestHeroes = heroes
    }
    
    func showFilter(heroes: [Heroe]) {
        filterHeroes = heroes
    }
    
    func showError(_ error: Error) {
        hud.stopAnimating()
        presenter?.present(error: error)
    }
}

//MARK:- UITableViewDataSource
extension HeroesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchController.isActive ? filterHeroes.count : heroesInSection[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HeroeTableViewCell.id, for: indexPath) as! HeroeTableViewCell
        let heroe = searchController.isActive ? filterHeroes[indexPath.row] : heroesInSection[indexPath.section][indexPath.row]
        presenter?.save(url: heroe.thumbnail, imageView: cell.profileImage)
        cell.title.text = heroe.name
        cell.subTitle.text = "Weight: \(heroe.weight)  Height: \(heroe.height)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return searchController.isActive ? 1 : heroesInSection.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeroesListHeader.id) as? HeroesListHeader else { return nil }
        header.titleLabel.text = "Top Tallest Heroes In Section \(section + 1)"
        header.collectionView.delegate = self
        header.collectionView.dataSource = self
        currentSection = section
        return searchController.isActive ? nil : header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return searchController.isActive ? 0.0 : 120.0
    }
}

//MARK:- UITableViewDelegate
extension HeroesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.presentDetail(heroesInSection[indexPath.section][indexPath.row])
    }
}

//MARK:- UICollectionViewDataSource
extension HeroesListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tallestHeroes[currentSection].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeroesListHeaderCollectionViewCell.id, for: indexPath) as! HeroesListHeaderCollectionViewCell
        let heroe = tallestHeroes[currentSection][indexPath.item]
        presenter?.save(url: heroe.thumbnail, imageView: cell.profileImage)
        return cell
    }
}

//MARK:- UICollectionViewDelegateFlowLayout
extension HeroesListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.pushToTallest(heroe: tallestHeroes[currentSection][indexPath.item])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
}

extension HeroesListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let name = searchController.searchBar.text else { return }
        presenter?.filterHeroe(by: name, in: heroesInSection)
    }
}
