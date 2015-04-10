//
//  Tile.h
//  Test_ButtonGrid
//
//  Created by Eduardo Flores on 4/8/15.
//  Copyright (c) 2015 Eduardo Flores. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tile : NSObject

@property (copy) NSString *coordinate_x;
@property (retain) NSNumber *coordinate_y;
@property (retain) NSNumber *tile_tag;

@end
