//
//  NMKPokemon.h
//  PokedexObjC
//
//  Created by Niranjan Kumar on 1/31/20.
//  Copyright © 2020 Nar Kumar. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NMKPokemon : NSObject

@property (nonatomic, copy, nonnull) NSString *name;
@property (nonatomic, copy, nonnull) NSString *abilities;
@property (nonatomic) int identifier;
@property (nonatomic, copy, nonnull) NSString *sprite;





@end

NS_ASSUME_NONNULL_END
