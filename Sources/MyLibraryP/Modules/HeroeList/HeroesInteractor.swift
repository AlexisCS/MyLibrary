//
//  HeroesInteractor.swift
//  ViperExample
//
//  Created by Alexis Celestino Solís on 06/10/20.
//  Copyright © 2020 Alexis Celestino Solís. All rights reserved.
//

import UIKit
import Kingfisher

class HeroesListInteractor: HeoroesListInteractorInputProtocol {
    weak var presenter: HeoroesListInteractorOutputProtocol?
    
    func getHeroes() {
        UrlSession.get { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let brastlewark):
                let heroesAndSection = self.getHeroesSortedByHeight(brastlewark)
                let tallestHereoes = self.getTallestHeroesBySection(heroesAndSection)
                self.presenter?.didRetriveTallest(heroes: tallestHereoes)
                self.presenter?.didRetriveHeroes(heroesAndSection)
            case .failure(let error):
                self.presenter?.didErrorRetriveHeroes(error)
            }
        }
    }
    
    func save(url: String, imageView: UIImageView) {
        guard let url = URL(string: url) else { return }
        imageView.kf.setImage(with: url)
    }
    
    func filterHeroe(by name: String, in heroes: [[Heroe]]) {
        let allHeroes: [Heroe] = heroes.flatMap { $0 }
        if name.isEmpty {
            presenter?.didRetriveFilter(heroes: allHeroes)
        } else {
            let heroesFound: [Heroe] = allHeroes.filter {
                $0.name.lowercased().contains(name.lowercased())
            }
            presenter?.didRetriveFilter(heroes: heroesFound)
        }
    }
    
    private func getTallestHeroesBySection(_ heroes: [[Heroe]]) -> [[Heroe]] {
        return heroes.map { heroes -> [Heroe] in
            return Array(heroes.sorted { $0.height < $1.height }.prefix(Int.random(in: 1...20)))
        }
    }
    
    private func getHeroesSortedByHeight(_ brastlewark: Brastlewark) -> [[Heroe]] {
        let allHeroes = brastlewark.heroes
        return [allHeroes.filter { $0.height >= 90 && $0.height < 95  }.sorted { $0.name < $1.name},
                allHeroes.filter { $0.height >= 95 && $0.height < 100  }.sorted { $0.name < $1.name},
                allHeroes.filter { $0.height >= 105 && $0.height < 110  }.sorted { $0.name < $1.name},
                allHeroes.filter { $0.height >= 110 && $0.height < 115  }.sorted { $0.name < $1.name},
                allHeroes.filter { $0.height >= 115 && $0.height < 120  }.sorted { $0.name < $1.name},
                allHeroes.filter { $0.height >= 120 && $0.height < 125 }.sorted { $0.name < $1.name},
                allHeroes.filter { $0.height >= 125 && $0.height < 130 }.sorted { $0.name < $1.name}]
    }
}
