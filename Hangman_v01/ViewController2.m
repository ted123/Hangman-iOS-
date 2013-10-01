//
//  ViewController2.m
//  Hangman_v01
//
//  Created by Ted on 9/21/13.
//  Copyright (c) 2013 Ted. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()
-(void)checkit:(unichar)value;
-(void)generateBlanks:(NSString*)value;
-(NSString*)placeSpaces:(NSString*)value;
@end

@implementation ViewController2
NSArray *words;
NSString* blankWord;
int randomIndex,mistake=0;

-(NSString*)placeSpaces:(NSString *)value{
    NSString* result=@"";
    for (int i=0; i<value.length; i++) {
        unichar ch = [value characterAtIndex:i];
        result=[result stringByAppendingFormat:@"%c ",ch];
    }
    return result;
}

-(void)generateBlanks:(NSString *)value{
    _answer.text=@"";
    for (int i=0; i<value.length; i++) {
        unichar ch = [value characterAtIndex:i];
        if (ch!=' ') {
            _answer.text=[_answer.text stringByAppendingFormat:@"_"];
        }else{
            _answer.text=[_answer.text stringByAppendingFormat:@" "];
        }
            
    }
}


- (void)checkit:(unichar)value{
   

    NSString* ans_prev=_answer.text;
    unichar ch;
    Boolean change=FALSE;
  
    _answer.text=@"";
    for (int i=0; i<blankWord.length; i++) {
            ch = [blankWord characterAtIndex:i];
        
            if(ch==value){
                _answer.text=[_answer.text stringByAppendingFormat:@"%c",value];
                change=TRUE;
            }else if(ch==' '){
                _answer.text=[_answer.text stringByAppendingFormat:@" "];
            }else if([ans_prev characterAtIndex:i]!='_') {
                _answer.text=[_answer.text stringByAppendingFormat:@"%c",[ans_prev characterAtIndex:i]];
            }else{
                _answer.text=[_answer.text stringByAppendingFormat:@"_"];
                
               
            }
        
         
    }
    
    if(!change){
        mistake++;
        
        if(mistake==3){
            UIAlertView *alertDialog;
            alertDialog= [[UIAlertView alloc] initWithTitle:@"You suck!"
                                                   message:@"Try again loser!"
                                                  delegate:self
                                         cancelButtonTitle:@"OK... T_T"
                                         otherButtonTitles: nil];
            [alertDialog show];
            mistake=0;
           
        }
    }
}


- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString *buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
    if ([buttonTitle isEqualToString:@"OK... T_T"]) {
       [self dismissViewControllerAnimated:YES completion:nil];
    }
    
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
    words = [NSArray arrayWithObjects:@"ARTIST  SAD",@"BROKEN HEART",@"I LOVE PATTY",@"LUKE THE ADDICT",@"BALAY NA BATO",nil];
    randomIndex=arc4random()%5;
    blankWord=[self placeSpaces:words[randomIndex]];
    [self generateBlanks:(blankWord)];
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
    UIColor *color = [UIColor colorWithRed: 251/255.0 green:175/255.0 blue:93/255.0 alpha:1.0];
    switch (_b1.selectedSegmentIndex) {
        case 0:
              //[_b1 setBackgroundColor:color forSegmentAtIndex:0];
            [_b1 setEnabled:NO forSegmentAtIndex:0];
            [self checkit:'A'];
            break;
        case 1:
                [self checkit:'B'];
            break;
        case 2:
                [self checkit:'C'];
            break;
        case 3:
                [self checkit:'D'];
            break;
        case 4:
                [self checkit:'E'];
            break;
        case 5:
                [self checkit:'F'];
            break;
        case 6:
                [self checkit:'G'];
            break;
        default:
            break;
    }
    switch (_b2.selectedSegmentIndex) {
        case 0:
            [self checkit:'H'];
            break;
        case 1:
            [self checkit:'I'];
            break;
        case 2:
            [self checkit:'J'];
            break;
        case 3:
            [self checkit:'K'];
            break;
        case 4:
            [self checkit:'L'];
            break;
        case 5:
            [self checkit:'M'];
            break;
        case 6:
            [self checkit:'N'];
            break;
        default:
            break;
    }
    switch (_b3.selectedSegmentIndex) {
        case 0:
            [self checkit:'O'];
            break;
        case 1:
            [self checkit:'P'];
            break;
        case 2:
            [self checkit:'Q'];
            break;
        case 3:
            [self checkit:'R'];
            break;
        case 4:
            [self checkit:'S'];
            break;
        case 5:
            [self checkit:'T'];
            break;
        case 6:
            [self checkit:'U'];
            break;
        default:
            break;
    }
    switch (_b4.selectedSegmentIndex) {
        case 0:
            [self checkit:'V'];
            break;
        case 1:
            [self checkit:'W'];
            break;
        case 2:
            [self checkit:'X'];
            break;
        case 3:
            [self checkit:'Y'];
            break;
        case 4:
            [self checkit:'Z'];
            break;
        default:
            break;
    }
    
}
@end
