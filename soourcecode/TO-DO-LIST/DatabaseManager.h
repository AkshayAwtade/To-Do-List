//
//  DatabaseManager.h
//  TO-DO-LIST
//
//  Created by Student P_08 on 18/09/16.
//  Copyright © 2016 AkshayAwtade. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tasks.h"
#import "sqlite3.h"

@interface DatabaseManager : NSObject
{
    sqlite3 *myDatabase;
}
+(instancetype) sharedManager;
-(NSString *)getPathFromDirectory;
-(void)copyDatabaseToSandbox;
-(BOOL)executeQuery:(NSString *)query;
-(NSMutableArray *)executeSelectQuery:(NSString *)query;

-(BOOL)insertIntoDatabase:(Tasks *) taskModel;
-(BOOL)updatetoDatabase:(Tasks *) taskModel;
-(BOOL)deleteFromDatabase:(Tasks *) taskModel;
@end
