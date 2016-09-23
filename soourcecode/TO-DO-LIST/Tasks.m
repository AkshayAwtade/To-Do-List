//
//  Tasks.m
//  TO-DO-LIST
//
//  Created by Student P_08 on 18/09/16.
//  Copyright © 2016 AkshayAwtade. All rights reserved.
//

#import "Tasks.h"

@implementation Tasks
- (instancetype)init
{
    self = [super init];
    
    if (self) {
        taskModel.ID=0;
        taskModel.NAME=@"";
        taskModel.DESCRIPTION=@"";
        taskModel.DATE=@"";
        taskModel.TASK_ID=@"";
    }
    return self;
}


-(instancetype)initWithid:(int)idFromDatabase Name:(NSString *)nameOfString description:(NSString *)description date:(NSString *)date task_id:(NSString *)task_id
{
    
    taskModel=[[Tasks alloc]init];
    taskModel.ID =idFromDatabase;
    taskModel.NAME=nameOfString;
    taskModel.DESCRIPTION=description;
    taskModel.DATE=date;
    taskModel.TASK_ID=task_id;
    return taskModel;
}


@end
