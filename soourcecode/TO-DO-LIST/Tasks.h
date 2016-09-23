//
//  Tasks.h
//  TO-DO-LIST
//
//  Created by Student P_08 on 18/09/16.
//  Copyright © 2016 AkshayAwtade. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tasks : NSObject
{
    
    Tasks *taskModel;
}
@property(nonatomic,weak) NSString *NAME;
@property(nonatomic) int ID;
@property(nonatomic,weak) NSString *DESCRIPTION;
@property(nonatomic,weak) NSString *DATE;
@property(nonatomic,weak) NSString *TASK_ID;
//@property(nonatomic,weak) NSString *TASK_ID;

-(instancetype) initWithid : (int) idFromDatabase Name: (NSString *) nameOfString description:(NSString *) description date :(NSString *) date task_id :(NSString *) task_id ;

@end
