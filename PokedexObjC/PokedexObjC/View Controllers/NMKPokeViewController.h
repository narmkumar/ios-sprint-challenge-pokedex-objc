//
//  NMKPokeViewController.h
//  PokedexObjC
//
//  Created by Niranjan Kumar on 1/31/20.
//  Copyright © 2020 Nar Kumar. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NMKPokemon;
@class NMKPokemonController;

@interface NMKPokeViewController : UIViewController

@property (nonatomic) NMKPokemon *pokemon;
@property (nonatomic) NMKPokemonController *controller;


@end

