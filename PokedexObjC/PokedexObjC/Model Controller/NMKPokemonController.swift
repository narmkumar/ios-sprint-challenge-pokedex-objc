//
//  NMKPokemonController.swift
//  PokedexObjC
//
//  Created by Niranjan Kumar on 1/31/20.
//  Copyright © 2020 Nar Kumar. All rights reserved.
//

import UIKit

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

@objc (NMKPokemonController)
class NMKPokemonController: NSObject {
    
    @objc var allPokemon: [Pokemon] = []
    let baseURL = URL(string: "https://pokeapi.co/api/v2/pokemon/")!
    
    
    @objc(sharedController) static let shared = NMKPokemonController()
    
    @objc func fetchAllPokemon(completion: @escaping ([Pokemon]?, Error?) -> Void) {
        let urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        
        guard let pokemonURL = urlComponents?.url else {
            NSLog("Pokemon URL is not valid.")
            return
        }
        
        var request = URLRequest(url: pokemonURL)
        request.httpMethod = HTTPMethod.get.rawValue
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                NSLog("Error fetching data: \(error)")
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                NSLog("Data returned does not exist.")
                completion(nil, error)
                return
            }
                    
            do {
                guard let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                    NSLog("Problem with JSON Serialization")
                    return
                }
                guard let pokemonDictionaries = dictionary["results"] as? [[String : Any]] else {
                    return
                }
                
                let pokemon = pokemonDictionaries.compactMap { Pokemon(dictionary: $0) }
                DispatchQueue.main.async {
                    completion(pokemon, nil)
                }
                
            } catch {
                NSLog("Unable to decode Pokemon Dictionaries into objects: \(error)")
                completion(nil, error)
            }
        }.resume()
    }
    
    
    
    
    @objc func fillInDetails(for pokemon: Pokemon) {
        let urlComponents = URLComponents(url: baseURL.appendingPathComponent(pokemon.name!), resolvingAgainstBaseURL: true)
        
        guard let pokemonURL = urlComponents?.url else {
            NSLog("Pokemon URL is not valid.")
            return
        }
        
        var request = URLRequest(url: pokemonURL)
        request.httpMethod = HTTPMethod.get.rawValue
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                NSLog("Error fetching data: \(error)")
                return
            }
            
            guard let data = data else {
                NSLog("Data returned does not exist.")
                return
            }
            
            do {
                guard let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                    NSLog("Problem with JSON Serialization")
                    return
                }
                
                let image = dictionary["sprites"] as! [String : Any]
                let imageString = image["front_shiny"] as! String
                pokemon.sprites = imageString
                
                let identifier = dictionary["id"] as! Int
                pokemon.identifier = Int32(identifier)
                
                let abilitiesDitionaries = dictionary["abilities"] as! [[String : Any]]
                var names: [String] = []
                for abilityDictionary in abilitiesDitionaries {
                    let ability = abilityDictionary["ability"] as! [String : Any]
                    let name = ability["name"] as! String
                    names.append(name)
                }
                
                pokemon.abilities = names
                
            } catch {
                NSLog("Unable to decode Pokemon Dictionary traits into objects: \(error)")
            }
        }.resume()
    }
    
}

