//
//  Update.m
//  TO-DO-LIST
//
//  Created by Student P_08 on 18/09/16.
//  Copyright © 2016 AkshayAwtade. All rights reserved.
//

#import "Update.h"

@interface Update ()

@end

@implementation Update

- (void)viewDidLoad {
    [super viewDidLoad];
    selectedTask=[[Tasks alloc]init];
    
    
    [self initScreen];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) initScreen{
    selectedTask=self.taskSelected;
    self.textfeildName.text=selectedTask.NAME;
    self.textFeildDate.text=selectedTask.DATE;
    self.textfeildDescription.text=selectedTask.DESCRIPTION;
//    self.buttonUpdate.enabled=NO;
    name=selectedTask.NAME;
    description=selectedTask.DESCRIPTION;
    date=selectedTask.DATE;
}



/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    self.buttonUpdate.enabled=YES;
    }

- (IBAction)Updatebutton:(id)sender {
        selectedTask.NAME=self.textfeildName.text;
        NSLog(@"%@",selectedTask.NAME);
        selectedTask.DESCRIPTION=self.textfeildDescription.text;
        NSLog(@"%@",selectedTask.DESCRIPTION);
        selectedTask.DATE=self.textFeildDate.text;
        NSLog(@"%@",selectedTask.DATE);
        selectedTask.TASK_ID=name.uppercaseString;
    if([[DatabaseManager sharedManager]updatetoDatabase:selectedTask])
    {
        [self alertWithMsg:@"Updated sucessfully"];
    }
    else
    {
        [self alertWithMsg:@"failed top update"];
    }
    
    
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