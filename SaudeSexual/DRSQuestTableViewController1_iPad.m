//
//  DRSQuestTableViewController1_iPad.m
//  SaudeSexual
//
//  Created by Alain Dutra on 23/06/12.
//  Copyright (c) 2012 DrSolution. All rights reserved.
//

#import "DRSQuestTableViewController1_iPad.h"
#import "DRSPontTableViewController_iPad.h"
#import "DRSPontTableViewController2_iPad.h"

@interface DRSQuestTableViewController1_iPad ()

@end

@implementation DRSQuestTableViewController1_iPad
@synthesize dvc;

- (void) detail {
    DRSAppDelegate *appDelegate = (DRSAppDelegate *) [[UIApplication sharedApplication] delegate];
    UISplitViewController *svc1 = [appDelegate.tabBarController.viewControllers objectAtIndex:1];
    UINavigationController *detail1 = [svc1.viewControllers objectAtIndex:1];
    self.dvc = [detail1.viewControllers objectAtIndex: 0];
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
     
    if (!self.dvc) {
        [self detail];
    }
    
    if (self.dvc.navigationController.viewControllers.count >1) {
        [self.dvc.navigationController popToRootViewControllerAnimated:YES];
        
    }
    self.navigationItem.backBarButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:@"Voltar"
                                     style:UIBarButtonItemStyleBordered
                                    target:nil
                                    action:nil];

}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.tableHeaderView = nil;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation == UIInterfaceOrientationLandscapeRight || interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

#pragma mark - Table view data source

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
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    if (indexPath.section == 0) 
        cell.accessoryType = UITableViewCellAccessoryNone;
    else
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *quest;
    self.itemsArray = [self.sectionsArray objectAtIndex:indexPath.section];
    
    if (indexPath.section == 0) {
        if (indexPath.row ==0 ) {
            quest = [self.itemsArray objectAtIndex:[indexPath row]];
            [self.dvc updateDetailViewWithThisContent:quest];

        } else {
            DRSPontTableViewController_iPad *vc1 = [[DRSPontTableViewController_iPad alloc] initWithNibName:@"DRSPontTableViewController_iPhone" bundle:nil];
            DRSAppDelegate *appDelegate = (DRSAppDelegate *) [[UIApplication sharedApplication] delegate];
            UINavigationController *nvc = [appDelegate detailNavigationController];
            DRSPontTableViewController2_iPad *vc2 = [[DRSPontTableViewController2_iPad alloc] initWithNibName:@"DRSPontTableViewController2_iPhone" bundle:nil];
            [nvc pushViewController:vc2 animated:YES];
            [self.navigationController pushViewController:vc1 animated:YES];
        }
               
    } else {
       
        quest = [self.itemsArray objectAtIndex:[indexPath row]];
        NSRange startRange = [quest rangeOfString:@"("];
        NSRange endRange = [quest rangeOfString:@")"];
        NSRange searchRange = NSMakeRange(startRange.location+1 , endRange.location-startRange.location-1);
        quest = [quest substringWithRange:searchRange]; 
        
        [self.dvc updateDetailViewWithThisContent:quest];
        
    }
}



@end
