//
//  NMKPokemon.m
//  PokedexObjC
//
//  Created by Niranjan Kumar on 1/31/20.
//  Copyright © 2020 Nar Kumar. All rights reserved.
//

#import "NMKPokemon.h"

@implementation NMKPokemon

- (instancetype) initWithName:(NSString *)name abilities:(NSArray *)abilities identifier:(int)identifier sprites:(NSString *)sprites url:(NSString *)url {
    if (self = [super init]) {
        _name = [name copy];
        _abilities = [abilities copy];
        _identifier = identifier;
        _sprites = [sprites copy];
        _url = [url copy];
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSString *name = [NSString stringWithFormat:@"%@", dictionary[@"name"]];
    NSString *url = [NSString stringWithFormat:@"%@", dictionary[@"url"]];
    NSArray *abilities = dictionary[@"abilities"];
    NSNumber *identifier = dictionary[@"id"];
    int identifierIntValue = [identifier intValue];
    NSString *sprites = dictionary[@"sprites"][@"front_shiny"];
    
    return [self initWithName:name abilities:abilities identifier:identifierIntValue sprites:sprites url:url];
}


@end
 
