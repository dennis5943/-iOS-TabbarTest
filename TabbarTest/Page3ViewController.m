//
//  Page3ViewController.m
//  TabbarTest
//
//  Created by Lin Dennis on 13/7/18.
//  Copyright (c) 2013年 Lin Dennis. All rights reserved.
//

#import "Page3ViewController.h"
#import "MyCell.h"
#import "TableData.h"

@interface Page3ViewController ()

@property(nonatomic,retain) NSMutableArray *tableItems;



@end

@implementation Page3ViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableItems = [[NSMutableArray alloc]init];
    for(int i = 0;i < 30;i++)
    {        
        NSString *title = [NSString stringWithFormat:@"Title %d",i];
        NSString *subtitle = [NSString stringWithFormat:@"SubTitle %d",i];
        [self.tableItems addObject:[TableData ItemWithTitle:title SubTitle:subtitle]];
    }
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;    
    [self.editButtonItem setTitle:@"編輯"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.tableItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%d:%d",indexPath.section,indexPath.row);
    static NSString *CellIdentifier = @"MyCell";
    MyCell *cell = (MyCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if(cell == nil)
        cell = [[MyCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
    // Configure the cell...
    [cell.titleView setText:[self.tableItems[indexPath.row] Title]];
    [cell setTag:indexPath.row];
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

-(void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    
    if(self.tableView.editing)
    {
        [self.editButtonItem setTitle:@"關閉"];
        UIBarButtonItem *btn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(newItemClick:)];
        [self.navigationItem setLeftBarButtonItem:btn animated:YES];
        [btn release];
    }
    else
    {
        [self.navigationItem setLeftBarButtonItem:nil animated:YES];
        [self.editButtonItem setTitle:@"編輯"];
    }
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.tableItems removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    TableData *from = [self.tableItems objectAtIndex:fromIndexPath.row];
    [self.tableItems removeObjectAtIndex:fromIndexPath.row];
    [self.tableItems insertObject:from atIndex:toIndexPath.row];
}

// New ItemClick
-(IBAction)newItemClick:(id)sender
{
    NSString *title = [NSString stringWithFormat:@"Title %d",self.tableItems.count];
    NSString *subtitle = [NSString stringWithFormat:@"SubTitle %d",self.tableItems.count];
    TableData *data = [TableData ItemWithTitle:title SubTitle:subtitle];
    [self.tableItems addObject:data];
    [self.tableView reloadData];
}

// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    TableData *item = [self.tableItems objectAtIndex:indexPath.row];
    NSString *msg = [NSString stringWithFormat:@"Title:%@ SubTitle:%@",item.Title,item.SubTitle];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:msg delegate:nil cancelButtonTitle:@"Close" otherButtonTitles:nil];
    [alert show];
    [alert release];
}

#pragma mark - MyCellDelegate
-(void)OnMyCustomViewCellButtonClicked:(id)sender cell:(MyCell *)cell
{
    [self.tableItems[cell.tag] setTitle:@"change"];
    [cell.titleView setText:[self.tableItems[cell.tag] Title]];
    [[self.tabBarController.tabBar.items objectAtIndex:2] setBadgeValue:@"N"];
}

@end
