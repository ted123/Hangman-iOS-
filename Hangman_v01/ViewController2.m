//
//  ViewController2.m
//  Hangman_v01
//
//  Created by Ted on 9/21/13.
//  Copyright (c) 2013 Ted. All rights reserved.
//

#import "ViewController2.h"
#import "gameoverPage.h"
@interface ViewController2 ()
-(void)checkit:(unichar)value;
-(void)generateBlanks:(NSString*)value;
-(void)newGame;
-(NSString*)placeSpaces:(NSString*)value;

@end

@implementation ViewController2
NSArray *words;
NSString* blankWord;
NSString* finishedWords=@"";
int randomIndex,mistake=0;
-(void)newGame{
    int counter=0;
    NSString* numString=@"";
    NSRange newWord;
    mistake=0;
    for (UIButton *b in self.allButtons) {
        [b setHidden:FALSE];
       
    }
    randomIndex=arc4random()%3;
    numString=[NSString stringWithFormat:@"%d",randomIndex];
    newWord = [finishedWords rangeOfString:numString];
    
    while(newWord.location!=NSNotFound){
        randomIndex=arc4random()%3;
        numString=[NSString stringWithFormat:@"%d",randomIndex];
       newWord = [finishedWords rangeOfString:numString];
        NSLog(@"nisud");
        counter++;
        if (counter>blankWord.length) {
            NSLog(@"you wooooon!");
           // [self.restorationClass: dismissViewControllerAnimated:YES completion:nil];
            gameoverPage *npage=[self.storyboard instantiateViewControllerWithIdentifier:@"gameoverPage"];
            
            
            [self presentViewController:npage animated:YES completion:nil];
            
            break;
        }
    }

    finishedWords=[finishedWords stringByAppendingFormat:@"%d",randomIndex];
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
    words = [NSArray arrayWithObjects:@"ARTIST  SAD",@"BAD",@"BALAY NA BATO",nil];
    randomIndex=arc4random()%3;
    blankWord=[self placeSpaces:words[randomIndex]];
    [self generateBlanks:(blankWord)];
     finishedWords=[finishedWords stringByAppendingFormat:@"%d",randomIndex];
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
