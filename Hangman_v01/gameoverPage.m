//
//  gameoverPage.m
//  Hangman_v01
//
//  Created by Ted on 10/2/13.
//  Copyright (c) 2013 Ted. All rights reserved.
//

#import "gameoverPage.h"

@interface gameoverPage ()

@end

@implementation gameoverPage

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

- (IBAction)quit:(id)sender {
    [self.view.window.rootViewController dismissViewControllerAnimated:YES completion:nil];
}
@end
