//
//  Product.m
//  SKLMAgent
//
//  Created by bqzhu on 12-9-13.
//  Copyright (c) 2012年 bqzhu. All rights reserved.
//

#import "Product.h"


@implementation Product
@synthesize product_id;
@synthesize category_id;
@synthesize product_name;
@synthesize description;
@synthesize product_type;
@synthesize status;
@synthesize download_url;
@synthesize product_size;
@synthesize keywords;
@synthesize Offline_expire_flag;
@synthesize file_path;
@synthesize pic_path;
@synthesize on_shelf_date;
@synthesize off_shelf_date;
@synthesize download_start_dttm;
@synthesize download_end_dttm;
@synthesize favorite_times;
@synthesize download_times;
@synthesize allow_email;

@synthesize cover_url;
@synthesize update_user;
@synthesize update_dttm;
@synthesize version;
@synthesize version_cover;

@synthesize local_favorite_flag;
@synthesize local_favorite_dttm;

@synthesize download_times_weak;
@synthesize download_times_month;
@synthesize download_times_season;


//-(id) init
//{
//    return self;
//};
//
//
//-(void) dealloc
//{
//	[product_id release], product_id = nil;
//	[category_id release], category_id = nil;
//	[product_name release], product_name = nil;
//	[description release], description = nil;
//	[product_type release], product_type = nil;
//	[status release], status = nil;
//	[download_url release], download_url = nil;
//	[product_size release], product_size = nil;
//	[keywords release], keywords = nil;
//	[Offline_expire_flag release], Offline_expire_flag = nil;
//	[file_path release], file_path = nil;
//	[pic_path release], pic_path = nil;
//	[on_shelf_date release], on_shelf_date = nil;
//	[off_shelf_date release], off_shelf_date = nil;
//	[download_start_dttm release], download_start_dttm = nil;
//	[download_end_dttm release], download_end_dttm = nil;
//	[favorite_times release], favorite_times = nil;
//	[download_times release], download_times = nil;
//	[allow_email release], allow_email = nil;
//	[cover_url release], cover_url = nil;
//	[update_user release], update_user = nil;
//	[update_dttm release], update_dttm = nil;
//	[version release], version = nil;
//	[local_favorite_flag release], version = nil;
//	[local_favorite_dttm release], local_favorite_dttm = nil;
//    
//	[super dealloc];
//}
@end
