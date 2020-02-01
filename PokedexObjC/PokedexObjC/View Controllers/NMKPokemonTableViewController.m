//
//  NMKPokemonTableViewController.m
//  PokedexObjC
//
//  Created by Niranjan Kumar on 1/31/20.
//  Copyright © 2020 Nar Kumar. All rights reserved.
//

#import "NMKPokemonTableViewController.h"
#import "NMKPokemon.h"
#import "NMKPokeViewController.h"
#import "PokedexObjC-Swift.h"

@interface NMKPokemonTableViewController ()

@property (nonatomic) NSArray <NMKPokemon *> *pokemon;

@end

@implementation NMKPokemonTableViewController

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        _controller = [[NMKPokemonController alloc] init];
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [ self->_controller fetchAllPokemonWithCompletion:^(NSArray<NMKPokemon *> *pokemon, NSError *error) {
            if (error) {
                NSLog(@"Error fetching pokemon: %@", error);
            }
            self.pokemon = pokemon;
            [self.tableView reloadData];
        }];
    });
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.pokemon.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PokeCell" forIndexPath:indexPath];
    
    NMKPokemon *pokemon = [self.pokemon objectAtIndex:indexPath.row];
    cell.textLabel.text = pokemon.name.capitalizedString;
    
    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowPokeSegue"]) {
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        NMKPokeViewController *detailVC = segue.destinationViewController;
        
        NMKPokemon *pokemon = self.pokemon[indexPath.row];
        detailVC.pokemon = pokemon;
        detailVC.controller = _controller;
         
    }
}

@end
