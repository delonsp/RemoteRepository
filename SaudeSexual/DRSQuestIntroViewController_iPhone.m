//
//  DRSQuestIntroViewController_iPhone.m
//  SaudeSexual
//
//  Created by Alain Machado da Silva Dutra on 05/05/12.
//  Copyright (c) 2012 DrSolution. All rights reserved.
//

#import "DRSQuestIntroViewController_iPhone.h"

@interface DRSQuestIntroViewController_iPhone ()

@end

@implementation DRSQuestIntroViewController_iPhone

@synthesize title;
@synthesize text;
@synthesize key;

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
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"Intro Questionários" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSArray *array = [[NSArray alloc] init ];
    NSString *str2 = [[NSString alloc] init];
    if (self.key) {
        array = [dict objectForKey:self.key];
        for (NSString *str in array) {
            str2 = [str2 stringByAppendingString:@"\n\n\n"];
            str2 = [str2 stringByAppendingString:str];
        }
        
    }
    self.text.text = str2;
   
    self.text.font = [UIFont fontWithName:@"TrebuchetMS" size:20.0];
       
}

- (void)viewDidUnload
{
    
    [self setText:nil];
    [self setTitle:nil];
    [self setTitle:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
