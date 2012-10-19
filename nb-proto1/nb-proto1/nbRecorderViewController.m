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

@synthesize btnReset;
@synthesize btnRecord;
@synthesize btnSample0;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

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
    [super viewDidUnload];
}
@end
