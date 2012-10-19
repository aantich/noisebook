//
//  nbSkeletonModel.h
//  nb-proto1
//
//  Created by Anton Antich on 10/18/12.
//  Copyright (c) 2012 Anton Antich. All rights reserved.
//
// Class to keep all information about a single song skeleton in -
// name, description and file names that point to sample files that are used in the skeleton

#import <Foundation/Foundation.h>

@interface nbSkeletonModel : NSObject

@property (strong) NSString *name;
@property (strong) NSString *description;
@property (assign) float rating;

@property (strong) NSString *sample0file;
@property (strong) NSString *sample1file;
@property (strong) NSString *sample2file;
@property (strong) NSString *sample3file;

- (id)initWithName:(NSString*)name description:(NSString*)description rating:(float)rating;

// static factory method
+(NSMutableArray*) getSkeletons;

@end
