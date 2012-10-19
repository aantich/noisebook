//
//  nbRecorderViewController.h
//  nb-proto1
//
//  Created by Anton Antich on 10/18/12.
//  Copyright (c) 2012 Anton Antich. All rights reserved.
//
// Controls the Recorder View where we play with the chosen samples etc
// skel is being set from the skeleton table view 

#import <UIKit/UIKit.h>
#import "nbSkeletonModel.h"
#import "MixerHostAudio.h"

@interface nbRecorderViewController : UIViewController

// current skeleton that we will be working with - to be set from the SkeletonTableView controller!
@property (strong) nbSkeletonModel *skel;

// handling all audio routines, the core of the app!
@property (nonatomic, retain)    MixerHostAudio              *audioObject;

// should reset everything to zero
@property (weak, nonatomic) IBOutlet UIButton *btnReset;
// starts recording
@property (weak, nonatomic) IBOutlet UIButton *btnRecord;
// turns sample 0 (main rhythm track) on or off
// they are tagged with 0-3 respectively!
@property (weak, nonatomic) IBOutlet UIButton *btnSample0;
@property (weak, nonatomic) IBOutlet UIButton *btnSample1;
@property (weak, nonatomic) IBOutlet UIButton *btnSample2;
@property (weak, nonatomic) IBOutlet UIButton *btnSample3;

// event handlers for button presses
// Sample0 - rhythm track
- (IBAction)pressedSample0:(id)sender;
// other samples (1-2-3)
- (IBAction)pressedAnySample:(id)sender;
// processing record button push
- (IBAction)toggleRecording:(id)sender;

- (void) initializeMixerSettingsToUI;
- (void) registerForAudioObjectNotifications;

@end
