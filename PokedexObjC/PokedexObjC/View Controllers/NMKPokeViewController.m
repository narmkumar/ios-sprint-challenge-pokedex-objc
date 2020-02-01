//
//  NMKPokeViewController.m
//  PokedexObjC
//
//  Created by Niranjan Kumar on 1/31/20.
//  Copyright © 2020 Nar Kumar. All rights reserved.
//

#import "NMKPokeViewController.h"
#import "PokedexObjC-Swift.h"
#import "NMKPokemon.h"

void *KVOContext = &KVOContext;

@interface NMKPokeViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *identifier;
@property (weak, nonatomic) IBOutlet UILabel *abilities;

@end

@implementation NMKPokeViewController

- (instancetype)initWithCoder:(NSCoder *)coder { // the @synthesizer to set the property's value
    self = [super initWithCoder:coder];
    if (self) {
        _controller = [[NMKPokemonController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [_controller fillInDetailsFor:self.pokemon];
}

- (void)updateViews
{
    if (!self.isViewLoaded || !self.pokemon) { return; }
    
    self.name.text = self.pokemon.name;
    self.identifier.text = [NSString stringWithFormat:@"%d", self.pokemon.identifier];
    
    self.abilities.text = [self.pokemon.abilities componentsJoinedByString:@", "];
    
    
    
    NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:self.pokemon.sprites]];
    self.imageView.image = [[UIImage alloc] initWithData:imageData];
}

- (void)setPokemon:(NMKPokemon *)pokemon {
    if (_pokemon != pokemon) {
        [_pokemon removeObserver:self forKeyPath:@"name" context:KVOContext];
        [_pokemon removeObserver:self forKeyPath:@"id" context:KVOContext];
        [_pokemon removeObserver:self forKeyPath:@"abilities" context:KVOContext];
        [_pokemon removeObserver:self forKeyPath:@"sprites" context:KVOContext];

        _pokemon = pokemon;

        [_pokemon addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionInitial context:KVOContext];
        [_pokemon addObserver:self forKeyPath:@"id" options:NSKeyValueObservingOptionInitial context:KVOContext];
        [_pokemon addObserver:self forKeyPath:@"abilities" options:NSKeyValueObservingOptionInitial context:KVOContext];
        [_pokemon addObserver:self forKeyPath:@"sprites" options:NSKeyValueObservingOptionInitial context:KVOContext];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if (context == KVOContext) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self updateViews];
        });
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
