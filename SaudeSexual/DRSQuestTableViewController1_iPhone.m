//
//  DRSQuestTableViewController1_iPhone.m
//  SaudeSexual
//
//  Created by Alain Machado da Silva Dutra on 23/04/12.
//  Copyright (c) 2012 DrSolution. All rights reserved.
//

#import "DRSQuestTableViewController1_iPhone.h"
#import "DRSQuestTableViewController2_iPhone.h"
#import "DRSQuestIntroViewController_iPhone.h"
#import "DRSPontTableViewController_iPhone.h"

@implementation DRSQuestTableViewController1_iPhone
@synthesize rootItems, item, sectionsArray, questArray, itemsArray;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[LocalyticsSession sharedLocalyticsSession] tagEvent:CLICKED_QUESTIONNAIRE_TAB_IN_IPHONE];
     NSBundle *bundle = [NSBundle mainBundle];
     
    
     if (rootItems == nil) {
        NSString *path = [bundle pathForResource:@"Questionários" ofType:@"plist"];
        NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
        self.rootItems = dict;
        
        self.questArray = [[self.rootItems allKeys] sortedArrayUsingSelector:@selector(compare:)];
       
    }
    if (sectionsArray == nil) {
       
        NSString *path = [bundle pathForResource:@"Nomes Questionários" ofType:@"plist"];
        NSArray *array =[[NSArray alloc] initWithContentsOfFile:path];
        self.sectionsArray = array;
        self.itemsArray = [[NSArray alloc] init];
                
    }
    
    UIImageView *tableHeaderView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
//    [tableHeaderView setFrame:CGRectMake(0, 0, 320, 100)];
    [tableHeaderView setBackgroundColor:[UIColor clearColor]];
                                         
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 310, 80)];
    headerLabel.text = @"Clique nas setas azuis para detalhes e na célula para fazer o questionário";
    headerLabel.numberOfLines = 3;
    headerLabel.textAlignment = UITextAlignmentCenter;
    headerLabel.textColor = [UIColor whiteColor];
    headerLabel.font = [UIFont fontWithName:@"Baskerville-BoldItalic" size:20.0];
    headerLabel.backgroundColor = [UIColor clearColor];
    [tableHeaderView addSubview:headerLabel];
    [self.tableView setTableHeaderView:tableHeaderView];
//    [self.tableView setBackgroundColor:[UIColor clearColor]];
//    UIImageView *tableBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"FreeVectorMetalTexture.png"]];
//    [tableBackgroundView setFrame:self.tableView.frame];
//    [self.tableView setBackgroundView:tableBackgroundView];


}

- (void)viewDidUnload
{
    [super viewDidUnload];
    rootItems=nil; item=nil; sectionsArray=nil; questArray=nil; itemsArray=nil;
}

- (void)viewWillAppear:(BOOL)animated
{
//    self.navigationItem.title = @"Questionários";
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.tintColor = [UIColor 
                                                         colorWithRed:0.31 green:0.52 blue:0.74 alpha:1];                                                         
    UILabel *titleView = (UILabel *)self.navigationItem.titleView;
    if (!titleView) {
        titleView = [[UILabel alloc] initWithFrame:CGRectZero];
        titleView.backgroundColor = [UIColor clearColor];
        titleView.font = [UIFont fontWithName:@"Baskerville-BoldItalic" size:30.0];
        titleView.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.5];
        
        titleView.textColor = [UIColor whiteColor]; // Change to desired color
        
        self.navigationItem.titleView = titleView;
        
    }
    titleView.text = @"Questionários";
    [titleView sizeToFit];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.png"]];
    [self.tableView setBackgroundView:imgView];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionsArray.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    self.itemsArray = [self.sectionsArray objectAtIndex:section];
    return self.itemsArray.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.itemsArray = [self.sectionsArray objectAtIndex:indexPath.section];
   
    self.item = [self.itemsArray objectAtIndex:[indexPath row]];
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.frame = CGRectMake(0, 0, 320, 90);
    cell.textLabel.text = self.item;
    cell.textLabel.textAlignment = UITextAlignmentCenter;
    cell.textLabel.numberOfLines = 4;
    cell.textLabel.backgroundColor = [UIColor clearColor];
     cell.textLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor clearColor];
    if (indexPath.section == 0) 
        cell.accessoryType = UITableViewCellAccessoryNone;
    else
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}

//- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    if (section == 1) {
//        return @"Questionários Qualitativos";
//    } else if (section ==2) {
//        return @"Questionários Quantitativos";
//    } else {
//        return nil;
//    }
//}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0,0, tableView.bounds.size.width, 90)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, tableView.bounds.size.width - 5, 80)];
    if (section == 1) {
        label.text = @"Questionários que sugerem o grau ou tipo da doença:";
    } else if (section ==2) {
        label.text = @"Questionários comparativos (para fazer antes e após algum tratamento):";
    } else if (section == 3) {
        label.text = @"Questionário de satisfação após tratamento da impotência sexual:";
    }
    label.font = [UIFont fontWithName:@"Baskerville-BoldItalic" size:20];
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
    label.numberOfLines = 3;
    [headerView addSubview:label];
    return headerView;
}

-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 10;
    }
    return 100;
}
    


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    id detailViewController;
    NSString *quest;
   
    if (indexPath.section == 0) {
        self.itemsArray = [self.sectionsArray objectAtIndex:indexPath.section];
        quest = [self.itemsArray objectAtIndex:[indexPath row]];
        if (indexPath.row == 0) {
            
            detailViewController = [[DRSQuestIntroViewController_iPhone alloc] initWithNibName:@"DRSQuestIntroViewController_iPhone" bundle:nil];
        } else {
            detailViewController = [[DRSPontTableViewController_iPhone alloc] initWithNibName:@"DRSPontTableViewController_iPhone" bundle:nil];
        }
        
    } else {
        self.itemsArray = [self.sectionsArray objectAtIndex:indexPath.section];
        quest = [self.itemsArray objectAtIndex:[indexPath row]];
        
        NSRange startRange = [quest rangeOfString:@"("];
        NSRange endRange = [quest rangeOfString:@")"];
        NSRange searchRange = NSMakeRange(startRange.location+1 , endRange.location-startRange.location-1);
        quest = [quest substringWithRange:searchRange]; 
       
        detailViewController = [[DRSQuestTableViewController2_iPhone alloc] initWithNibName:@"DRSQuestTableViewController2_iPhone" bundle:nil];
    }
    
    if ([detailViewController respondsToSelector:@selector(setQuest:)]) 
        [detailViewController setValue:quest forKey:@"quest"];
    if ([detailViewController respondsToSelector:@selector(setKey:)]) 
        [detailViewController setValue:quest forKey:@"key"];
    
    [self.navigationController pushViewController:detailViewController animated:YES];
         
}

-(void) tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    NSString *quest;
    self.itemsArray = [self.sectionsArray objectAtIndex:indexPath.section];
    quest = [self.itemsArray objectAtIndex:[indexPath row]];
    NSRange startRange = [quest rangeOfString:@"("];
    NSRange endRange = [quest rangeOfString:@")"];
    NSRange searchRange = NSMakeRange(startRange.location+1 , endRange.location-startRange.location-1);
    quest = [quest substringWithRange:searchRange]; 
    DRSQuestIntroViewController_iPhone *detailViewController = [[DRSQuestIntroViewController_iPhone alloc] initWithNibName:@"DRSQuestIntroViewController_iPhone" bundle:nil];
    detailViewController.key = quest;
    
    [self.navigationController pushViewController:detailViewController animated:YES];
}

@end
