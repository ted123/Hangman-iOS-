//
//  ViewController2.m
//  Hangman_v01
//
//  Created by Ted on 9/21/13.
//  Copyright (c) 2013 Ted. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()
-(void)checkit:(NSString*)value;
@end

@implementation ViewController2

- (void)checkit:(NSString*)value{
    _answer.text=value;
    
}


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
    switch (_b1.selectedSegmentIndex) {
        case 0:
                [self checkit:@"A"];
            break;
        case 1:
                [self checkit:@"B"];
            break;
        case 2:
                [self checkit:@"C"];
            break;
        case 3:
                [self checkit:@"D"];
            break;
        case 4:
                [self checkit:@"E"];
            break;
        case 5:
                [self checkit:@"F"];
            break;
        case 6:
                [self checkit:@"G"];
            break;
        default:
            break;
    }
    switch (_b2.selectedSegmentIndex) {
        case 0:
            [self checkit:@"H"];
            break;
        case 1:
            [self checkit:@"I"];
            break;
        case 2:
            [self checkit:@"J"];
            break;
        case 3:
            [self checkit:@"K"];
            break;
        case 4:
            [self checkit:@"L"];
            break;
        case 5:
            [self checkit:@"M"];
            break;
        case 6:
            [self checkit:@"N"];
            break;
        default:
            break;
    }
    switch (_b3.selectedSegmentIndex) {
        case 0:
            [self checkit:@"O"];
            break;
        case 1:
            [self checkit:@"P"];
            break;
        case 2:
            [self checkit:@"Q"];
            break;
        case 3:
            [self checkit:@"R"];
            break;
        case 4:
            [self checkit:@"S"];
            break;
        case 5:
            [self checkit:@"T"];
            break;
        case 6:
            [self checkit:@"U"];
            break;
        default:
            break;
    }
    switch (_b4.selectedSegmentIndex) {
        case 0:
            [self checkit:@"V"];
            break;
        case 1:
            [self checkit:@"W"];
            break;
        case 2:
            [self checkit:@"X"];
            break;
        case 3:
            [self checkit:@"Y"];
            break;
        case 4:
            [self checkit:@"Z"];
            break;
        default:
            break;
    }
    
}
@end
