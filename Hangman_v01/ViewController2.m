//
//  ViewController2.m
//  Hangman_v01
//
//  Created by Ted on 9/21/13.
//  Copyright (c) 2013 Ted. All rights reserved.
//

#import "ViewController2.h"
#import "gameoverPage.h"
#import "selectChar.h"
@interface ViewController2()
-(void)checkit:(unichar)value;
-(void)generateBlanks:(NSString*)value;
-(void)newGame;
-(NSString*)placeSpaces:(NSString*)value;
-(void)randomizeDifficulty:(int)value;
-(void)recordWord:(int)value;
-(void)reset;
-(NSString*)selectRecordedWord;

@end

@implementation ViewController2
NSArray *words,*hints;
NSString* blankWord,*name;
NSString* firstTracker=@"",*secondTracker=@"",*thirdTracker=@"";
int randomIndex,randomDifficulty,mistake=0,number=0;
-(void)reset{
    blankWord=@"";
    name=@"";
    firstTracker=@"";
    secondTracker=@"";
    thirdTracker=@"";
    mistake=0;
    number=0;
}
-(void)recordWord:(int)value{
    switch (randomDifficulty) {
        case 0:
             firstTracker=[firstTracker stringByAppendingFormat:@"%d",value];
            break;
        case 1:
            secondTracker=[secondTracker stringByAppendingFormat:@"%d",value];
            break;
        case 2:
            thirdTracker=[thirdTracker stringByAppendingFormat:@"%d",value];
            break;
            
        default:
            break;
    }
}
-(NSString*)selectRecordedWord{
    switch (randomDifficulty) {
        case 0:
            return firstTracker;
            break;
        case 1:
            return secondTracker;
            break;
        case 2:
            return thirdTracker;
            break;
            
        default:
            break;
    }
    return @"null";
}
-(void)newGame{
    Boolean ftrackerFull=false,strackerFull=false,ttrackerFull=false,s=false,f=false,t=false;
    NSString* numString=@"";
    NSRange newWord;
    mistake=0;
    for (UIButton *b in self.allButtons) {
        [b setHidden:FALSE];
       
    }
    number++;
    NSLog(@"%d Difficulty:%d Index:%d Prev:%@",number,randomDifficulty,randomIndex,[self selectRecordedWord]);
    [self randomizeDifficulty:arc4random()%3];
    randomIndex=arc4random()%3;
    numString=[NSString stringWithFormat:@"%d",randomIndex];
    newWord = [[self selectRecordedWord] rangeOfString:numString];
     // NSLog(@"randomIndex:%d randomDifficuty:%d",randomIndex,randomDifficulty);
    while(newWord.location!=NSNotFound){
       
        randomIndex=arc4random()%3;
        numString=[NSString stringWithFormat:@"%d",randomIndex];
       newWord = [[self selectRecordedWord] rangeOfString:numString];
       
        
        switch (randomIndex) {
            case 0:
                f=true;
                break;
            case 1:
                s=true;
                break;
            case 2:
                t=true;
                break;
            
                
            default:
                break;
        }
        
        
        
        if (f&&t&&s) {
             
            if (randomDifficulty==0 && !ftrackerFull) {
                ftrackerFull=true;
                NSLog(@"bank1 is full");
            }else if (randomDifficulty==1 && !strackerFull){
                strackerFull=true;
                NSLog(@"bank2 is full");
            }else if (randomDifficulty==2 && !ttrackerFull){
                ttrackerFull=true;
                 NSLog(@"bank3 is full");
            }
            [self randomizeDifficulty:arc4random()%3];
            f=false;t=false;s=false;
            
        }
        if(ftrackerFull && strackerFull && ttrackerFull){
            [self reset];
            //NSLog(@"you wooooon!");
            gameoverPage *npage=[self.storyboard instantiateViewControllerWithIdentifier:@"gameoverPage"];
            
           
            [self presentViewController:npage animated:YES completion:nil];
            
            break;
            
        }
    }

    [self recordWord:randomIndex];
    blankWord=[self placeSpaces:words[randomIndex]];
    [self generateBlanks:(blankWord)];
}

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
            [self reset];
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
       //[self popTo  dismissViewControllerAnimated:YES completion:nil];
      
       // [self presentViewController:ViewController animated:NO completion:nil];
       // [self dismissViewControllerAnimated:YES completion:nil];
         [self.view.window.rootViewController dismissViewControllerAnimated:YES completion:nil];
     
    }else if ([buttonTitle isEqualToString:@"Proceed!"]) {
        
       // NSLog(@"CONGRATS!");
        [self newGame];
        
    }
    
}

-(void)randomizeDifficulty:(int)value{
    randomDifficulty=value;
    switch (randomDifficulty) {
        case 0:
            words = [NSArray arrayWithObjects:@"SMILING",@"BAD",@"CINNAMON",nil];
            hints = [NSArray arrayWithObjects:@"Facial Epression",@"A negative trait",@"A kind of bread",nil];
            break;
        case 1:
            words = [NSArray arrayWithObjects:@"A",@"BB",@"CCC",nil];
             hints = [NSArray arrayWithObjects:@"A letter",@"A letter",@"A letter",nil];
            break;
        case 2:
            words = [NSArray arrayWithObjects:@"DDDD",@"EEEEEE",@"FFFFFF",nil];
            hints = [NSArray arrayWithObjects:@"A letter",@"A letter",@"A letter",nil];
        default:
            break;
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
    NSLog(@"NI LOAD!");
  
    [super viewDidLoad];
    name=((selectChar *)self.presentingViewController).playername.text;
    randomDifficulty=[((selectChar *)self.presentingViewController).tobehanged.text intValue];
    [self randomizeDifficulty:randomDifficulty];
    randomIndex=arc4random()%3;
    blankWord=[self placeSpaces:words[randomIndex]];
    [self generateBlanks:(blankWord)];
    [self recordWord:randomIndex];
    //NSLog(@"%@ difficulty %d",name,randomDifficulty);
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)return:(id)sender {
    [self reset];
        [self.view.window.rootViewController dismissViewControllerAnimated:YES completion:nil];
    //[self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)buttons:(UIButton *)sender {
    int x=[sender tag];
    UIButton *selected;
    NSString *inputs=@"0ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    
    [self checkit:[inputs characterAtIndex:x]];
    selected=(UIButton*)[self.view viewWithTag:x];
    [selected setHidden:true];
    
    if([_answer.text isEqualToString:blankWord]){
       
        UIAlertView *congratsDialog;
        congratsDialog= [[UIAlertView alloc] initWithTitle:@"Congratulations!"
                                                message:@"You have succesfully guessed the word/phrase!"
                                               delegate:self
                                      cancelButtonTitle:@"Proceed!"
                                      otherButtonTitles: nil];
        [congratsDialog show];
    }
    
}


@end
