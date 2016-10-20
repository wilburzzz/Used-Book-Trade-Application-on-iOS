//
//  User.h
//  FinalModel
//
//  Created by 朱金孟 on 4/28/15.
//  Copyright (c) 2015 JINMENG_ZHU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SellCategory.h"
#import "PurchaseCategory.h"
#import "SendRequestCategory.h"
#import "ReceiveRequestCategory.h"
@interface User : NSObject<NSCoding>

@property(strong, nonatomic) NSString *name;
@property(strong, nonatomic) NSString *password;
@property (strong) NSNumber* telephoneNumber;
@property (strong) NSString* email;
@property (strong) NSString* region;
@property (strong) UIImage *photo;

@property(strong) SellCategory *sellList;
@property(strong) PurchaseCategory *purchaseList;
@property(strong) SendRequestCategory * sendList;
@property(strong) ReceiveRequestCategory *receiveList;

-(id)initWithCoder:(NSCoder*)decoder;
-(void)encodeWithCoder:(NSCoder*)encoder;
@end
