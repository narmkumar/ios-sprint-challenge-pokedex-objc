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

@property (nonatomic, copy, nullable) NSString *name;
@property (nonatomic, copy, nullable) NSArray *abilities;
@property (nonatomic) int identifier;
@property (nonatomic, copy, nullable) NSString *sprites;
@property (nonatomic, copy, nullable) NSString *url;

- (nonnull instancetype)initWithName:(nullable NSString *)name
                   abilities:(nullable NSArray *)abilities
                  identifier:(int)identifier
                     sprites:(nullable NSString *)sprites
                         url:(nullable NSString *)url;

- (nonnull instancetype)initWithDictionary:(nonnull NSDictionary *)dictionary;

@end

