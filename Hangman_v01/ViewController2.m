//
//  ViewController2.m
//  Hangman_v01
//
//  Created by Ted on 9/21/13.
//  Copyright (c) 2013 Ted. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)return:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)press_control:(id)sender {
    
}
@end
