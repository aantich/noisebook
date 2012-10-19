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

@implementation nbRecorderViewController

@synthesize skel;

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
    
    [btnSample0 setBackgroundImage:greenImage forState:UIControlStateNormal];
	[btnSample0 setBackgroundImage:redImage forState:UIControlStateSelected];
    [btnSample0 setTitle:@"Rhythm track: ON" forState:UIControlStateNormal];
    [btnSample0 setTitle:@"Rhythm track: OFF" forState:UIControlStateSelected];
    
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
    
    self.title = skel.name;


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
    
    [super viewDidUnload];
}

// Sample0 is normally a rhythm track
- (IBAction)pressedSample0:(id)sender {
    if (btnSample0.selected)
        btnSample0.selected = NO;
    else
        btnSample0.selected = YES;
}
// other samples buttons pressed
- (IBAction)pressedAnySample:(id)sender {
    //UInt32 inputNum = [sender tag];
    UIButton* btn = (UIButton*) sender;
    if (btn.selected)
        btn.selected = NO;
    else
        btn.selected = YES;
}
@end
