//
//  selectChar.h
//  Hangman_v01
//
//  Created by rj on 10/4/13.
//  Copyright (c) 2013 Ted. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface selectChar : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *tobehanged;
@property (strong, nonatomic) IBOutlet UITextField *playername;
- (IBAction)begingame:(id)sender;

@end