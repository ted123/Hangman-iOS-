//
//  ViewController2.h
//  Hangman_v01
//
//  Created by Ted on 9/21/13.
//  Copyright (c) 2013 Ted. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController2 : UIViewController
<UIAlertViewDelegate,UITextFieldDelegate>
- (IBAction)return:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *answer;
- (IBAction)buttons:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *himage;
@property (weak, nonatomic) IBOutlet UILabel *hintlabel;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *allButtons;

@end
