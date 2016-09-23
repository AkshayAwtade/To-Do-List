//
//  AddTasks1.h
//  TO-DO-LIST
//
//  Created by Student P_08 on 18/09/16.
//  Copyright © 2016 AkshayAwtade. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tasks.h"
#import "DatabaseManager.h"
#import "ViewController.h"
@interface AddTasks1 : UIViewController<UITextFieldDelegate>
{
//    Tasks* taskModel;
    NSMutableArray *allTasks;
}
@property (weak, nonatomic) IBOutlet UITextField *textFeildName;
- (IBAction)buttonAddTapped:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *textFeildDescription;
@property (weak, nonatomic) IBOutlet UITextField *textfeildDate;

@end



