//
//  ViewController2.m
//  Hangman_v01
//
//  Created by Ted on 9/21/13.
//  Copyright (c) 2013 Ted. All rights reserved.
//

#import "ViewController2.h"
#import "gameoverPage.h"
@interface ViewController2()
-(void)checkit:(unichar)value;
-(void)generateBlanks:(NSString*)value;
-(void)newGame;
-(NSString*)placeSpaces:(NSString*)value;
-(void)randomizeDifficulty;
-(void)recordWord:(int)value;
-(NSString*)selectRecordedWord;

@end

@implementation ViewController2
NSArray *words,*hints;
NSString* blankWord;
NSString* firstTracker=@"",*secondTracker=@"",*thirdTracker=@"";
int randomIndex,randomDifficulty,mistake=0;
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
    int counter=0;
    Boolean ftrackerFull=false,strackerFull=false,ttrackerFull=false;
    NSString* numString=@"";
    NSRange newWord;
    mistake=0;
    for (UIButton *b in self.allButtons) {
        [b setHidden:FALSE];
       
    }
    [self randomizeDifficulty];
    randomIndex=arc4random()%3;
    numString=[NSString stringWithFormat:@"%d",randomIndex];
    newWord = [[self selectRecordedWord] rangeOfString:numString];
      NSLog(@"randomIndex:%d randomDifficuty:%d",randomIndex,randomDifficulty);
    while(newWord.location!=NSNotFound){
       
        randomIndex=arc4random()%3;
        numString=[NSString stringWithFormat:@"%d",randomIndex];
       newWord = [[self selectRecordedWord] rangeOfString:numString];
        NSLog(@"nisuD %@ randomDifficuty:%d",[self selectRecordedWord],randomDifficulty);
        counter++;
        if (counter>3) {
             NSLog(@"checkifallfull %d",randomDifficulty);
            if (randomDifficulty==0 && !ftrackerFull) {
                ftrackerFull=true;
                counter=0;
                NSLog(@"bank1 is full");
            }else if (randomDifficulty==1 && !strackerFull){
                strackerFull=true;
                counter=0;
                 NSLog(@"bank2 is full");
            }else if (randomDifficulty==2 && !ttrackerFull){
                ttrackerFull=true;
                counter=0;
                 NSLog(@"bank3 is full");
            }
             [self randomizeDifficulty];
            
        }
        if(ftrackerFull && strackerFull && ttrackerFull){
            firstTracker=@"";
            secondTracker=@"";
            thirdTracker=@"";
            ftrackerFull=false;
            strackerFull=false;
            ttrackerFull=false;
            
            NSLog(@"you wooooon!");
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
        
        NSLog(@"CONGRATS!");
        [self newGame];
        
    }
    
}

-(void)randomizeDifficulty{
    randomDifficulty=arc4random()%3;
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
    [self randomizeDifficulty];
    randomIndex=arc4random()%3;
    blankWord=[self placeSpaces:words[randomIndex]];
    [self generateBlanks:(blankWord)];
    [self recordWord:randomIndex];
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)return:(id)sender {
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
