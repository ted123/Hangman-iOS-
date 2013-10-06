//
//  selectChar.m
//  Hangman_v01
//
//  Created by rj on 10/4/13.
//  Copyright (c) 2013 Ted. All rights reserved.
//

#import "selectChar.h"

@interface selectChar ()

@end

@implementation selectChar

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

- (IBAction)begingame:(id)sender {
    
}

- (IBAction)selectorC:(UIButton* )sender {
    switch ([sender tag]) {
        case 1:
            _tobehanged.text=@"2";
            [_b setHidden:true];
            [_c setHidden:true];
            break;
        case 2:
            _tobehanged.text=@"0";
            [_a setHidden:true];
            [_c setHidden:true];
            break;
        case 3:
            _tobehanged.text=@"1";
            [_a setHidden:true];
            [_b setHidden:true];
            break;
            
        default:
            break;
    }
}
@end
