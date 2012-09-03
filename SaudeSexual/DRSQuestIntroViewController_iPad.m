//
//  DRSQuestIntroViewController_iPad.m
//  SaudeSexual
//
//  Created by Alain Dutra on 24/06/12.
//  Copyright (c) 2012 DrSolution. All rights reserved.
//

#import "DRSQuestIntroViewController_iPad.h"
#import "DRSQuestTableViewController2_iPad.h"

@interface DRSQuestIntroViewController_iPad ()
@property (strong, nonatomic) NSDictionary *dict;
@property (strong, nonatomic) UILabel *titleView;

@end

@implementation DRSQuestIntroViewController_iPad
@synthesize dict;
@synthesize titleView;



-(void) updateDetailViewWithThisContent: (NSString *) content {
    self.key = content;
    titleView.text = content;
    [titleView.text isEqualToString:@"Sobre os Questionários"] ? titleView.text = @"Introdução" : titleView;
    UIBarButtonItem *nextButton;
    NSArray *array = [[NSArray alloc] init];
    array = [dict objectForKey:self.key];
    NSString *str2 = @"";
    for (NSString *str in array) {
        str2 = [str2 stringByAppendingString:@"\n"];
        str2 = [str2 stringByAppendingString:str];
    }
    self.text.text = str2;
    if (![self.key isEqualToString:@"Sobre os Questionários"]) {
        nextButton = [[UIBarButtonItem alloc]
                      initWithTitle:@"Continuar"
                      style:UIBarButtonItemStyleBordered
                      target:self
                      action:@selector(continuar:)];
        self.navigationItem.rightBarButtonItem = nextButton;
    } else {
        self.navigationItem.rightBarButtonItem = nil;
    }


}

- (void) continuar:(id)sender {
    DRSQuestTableViewController2_iPad *vc = [[DRSQuestTableViewController2_iPad alloc] 
                                             initWithNibName:@"DRSQuestTableViewController2_iPad" bundle:nil];
    vc.quest = self.key;
    
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.tintColor = [UIColor 
                                                         colorWithRed:0.31 green:0.52 blue:0.74 alpha:1];                                                         
    self.titleView = (UILabel *)self.navigationItem.titleView;
    if (!titleView) {
        titleView = [[UILabel alloc] initWithFrame:CGRectZero];
        titleView.backgroundColor = [UIColor clearColor];
        titleView.font = [UIFont fontWithName:@"Baskerville-BoldItalic" size:30.0];
        titleView.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.5];
        
        titleView.textColor = [UIColor whiteColor]; // Change to desired color
        
        self.navigationItem.titleView = titleView;
        titleView.text = @"Introdução";
        [titleView sizeToFit];
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"Intro Questionários" ofType:@"plist"];
    self.dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    [self updateDetailViewWithThisContent:@"Sobre os Questionários"];
   
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation == UIInterfaceOrientationLandscapeRight || interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

@end
