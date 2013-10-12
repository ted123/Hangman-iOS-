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
-(void)selectImage;
-(void)generateScore;
-(void)saveScore;
-(void)incrementChar;
-(void)adjustScore:(int)val;
@end

@implementation ViewController2
NSArray *words,*hints,*hangmanimg;
NSString* blankWord,*wordhint,*name;
NSString* firstTracker=@"",*secondTracker=@"",*thirdTracker=@"",*fname=@"";
int randomIndex,randomDifficulty,mistake=0,number=0,points=0,fpoints=0,t01=0,t02=0,t03=0;
-(void)adjustScore:(int)val{
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
    int nc=1;
   
    switch (val) {
        case 0:
           
            for (nc=1; nc>=0; nc--) {
                
                [defaults setObject:[defaults objectForKey:tmp1[nc]] forKey:tmp1[nc+1]];
                [defaults setObject:[defaults objectForKey:tmp[nc]] forKey:tmp[nc+1]];
                [defaults setObject:[defaults objectForKey:tmp2[nc]] forKey:tmp2[nc+1]];
                [defaults setObject:[defaults objectForKey:tmp3[nc]] forKey:tmp3[nc+1]];
                [defaults setObject:[defaults objectForKey:tmp4[nc]] forKey:tmp4[nc+1]];
            }
            break;
        case 1:
            [defaults setObject:[defaults objectForKey:tmp1[nc]] forKey:tmp1[nc+1]];
            [defaults setObject:[defaults objectForKey:tmp[nc]] forKey:tmp[nc+1]];
            [defaults setObject:[defaults objectForKey:tmp2[nc]] forKey:tmp2[nc+1]];
            [defaults setObject:[defaults objectForKey:tmp3[nc]] forKey:tmp3[nc+1]];
            [defaults setObject:[defaults objectForKey:tmp4[nc]] forKey:tmp4[nc+1]];

            break;
            
        default:
            break;
    }
}
-(void)incrementChar{
    if(randomDifficulty==0){
        t01=t01+1;
    }else if (randomDifficulty==1){
        t02=t02+1;
    }else if (randomDifficulty==2){
        t03=t03+1;
    }
}

-(void)saveScore{
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
    NSString *s;
    int stmp;
    for (int cnter=0; cnter<3; cnter++) {
        s=[defaults objectForKey:tmp[cnter]];
        stmp=[s integerValue];
        if (points>stmp) {
            [self adjustScore:cnter];
            [defaults setObject:name forKey:tmp1[cnter] ];
            
            s=[NSString stringWithFormat:@"%d",points];
            [defaults setObject:s forKey:tmp[cnter]];
            
            s=[NSString stringWithFormat:@"%d",t03];
            [defaults setObject:s forKey:tmp2[cnter]];
            
            s=[NSString stringWithFormat:@"%d",t01];
            [defaults setObject:s forKey:tmp3[cnter]];
           
            s=[NSString stringWithFormat:@"%d",t02];
            [defaults setObject:s forKey:tmp4[cnter]];
            break;
        }
    }
  
    
}

-(void)generateScore{
    switch (randomDifficulty) {
        case 0:
            points=points+10;
            break;
        case 1:
            points=points+20;
            break;
        case 2:
            points=points+30;
            break;
        default:
            break;
    }
}

-(void)selectImage{
   
    switch (randomDifficulty) {
        case 1:
            hangmanimg=[[NSArray alloc] initWithObjects:
                        [UIImage imageNamed:@"kit1.png"],
                        [UIImage imageNamed:@"kit2.png"],
                        [UIImage imageNamed:@"kit3.png"],
                        [UIImage imageNamed:@"kit4.png"],
                        nil];

            break;
        case 0:
            hangmanimg=[[NSArray alloc] initWithObjects:
                        [UIImage imageNamed:@"rj1.png"],
                        [UIImage imageNamed:@"rj2.png"],
                        [UIImage imageNamed:@"rj3.png"],
                        [UIImage imageNamed:@"rj4.png"],
                        nil];
            
            break;
        case 2:
            hangmanimg=[[NSArray alloc] initWithObjects:
                        [UIImage imageNamed:@"dits1.png"],
                        [UIImage imageNamed:@"dits2.png"],
                        [UIImage imageNamed:@"dits3.png"],
                        [UIImage imageNamed:@"dits4.png"],
                        nil];
            
            break;
            
            
        default:
            break;
    }
 
}


-(void)reset{
    blankWord=@"";
    name=@"";
    firstTracker=@"";
    secondTracker=@"";
    thirdTracker=@"";
    mistake=0;
    number=0;
    wordhint=@"";
    points=0;
    t01=0;
    t02=0;
    t03=0;
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
    Boolean ftrackerFull=false,strackerFull=false,ttrackerFull=false,changedController=false;
    NSString* numString=@"";
    NSRange newWord;
    mistake=0;
    [self generateScore];
    [self incrementChar];
    
    fpoints=points;
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
       
        if ([self selectRecordedWord].length==3) {
             
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
            
            
        }
        if(ftrackerFull && strackerFull && ttrackerFull){
            [self saveScore];
            _fpoints.text=[NSString stringWithFormat:@"%d",fpoints];
            [self reset];
            gameoverPage *npage=[self.storyboard instantiateViewControllerWithIdentifier:@"gameoverPage"];
            
           
            [self presentViewController:npage animated:YES completion:nil];
            changedController=true;
            break;
            
        }
    }
    if(!changedController){
    [self recordWord:randomIndex];
    blankWord=[self placeSpaces:words[randomIndex]];
    [self generateBlanks:(blankWord)];
    [self selectImage];
    _himage.image=hangmanimg[0];
    _hintlabel.text=hints[randomIndex];
    }
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
        _answer.textAlignment=NSTextAlignmentCenter;
            
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
         _himage.image=hangmanimg[mistake];
        if(mistake==3){
            NSString *totalpts=[NSString stringWithFormat:@"Your total score: %d",points];
            
            UIAlertView *alertDialog;
            alertDialog= [[UIAlertView alloc] initWithTitle:@"Game Over!"
                                                   message:totalpts
                                                  delegate:self
                                         cancelButtonTitle:@"OK... T_T"
                                         otherButtonTitles: nil];
            [alertDialog show];
            [self saveScore];
            [self reset];
           
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
    [self reset];
    [super viewDidLoad];
    name=((selectChar *)self.presentingViewController).playername.text;
    randomDifficulty=[((selectChar *)self.presentingViewController).tobehanged.text intValue];
    [self randomizeDifficulty:randomDifficulty];
    randomIndex=arc4random()%3;
    blankWord=[self placeSpaces:words[randomIndex]];
    [self generateBlanks:(blankWord)];
    [self recordWord:randomIndex];
    [self selectImage];
    _himage.image=hangmanimg[0];
    _hintlabel.text=hints[randomIndex];
    _pname.text=name;
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
