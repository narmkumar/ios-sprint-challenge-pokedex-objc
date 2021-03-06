//
//  NMKPokemonTableViewController.h
//  PokedexObjC
//
//  Created by Niranjan Kumar on 1/31/20.
//  Copyright © 2020 Nar Kumar. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NMKPokemon;
@class NMKPokemonController;
@class NMKPokemonDetailViewController;
@class NMKPokeViewController;

NS_SWIFT_NAME(PokemonTableViewController)
@interface NMKPokemonTableViewController : UITableViewController

@property (nonatomic, readonly) NMKPokemonController *controller;

@end

