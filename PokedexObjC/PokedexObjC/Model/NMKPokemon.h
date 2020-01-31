//
//  NMKPokemon.h
//  PokedexObjC
//
//  Created by Niranjan Kumar on 1/31/20.
//  Copyright © 2020 Nar Kumar. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_SWIFT_NAME(Pokemon)
@interface NMKPokemon : NSObject

@property (nonatomic, copy, nonnull) NSString *name;
@property (nonatomic, copy, nonnull) NSArray *abilities;
@property (nonatomic) int identifier;
@property (nonatomic, copy, nonnull) NSString *sprites;
@property (nonatomic, copy, nonnull) NSString *url;

- (nonnull instancetype)initWithName:(nonnull NSString *)name
                   abilities:(nonnull NSArray *)abilities
                  identifier:(int)identifier
                     sprites:(nonnull NSString *)sprites
                         url:(nonnull NSString *)url;

- (nonnull instancetype)initWithDictionary:(nonnull NSDictionary *)dictionary;

@end

