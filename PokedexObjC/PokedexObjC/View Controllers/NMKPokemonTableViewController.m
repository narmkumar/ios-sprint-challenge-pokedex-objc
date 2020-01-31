//
//  NMKPokemonTableViewController.m
//  PokedexObjC
//
//  Created by Niranjan Kumar on 1/31/20.
//  Copyright © 2020 Nar Kumar. All rights reserved.
//

#import "NMKPokemonTableViewController.h"
#import "NMKPokemon.h"
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
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.pokemon.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PokeCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
}

@end
