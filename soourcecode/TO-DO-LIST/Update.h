//
//  Update.h
//  TO-DO-LIST
//
//  Created by Student P_08 on 18/09/16.
//  Copyright © 2016 AkshayAwtade. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tasks.h"
#import "DatabaseManager.h"
#import "ViewController.h"

@interface Update : UIViewController<UITextFieldDelegate>
{
    Tasks * selectedTask;
    NSString * name;
    NSString * description;
    NSString * date;
    ;
}
@property (weak, nonatomic) IBOutlet UIButton *buttonUpdate;
@property (nonatomic)Tasks * taskSelected;
@property (weak, nonatomic) IBOutlet UITextField *textfeildDescription;
@property (weak, nonatomic) IBOutlet UITextField *textFeildDate;
- (IBAction)Updatebutton:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *textfeildName;
@end
