//
//  LogRecord.h
//  SKLPortal
//
//  Created by bqzhu on 13-7-1.
//  Copyright (c) 2013年 Pactera. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface LogRecord : NSManagedObject

@property (nonatomic, strong) NSString * svcType;
@property (nonatomic, strong) NSString * svcToken;
@property (nonatomic, strong) NSString * reqIP;
@property (nonatomic, strong) NSDate * reqDateTime;
@property (nonatomic, strong) NSString * sid;
@property (nonatomic, strong) NSString * tcode;
@property (nonatomic, strong) NSString * ver;
@property (nonatomic, strong) NSNumber * connstatus;
@property (nonatomic, strong) NSString * dataList;

@end