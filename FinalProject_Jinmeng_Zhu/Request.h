//
//  Request.h
//  FinalModel
//
//  Created by 朱金孟 on 4/28/15.
//  Copyright (c) 2015 JINMENG_ZHU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Book.h"
@interface Request : NSObject<NSCoding>

@property(strong, nonatomic) User * sendUser;
@property(strong, nonatomic) User * receiveUser;
@property(strong, nonatomic) Book *forBook;
@property(strong, nonatomic) NSString *comment;
@property(strong, nonatomic) NSString *approve;
@property(strong, nonatomic) NSString *watch;

-(id)initWithCoder:(NSCoder *)decoder;
-(void)encodeWithCoder:(NSCoder *)encoder;
@end
