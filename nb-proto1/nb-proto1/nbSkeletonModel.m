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
            nbSkeletonModel *sk2 = [[nbSkeletonModel alloc] initWithName:@"Hot Acid" description:@"Clubbing extravaganza" rating:5];
            nbSkeletonModel *sk3 = [[nbSkeletonModel alloc] initWithName:@"Meihana" description:@"The recent coolness" rating:5];
            nbSkeletonModel *sk4 = [[nbSkeletonModel alloc] initWithName:@"Rap Set 1" description:@"Release your inner rapper" rating:5];
            nbSkeletonModel *sk5 = [[nbSkeletonModel alloc] initWithName:@"Rap Set 2" description:@"Release your inner rapper" rating:5];
            nbSkeletonModel *sk6 = [[nbSkeletonModel alloc] initWithName:@"Rap Set 3" description:@"Release your inner rapper" rating:5];
            
            // Blues bundle
            sk1.sample0file = [[NSBundle mainBundle] pathForResource:@"blues00-0" ofType:@"mp3"];
            sk1.sample1file = [[NSBundle mainBundle] pathForResource:@"blues00-1" ofType:@"mp3"];
            sk1.sample2file = [[NSBundle mainBundle] pathForResource:@"blues00-2" ofType:@"mp3"];
            sk1.sample3file = [[NSBundle mainBundle] pathForResource:@"blues00-3" ofType:@"mp3"];
             
            // R&B bundle
            sk2.sample0file = [[NSBundle mainBundle] pathForResource:@"acid00-0" ofType:@"mp3"];
            sk2.sample1file = [[NSBundle mainBundle] pathForResource:@"acid00-1" ofType:@"mp3"];
            sk2.sample2file = [[NSBundle mainBundle] pathForResource:@"acid00-2" ofType:@"mp3"];
            sk2.sample3file = [[NSBundle mainBundle] pathForResource:@"acid00-3" ofType:@"mp3"];
            
            // Meihana bundle
            sk3.sample0file = [[NSBundle mainBundle] pathForResource:@"meihana00-0" ofType:@"mp3"];
            sk3.sample1file = [[NSBundle mainBundle] pathForResource:@"meihana00-1" ofType:@"wav"];
            sk3.sample2file = [[NSBundle mainBundle] pathForResource:@"meihana00-2" ofType:@"wav"];
            sk3.sample3file = [[NSBundle mainBundle] pathForResource:@"meihana00-3" ofType:@"wav"];
            
            // Rap bundles
            sk4.sample0file = [[NSBundle mainBundle] pathForResource:@"rap01-0" ofType:@"mp3"];
            sk4.sample1file = [[NSBundle mainBundle] pathForResource:@"rap01-1" ofType:@"mp3"];
            sk4.sample2file = [[NSBundle mainBundle] pathForResource:@"rap01-2" ofType:@"mp3"];
            sk4.sample3file = [[NSBundle mainBundle] pathForResource:@"rap01-3" ofType:@"mp3"];

            sk5.sample0file = [[NSBundle mainBundle] pathForResource:@"rap02-0" ofType:@"mp3"];
            sk5.sample1file = [[NSBundle mainBundle] pathForResource:@"rap02-1" ofType:@"mp3"];
            sk5.sample2file = [[NSBundle mainBundle] pathForResource:@"rap02-2" ofType:@"mp3"];
            sk5.sample3file = [[NSBundle mainBundle] pathForResource:@"rap02-3" ofType:@"mp3"];

            sk6.sample0file = [[NSBundle mainBundle] pathForResource:@"rap03-0" ofType:@"mp3"];
            sk6.sample1file = [[NSBundle mainBundle] pathForResource:@"rap03-1" ofType:@"mp3"];
            sk6.sample2file = [[NSBundle mainBundle] pathForResource:@"rap03-2" ofType:@"mp3"];
            sk6.sample3file = [[NSBundle mainBundle] pathForResource:@"rap03-3" ofType:@"mp3"];


            _all_skeletons = [NSMutableArray arrayWithObjects:sk1,sk2,sk3,sk4,sk5,sk6, nil];
        }
        return _all_skeletons;
    }
    return nil;
};


@end
