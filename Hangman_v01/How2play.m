//
//  How2play.m
//  Hangman_v01
//
//  Created by rj on 10/8/13.
//  Copyright (c) 2013 Ted. All rights reserved.
//

#import "How2play.h"

@interface How2play ()

@end

@implementation How2play

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

- (IBAction)backHome:(id)sender {

    [self dismissViewControllerAnimated:YES completion:nil];


}
@end
