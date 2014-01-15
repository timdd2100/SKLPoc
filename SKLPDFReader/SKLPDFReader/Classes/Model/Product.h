//
//  Product.h
//  SKLMAgent
//
//  Created by bqzhu on 12-9-13.
//  Copyright (c) 2012年 bqzhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject{
    NSString *product_id;
    NSString *category_id;
    
    NSString *product_name;
    NSString *description;
    
    NSString *product_type;
    
    NSString *keywords;
    NSString *Offline_expire_flag;
    NSString *allow_email;
    
    NSString *product_size;
    
    
    NSString *on_shelf_date;
    NSString *off_shelf_date;
    
    NSString *favorite_times;
    NSString *download_times;
    
    NSString *download_url;
    NSString *cover_url;//---------
    
    NSString *update_user;//----
    NSString *update_dttm;//----
    NSString *version;//----
    
    NSString *status;
    NSString *file_path;
    NSString *pic_path;
    NSString *download_start_dttm;
    NSString *download_end_dttm;
    
    NSString *local_favorite_flag;
    NSString *local_favorite_dttm;
}

@property (nonatomic, strong) NSString *product_id;
@property (nonatomic, strong) NSString *category_id;

@property (nonatomic, strong) NSString *product_name;
@property (nonatomic, strong) NSString *description;

@property (nonatomic, strong) NSString *product_type;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *download_url;
@property (nonatomic, strong) NSString *product_size;
@property (nonatomic, strong) NSString *keywords;
@property (nonatomic, strong) NSString *Offline_expire_flag;
@property (nonatomic, strong) NSString *file_path;
@property (nonatomic, strong) NSString *pic_path;

@property (nonatomic, strong) NSString *on_shelf_date;
@property (nonatomic, strong) NSString *off_shelf_date;

@property (nonatomic, strong) NSString *download_start_dttm;
@property (nonatomic, strong) NSString *download_end_dttm;
@property (nonatomic, strong) NSString *favorite_times;
@property (nonatomic, strong) NSString *download_times;

@property (nonatomic, strong) NSString *allow_email;

@property (nonatomic, strong) NSString *cover_url;



@property (nonatomic, strong) NSString *update_user;
@property (nonatomic, strong) NSString *update_dttm;
@property (nonatomic, strong) NSString *version;
@property (nonatomic, strong) NSString *version_cover;

@property (nonatomic, strong) NSString *local_favorite_flag;
@property (nonatomic, strong) NSString *local_favorite_dttm;

@property (nonatomic, strong) NSString *download_times_weak;
@property (nonatomic, strong) NSString *download_times_month;
@property (nonatomic, strong) NSString *download_times_season;

@end
