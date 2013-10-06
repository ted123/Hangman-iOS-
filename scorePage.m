//
//  scorePage.m
//  Hangman_v01
//
//  Created by ted on 10/6/13.
//  Copyright (c) 2013 Ted. All rights reserved.
//

#import "scorePage.h"

@interface scorePage ()

@end

@implementation scorePage


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
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSArray *tmp=[[NSArray alloc] initWithObjects:
                  @"s1",@"s2",@"s3",nil];
    NSArray *tmp1=[[NSArray alloc] initWithObjects:
                   @"n1",@"n2",@"n3",nil];
    NSArray *tmp2=[[NSArray alloc] initWithObjects:
                   @"t11",@"t12",@"t13",nil];
    NSArray *tmp3=[[NSArray alloc] initWithObjects:
                   @"t21",@"t22",@"t23",nil];
    NSArray *tmp4=[[NSArray alloc] initWithObjects:
                   @"t31",@"t32",@"t33",nil];
   // NSString *s,*name,*score,*st1,*st2,*st3;
  //  int stmp;
 
    _l1.text=[NSString stringWithFormat:@"%@   Score:%@",[defaults objectForKey:tmp1[0]],[defaults objectForKey:tmp[0]]];

    _l11.text=[NSString stringWithFormat:@" x %@",[defaults objectForKey:tmp2[0]]];
    
    _l12.text=[NSString stringWithFormat:@" x %@",[defaults objectForKey:tmp3[0]]];
    
    _l13.text=[NSString stringWithFormat:@" x %@",[defaults objectForKey:tmp4[0]]];
    
    _l2.text=[NSString stringWithFormat:@"%@   Score:%@",[defaults objectForKey:tmp1[1]],[defaults objectForKey:tmp[1]]];
    
    _l21.text=[NSString stringWithFormat:@" x %@",[defaults objectForKey:tmp2[1]]];
    
    _l22.text=[NSString stringWithFormat:@" x %@",[defaults objectForKey:tmp3[1]]];
    
    _l23.text=[NSString stringWithFormat:@" x %@",[defaults objectForKey:tmp4[1]]];
    
    _l3.text=[NSString stringWithFormat:@"%@   Score:%@",[defaults objectForKey:tmp1[2]],[defaults objectForKey:tmp[2]]];
    
    _l31.text=[NSString stringWithFormat:@" x %@",[defaults objectForKey:tmp2[2]]];
    
    _l32.text=[NSString stringWithFormat:@" x %@",[defaults objectForKey:tmp3[2]]];
    
    _l33.text=[NSString stringWithFormat:@" x %@",[defaults objectForKey:tmp4[2]]];
    
 
        
    
        
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)reset:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSArray *tmp=[[NSArray alloc] initWithObjects:
                  @"s1",@"s2",@"s3",nil];
    NSArray *tmp1=[[NSArray alloc] initWithObjects:
                   @"n1",@"n2",@"n3",nil];
    NSArray *tmp2=[[NSArray alloc] initWithObjects:
                   @"t11",@"t12",@"t13",nil];
    NSArray *tmp3=[[NSArray alloc] initWithObjects:
                   @"t21",@"t22",@"t23",nil];
    NSArray *tmp4=[[NSArray alloc] initWithObjects:
                   @"t31",@"t32",@"t33",nil];
    
    for (int nc=0; nc<3; nc++) {
        [defaults setObject:@"------" forKey:tmp1[nc]];
        [defaults setObject:@"0" forKey:tmp[nc]];
        [defaults setObject:@"0" forKey:tmp2[nc]];
        [defaults setObject:@"0" forKey:tmp3[nc]];
        [defaults setObject:@"0" forKey:tmp4[nc]];
    }
    [self viewDidLoad];
}
@end
