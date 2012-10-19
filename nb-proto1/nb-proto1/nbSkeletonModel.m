//
//  nbSkeletonModel.m
//  nb-proto1
//
//  Created by Anton Antich on 10/18/12.
//  Copyright (c) 2012 Anton Antich. All rights reserved.
//

#import "nbSkeletonModel.h"

@implementation nbSkeletonModel

// support for static factory method
static NSMutableArray* _all_skeletons = nil;

@synthesize name;
@synthesize description;
@synthesize rating;

@synthesize sample0file;
@synthesize sample1file;
@synthesize sample2file;
@synthesize sample3file;

- (id)initWithName:(NSString*)nm description:(NSString*)desc rating:(float)rt {
    if ((self = [super init])) {
        self.name = nm;
        self.rating = rt;
        self.description = desc;
    }
    return self;
};

+ (NSMutableArray*) getSkeletons {
    @synchronized([nbSkeletonModel class]) {
        if (!_all_skeletons) {
            // initialization of the skeletons
            nbSkeletonModel *sk1 = [[nbSkeletonModel alloc] initWithName:@"Cool Blues" description:@"Nice and easy blues square" rating:5];
            nbSkeletonModel *sk2 = [[nbSkeletonModel alloc] initWithName:@"Hot R&B" description:@"Express your inner rapper" rating:5];
            nbSkeletonModel *sk3 = [[nbSkeletonModel alloc] initWithName:@"Meihana" description:@"The recent coolness" rating:5];
            nbSkeletonModel *sk4 = [[nbSkeletonModel alloc] initWithName:@"Funky funk" description:@"Yay!" rating:5];

            _all_skeletons = [NSMutableArray arrayWithObjects:sk1,sk2,sk3,sk4, nil];
        }
        return _all_skeletons;
    }
    return nil;
};


@end
