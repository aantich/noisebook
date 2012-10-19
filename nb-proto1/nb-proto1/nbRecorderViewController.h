//
//  nbRecorderViewController.h
//  nb-proto1
//
//  Created by Anton Antich on 10/18/12.
//  Copyright (c) 2012 Anton Antich. All rights reserved.
//
// Controls the Recorder View where we play with the chosen samples etc

#import <UIKit/UIKit.h>

@interface nbRecorderViewController : UIViewController

// should reset everything to zero
@property (weak, nonatomic) IBOutlet UIButton *btnReset;
// starts recording
@property (weak, nonatomic) IBOutlet UIButton *btnRecord;
// turns sample 0 (main rhythm track) on or off
@property (weak, nonatomic) IBOutlet UIButton *btnSample0;

@end
