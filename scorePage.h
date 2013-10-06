//
//  scorePage.h
//  Hangman_v01
//
//  Created by ted on 10/6/13.
//  Copyright (c) 2013 Ted. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface scorePage : UIViewController
- (IBAction)back:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *l1;
@property (weak, nonatomic) IBOutlet UILabel *l2;
@property (weak, nonatomic) IBOutlet UILabel *l3;
@property (weak, nonatomic) IBOutlet UILabel *l11;
@property (weak, nonatomic) IBOutlet UILabel *l12;
@property (weak, nonatomic) IBOutlet UILabel *l13;
@property (weak, nonatomic) IBOutlet UILabel *l21;
@property (weak, nonatomic) IBOutlet UILabel *l22;
@property (weak, nonatomic) IBOutlet UILabel *l23;

@property (weak, nonatomic) IBOutlet UILabel *l31;
@property (weak, nonatomic) IBOutlet UILabel *l32;
@property (weak, nonatomic) IBOutlet UILabel *l33;
- (IBAction)reset:(id)sender;

@end
