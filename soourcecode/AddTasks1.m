//
//  AddTasks1.m
//  TO-DO-LIST
//
//  Created by Student P_08 on 18/09/16.
//  Copyright © 2016 AkshayAwtade. All rights reserved.
//

#import "AddTasks1.h"

@interface AddTasks1 ()

@end

@implementation AddTasks1

- (void)viewDidLoad {
    [super viewDidLoad];
//    taskModel =[[Tasks alloc]init];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSArray *) getdata{
    allTasks=[[DatabaseManager sharedManager]executeSelectQuery:@"SELECT * FROM DATABASE"];
    return allTasks;
}



-(void)insert :(NSString *)query{
    Tasks *taskModel=[[Tasks alloc]init];
    taskModel.NAME=self.textFeildName.text;
    taskModel.DESCRIPTION=self.textFeildDescription.text;
    taskModel.DATE=self.textfeildDate.text;
    taskModel.TASK_ID=taskModel.NAME.uppercaseString;
    if([[DatabaseManager sharedManager]insertIntoDatabase:taskModel])
    {
//      [self alertWithMsg:@"Successfully Added"];
        NSLog(@"Task added Successfully");
        [self.navigationController popViewControllerAnimated:YES];

            }
    else
    {
        [self alertWithMsg:@"Failed to Add"];
        NSLog(@" failed to add");
    }
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (IBAction)buttonAddTapped:(id)sender {
    NSString * string =sender;
    [self insert:string];
    
    
    
    
}
-(void)alertWithMsg :(NSString *)message
{
UIAlertController *alert =[UIAlertController alertControllerWithTitle:@"TASK ADDED" message:message preferredStyle:UIAlertControllerStyleAlert];
UIAlertAction *OK =[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    //        [self insert:string];
    [self.navigationController popViewControllerAnimated:YES];

    
    [alert dismissViewControllerAnimated:YES completion:nil];
}];
[alert addAction:OK];
[self presentViewController:alert animated:NO completion:nil];
}
@end
