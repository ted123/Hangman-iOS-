//
//  gameoverPage.m
//  Hangman_v01
//
//  Created by Ted on 10/2/13.
//  Copyright (c) 2013 Ted. All rights reserved.
//

#import "gameoverPage.h"
#import "ViewController2.h"
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
	NSString *names=((ViewController2 *)self.presentingViewController).pname.text;
    NSString *pt = ((ViewController2 *)self.presentingViewController).fpoints.text;
    _remarks.text=[NSString stringWithFormat:@"Congratulations %@!",names];
    _final.text=[NSString stringWithFormat:@"Your total score is: %@",pt];
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
