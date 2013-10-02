//
//  ViewController2.h
//  Hangman_v01
//
//  Created by Ted on 9/21/13.
//  Copyright (c) 2013 Ted. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController2 : UIViewController
<UIAlertViewDelegate>
- (IBAction)return:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *answer;
- (IBAction)buttons:(id)sender;

@end
