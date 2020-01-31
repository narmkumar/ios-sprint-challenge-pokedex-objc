//
//  NMKPokemonDetailViewController.swift
//  PokedexObjC
//
//  Created by Niranjan Kumar on 1/31/20.
//  Copyright © 2020 Nar Kumar. All rights reserved.
//

import UIKit

class NMKPokemonDetailViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var abilitiesLabel: UILabel!
    
    // MARK: - Properties
    
    var pokemon: Pokemon?
    var controller: NMKPokemonController?
    var pokemonAbilityObservation: NSKeyValueObservation?
    var pokemonImageObservation: NSKeyValueObservation?
    var pokemonIDObservation: NSKeyValueObservation?

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let pokemon = pokemon else { return }
        guard let controller = controller else { return }
        controller.fillInDetails(for: pokemon)
        name.text = pokemon.name
        pokeObservations()
    }

    // MARK: - Private Methods

    private func pokeObservations() {
    

    }
}
