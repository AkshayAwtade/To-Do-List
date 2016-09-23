//
//  DatabaseManager.m
//  TO-DO-LIST
//
//  Created by Student P_08 on 18/09/16.
//  Copyright © 2016 AkshayAwtade. All rights reserved.
//

#import "DatabaseManager.h"

@implementation DatabaseManager
+(instancetype) sharedManager
{
    static DatabaseManager *sharedInstance;
    if(sharedInstance==nil)
    {
        sharedInstance=[[DatabaseManager alloc]init];
    }
    return sharedInstance;
}


-(NSString *)getPathFromDirectory
{
    NSArray *pathOfDir=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *pathOfFile=[[pathOfDir objectAtIndex:0]stringByAppendingPathComponent:@"DATABASE.sqlite"];
    NSLog(@"%@",pathOfFile);
    return pathOfFile;
}

-(void) copyDatabaseToSandbox
{
    NSString *sourcePath=[[NSBundle mainBundle]pathForResource:@"DATABASE" ofType:@"sqlite"];
    NSString* destinationpath=[self getPathFromDirectory];
    BOOL isSourcePathExists = [[NSFileManager defaultManager]fileExistsAtPath:sourcePath];
    BOOL isDestinationPathExists =[[NSFileManager defaultManager]fileExistsAtPath:destinationpath];
    NSError *error;
    if(isSourcePathExists)
    {
        if(isDestinationPathExists)
        {
            NSLog(@"Path already Exists");
        }
        else
            [[NSFileManager defaultManager]copyItemAtPath:sourcePath toPath:destinationpath error:&error];
        if(error)
        {
            NSLog(@"error %@",error.localizedDescription);
        }
        
        NSLog(@"Database copied sucessfully to destination path");
    }
}

-(BOOL)executeQuery:(NSString *)query
{
    sqlite3_stmt *statement;
    BOOL state=NO;
    const char *UTFQuery=[query UTF8String];
    const char *UTFDatabasePath =[[self getPathFromDirectory] UTF8String];
    if(sqlite3_open(UTFDatabasePath, &myDatabase)==SQLITE_OK)
    {
        if(sqlite3_prepare_v2(myDatabase, UTFQuery, -1, &statement, NULL)==SQLITE_OK)
        {
           
            if(sqlite3_step(statement)==SQLITE_DONE)
            {
                state=YES;
            }
        }
        sqlite3_close(myDatabase);
    }
    return state;
}

-(NSMutableArray *)executeSelectQuery:(NSString *)query
{
    NSMutableArray *alltasks=[[NSMutableArray alloc]init];
    sqlite3_stmt *statement;
    const char *UTFQuery=[query UTF8String];
    const char *UTFDatabasePath =[[self getPathFromDirectory] UTF8String];
    if(sqlite3_open(UTFDatabasePath, &myDatabase)==SQLITE_OK)
    {
        if(sqlite3_prepare_v2(myDatabase, UTFQuery, -1, &statement, NULL)==SQLITE_OK)
        {
            while(sqlite3_step(statement)==SQLITE_ROW)
            {
                int idFromDatabase =sqlite3_column_bytes(statement, 0);
                const unsigned char *UTFName= sqlite3_column_text(statement, 1);
                const unsigned char *UTFDescription= sqlite3_column_text(statement, 2);
                const unsigned char *UTFDate= sqlite3_column_text(statement, 3);
                const unsigned char *UTFTask_id= sqlite3_column_text(statement,4);
                NSString *name =[NSString stringWithUTF8String:(const char *)UTFName];
                NSString *description =[NSString stringWithUTF8String:(const char *)UTFDescription];
                NSString *date =[NSString stringWithUTF8String:(const char *)UTFDate];
                NSString *taskid =[NSString stringWithUTF8String:(const char *)UTFTask_id];
                Tasks *taskModel =[[Tasks alloc]initWithid:idFromDatabase Name:name description:description date:date task_id:taskid];
                [alltasks addObject:taskModel];
            }
        }
       
    }
    NSMutableArray *arrayForStoring=[NSMutableArray arrayWithArray:alltasks];

    return arrayForStoring;
}

-(BOOL)insertIntoDatabase:(Tasks *) taskModel{
    NSString *insertQuery = [NSString stringWithFormat:@"INSERT INTO DATABASE (NAME,DESCRIPTION,DATE,TASK_ID) VALUES ('%@','%@','%@','%@')",taskModel.NAME,taskModel.DESCRIPTION,taskModel.DATE,taskModel.TASK_ID];
    
    NSLog(@"%@",insertQuery);
    if([[DatabaseManager sharedManager]executeQuery:insertQuery] == YES) {
        
        NSLog(@"Inserted");
        return YES;
    }
    else {
       
        return NO;
    }
    
    
}

-(BOOL)updatetoDatabase:(Tasks *)taskModel
{
//NAME,DESCRIPTION,DATE,TASK_ID
    NSString *updateQuery = [NSString stringWithFormat:@"UPDATE DATABASE SET NAME = '%@', DESCRIPTION = '%@', DATE = '%@' WHERE TASK_ID = '%@'",taskModel.NAME,taskModel.DESCRIPTION,taskModel.DATE,taskModel.TASK_ID];
    
    if ([[DatabaseManager sharedManager]executeQuery:updateQuery]) {
        NSLog(@"%@",updateQuery);
        
        
        return YES;
    }
    else {
        NSLog(@"Failed to update");
        return NO;
        
    }
}

-(BOOL)deleteFromDatabase:(Tasks *)taskModel{
    NSString *deleteQuery=[NSString stringWithFormat:@"DELETE FROM DATABASE WHERE TASK_ID='%@'",taskModel.TASK_ID];
    if([[DatabaseManager sharedManager]executeQuery:deleteQuery])
    {
        
        return YES;
    }
    return NO;
}




@end
