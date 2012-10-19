//
//  nbRecorderViewController.m
//  nb-proto1
//
//  Created by Anton Antich on 10/18/12.
//  Copyright (c) 2012 Anton Antich. All rights reserved.
//

#import "nbRecorderViewController.h"

@interface nbRecorderViewController ()

@end

NSString *MixerHostAudioObjectPlaybackStateDidChangeNotification = @"MixerHostAudioObjectPlaybackStateDidChangeNotification";

@implementation nbRecorderViewController

@synthesize skel;
@synthesize audioObject;

@synthesize btnReset;
@synthesize btnRecord;
@synthesize btnSample0;
@synthesize btnSample1;
@synthesize btnSample2;
@synthesize btnSample3;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

// need to call whatever Audio initialization, sample loading etc from here, so that the view is completely ready for the user's recording at one oush of a button

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // set up start button
    UIImage *greenImage = [[UIImage imageNamed:@"green_button.png"] stretchableImageWithLeftCapWidth:12.0 topCapHeight:0.0];
	UIImage *redImage = [[UIImage imageNamed:@"red_button.png"] stretchableImageWithLeftCapWidth:12.0 topCapHeight:0.0];
	
	[btnReset setBackgroundImage:redImage forState:UIControlStateNormal];
	[btnReset setBackgroundImage:redImage forState:UIControlStateSelected];
    
    [btnRecord setBackgroundImage:greenImage forState:UIControlStateNormal];
	[btnRecord setBackgroundImage:redImage forState:UIControlStateSelected];
    [btnRecord setTitle:@"Start Recording" forState:UIControlStateNormal];
    [btnRecord setTitle:@"Stop Recording" forState:UIControlStateSelected];
    
    [btnSample0 setBackgroundImage:greenImage forState:UIControlStateSelected];
	[btnSample0 setBackgroundImage:redImage forState:UIControlStateNormal];
    [btnSample0 setTitle:@"Rhythm track: ON" forState:UIControlStateSelected];
    [btnSample0 setTitle:@"Rhythm track: OFF" forState:UIControlStateNormal];
    
    [btnSample1 setTitle:@"Off" forState:UIControlStateNormal];
    [btnSample1 setTitle:@"On" forState:UIControlStateSelected];
    [btnSample1 setBackgroundImage:redImage forState:UIControlStateNormal];
    [btnSample1 setBackgroundImage:greenImage forState:UIControlStateSelected];
    [btnSample2 setTitle:@"Off" forState:UIControlStateNormal];
    [btnSample2 setTitle:@"On" forState:UIControlStateSelected];
    [btnSample2 setBackgroundImage:redImage forState:UIControlStateNormal];
    [btnSample2 setBackgroundImage:greenImage forState:UIControlStateSelected];
    [btnSample3 setTitle:@"Off" forState:UIControlStateNormal];
    [btnSample3 setTitle:@"On" forState:UIControlStateSelected];
    [btnSample3 setBackgroundImage:redImage forState:UIControlStateNormal];
    [btnSample3 setBackgroundImage:greenImage forState:UIControlStateSelected];
    
    self.title = self.skel.name;
    btnSample0.selected = YES;
    
    // ******************** Audio Inits ******************
    self.audioObject = [[MixerHostAudio alloc] init];
    self.audioObject.skel = self.skel;
    
    [self registerForAudioObjectNotifications];
    [self initializeMixerSettingsToUI];


}

# pragma mark -
# pragma mark User interface methods
// Set the initial multichannel mixer unit parameter values according to the UI state
- (void) initializeMixerSettingsToUI {
    
    // Initialize mixer settings to UI
	
    //  initialize all the MixerHostAudio methods which respond to UI objects
	
    [audioObject enableMixerInput: 0 isOn: self.btnSample0.selected];
    [audioObject enableMixerInput: 1 isOn: self.btnSample1.selected];
	[audioObject enableMixerInput: 2 isOn: self.btnSample2.selected];
	[audioObject enableMixerInput: 3 isOn: self.btnSample3.selected];
    /*
    [audioObject enableMixerInput: 4 isOn: mixerBus3Switch.isOn];
    
    [audioObject enableMixerInput: 5 isOn: mixerBus3Switch.isOn];
    [audioObject setMixerBus5Fx: mixerBus5FxSwitch.isOn];
    
    [audioObject setMixerOutputGain: mixerOutputLevelFader.value];
    [audioObject setMixerFx: mixerFxSwitch.isOn];
    
    [audioObject setMixerInput: 0 gain: mixerBus0LevelFader.value];
    [audioObject setMixerInput: 1 gain: mixerBus1LevelFader.value];
    [audioObject setMixerInput: 2 gain: mixerBus2LevelFader.value];
	[audioObject setMixerInput: 3 gain: mixerBus3LevelFader.value];
    [audioObject setMixerInput: 4 gain: mixerBus4LevelFader.value];
	[audioObject setMixerInput: 5 gain: mixerBus5LevelFader.value];
    */
    
	audioObject.micFxOn = NO;
    audioObject.micFxControl = .5;
    audioObject.micFxType = 0;
    
	
//	micFreqDisplay.text = @"go";
	
	// this updated the pitch field at regular intervals
	/*
	[NSTimer scheduledTimerWithTimeInterval:0.1
									 target:self
								   selector:@selector(myMethod:)
								   userInfo:audioObject
									repeats: YES];
	
	*/
}


#pragma mark -
#pragma mark Notification registration
// If this app's audio session is interrupted when playing audio, it needs to update its user interface
//    to reflect the fact that audio has stopped. The MixerHostAudio object conveys its change in state to
//    this object by way of a notification. To learn about notifications, see Notification Programming Topics.
- (void) registerForAudioObjectNotifications {
    
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    
    [notificationCenter addObserver: self
                           selector: @selector (handlePlaybackStateChanged:)
                               name: MixerHostAudioObjectPlaybackStateDidChangeNotification
                             object: audioObject];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setBtnReset:nil];
    [self setBtnRecord:nil];
    [self setBtnSample0:nil];
    [self setBtnSample1:nil];
    [self setBtnSample2:nil];
    [self setBtnSample3:nil];
    
    [self setSkel:nil];
    [self setAudioObject:nil];
    
    [super viewDidUnload];
}

// Sample0 is normally a rhythm track
- (IBAction)pressedSample0:(id)sender {
    if (btnSample0.selected)
        btnSample0.selected = NO;
    else
        btnSample0.selected = YES;
    
    [audioObject enableMixerInput: 0 isOn: self.btnSample0.selected];
}
// other samples buttons pressed
- (IBAction)pressedAnySample:(id)sender {
    UInt32 inputNum = [sender tag];
    UIButton* btn = (UIButton*) sender;
    if (btn.selected)
        btn.selected = NO;
    else {
        btn.selected = YES;
        switch (inputNum) {
            case 1:
                self.btnSample2.selected = NO;
                self.btnSample3.selected = NO;
                break;
            case 2:
                self.btnSample1.selected = NO;
                self.btnSample3.selected = NO;
                break;
            case 3:
                self.btnSample1.selected = NO;
                self.btnSample2.selected = NO;
                break;
                
            default:
                break;
        }
    }
    
    
    
    [audioObject setCurrentSampleFrame:0 forSample:inputNum];
    [audioObject enableMixerInput: 1 isOn: self.btnSample1.selected];
    [audioObject enableMixerInput: 2 isOn: self.btnSample2.selected];
    [audioObject enableMixerInput: 3 isOn: self.btnSample3.selected];
}

- (IBAction)toggleRecording:(id)sender {
    if (audioObject.isPlaying) {
        
        [audioObject stopAUGraph];
        self.btnRecord.selected = NO;
        
    } else {
        
        [audioObject startAUGraph];
        self.btnRecord.selected = YES;
    } 

}




@end
