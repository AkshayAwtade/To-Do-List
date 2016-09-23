//
//  ViewController.m
//  TO-DO-LIST
//
//  Created by Student P_08 on 18/09/16.
//  Copyright © 2016 AkshayAwtade. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self update];
 
//    allTasks=[[NSMutableArray alloc]init];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
    // Dispose of any resources that can be recreated.
}
-(void) viewDidAppear:(BOOL)animated
{
    
    
    
    [self update];
    
    
}

-(NSMutableArray *)getData
{
 allTasks=[[DatabaseManager sharedManager]executeSelectQuery:@"SELECT * FROM DATABASE"];
    return allTasks;
}

-(void)update
{
    [self getData];
    [self.tableView reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//   [tableView setBackgroundColor:[UIColor greenColor]];
    [tableView setAllowsSelection:YES];
    
    return 1;
    
}
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Update *updateTasks =[self.storyboard instantiateViewControllerWithIdentifier:@"Update"];
    updateTasks.taskSelected=[allTasks objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:updateTasks animated:YES];
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  allTasks.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID=@"cell";
    UITableViewCell *cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
   Tasks *taskModel=[allTasks objectAtIndex:indexPath.row];
    
           cell.backgroundColor=[UIColor orangeColor];
   
    
    cell.textLabel.textColor=[UIColor blackColor];
    cell.detailTextLabel.textColor=[UIColor blueColor];
    cell.detailTextLabel.text=taskModel.DESCRIPTION;
    
    
    cell.textLabel.text=taskModel.NAME;
    

    return cell;
    
}





-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    Tasks *taskModel=[allTasks objectAtIndex:indexPath.row];
    [[DatabaseManager sharedManager]deleteFromDatabase:taskModel];
    UIAlertController *alert =[UIAlertController alertControllerWithTitle:@"DELETE TASK" message:@"Task deleted sucessfully" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *OK =[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    [alert addAction:OK];
    [self presentViewController:alert animated:NO completion:nil];
    [self update];
    
}
- (IBAction)buttonAddTapped:(id)sender
{
   AddTasks1 *add =[self.storyboard instantiateViewControllerWithIdentifier:@"AddTasks1"];
    [self.navigationController pushViewController:add animated:YES];
}


@end
