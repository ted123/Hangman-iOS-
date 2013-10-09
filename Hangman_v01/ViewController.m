//
//  ViewController.m
//  Hangman_v01
//
//  Created by Ted on 9/21/13.
//  Copyright (c) 2013 Ted. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	SystemSoundID soundID;
    NSString *soundFile = [[NSBundle mainBundle]pathForResource:@"open"ofType:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:soundFile] , &soundID);
    AudioServicesPlayAlertSound(soundID);
    
    
    
    
    
    
    }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playAction:(id)sender {
    
SystemSoundID soundID;
NSString *soundFile = [[NSBundle mainBundle]pathForResource:@"Teleport swish"ofType:@"mp3"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:soundFile] , &soundID);
    AudioServicesPlayAlertSound(soundID);
}
@end
