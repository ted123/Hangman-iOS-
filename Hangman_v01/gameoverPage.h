//
//  gameoverPage.h
//  Hangman_v01
//
//  Created by Ted on 10/2/13.
//  Copyright (c) 2013 Ted. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
@interface gameoverPage : UIViewController
- (IBAction)quit:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *final;
@property (weak, nonatomic) IBOutlet UILabel *remarks;

@end
