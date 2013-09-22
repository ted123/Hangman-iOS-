//
//  ViewController2.h
//  Hangman_v01
//
//  Created by Ted on 9/21/13.
//  Copyright (c) 2013 Ted. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController2 : UIViewController
- (IBAction)return:(id)sender;
- (IBAction)press_control:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *b1;
@property (weak, nonatomic) IBOutlet UISegmentedControl *b2;
@property (weak, nonatomic) IBOutlet UISegmentedControl *b3;
@property (weak, nonatomic) IBOutlet UISegmentedControl *b4;
@property (weak, nonatomic) IBOutlet UILabel *answer;

@end
