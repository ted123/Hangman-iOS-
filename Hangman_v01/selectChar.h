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
@property (weak, nonatomic) IBOutlet UILabel *rjname;
@property (weak, nonatomic) IBOutlet UILabel *kitname;
@property (weak, nonatomic) IBOutlet UILabel *ditzname;

- (IBAction)pname:(id)sender;



- (IBAction)begingame:(id)sender;
- (IBAction)selectorC:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *a;
@property (strong, nonatomic) IBOutlet UIButton *b;
@property (strong, nonatomic) IBOutlet UIButton *c;

@end
