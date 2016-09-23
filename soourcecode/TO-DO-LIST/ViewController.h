//
//  ViewController.h
//  TO-DO-LIST
//
//  Created by Student P_08 on 18/09/16.
//  Copyright © 2016 AkshayAwtade. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatabaseManager.h"
#import "Tasks.h"
#import "AddTasks1.h"
#import "Update.h"


@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    
    NSMutableArray *allTasks;
}
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;



- (IBAction)buttonAddTapped:(id)sender;

@end



