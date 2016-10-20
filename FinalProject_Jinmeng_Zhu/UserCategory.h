//
//  UserCategory.h
//  FinalModel
//
//  Created by 朱金孟 on 4/28/15.
//  Copyright (c) 2015 JINMENG_ZHU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserCategory : NSObject<NSCoding>

@property(strong, nonatomic) NSMutableArray *users;

-(id)initWithCoder:(NSCoder *)decoder;
-(void)encodeWithCoder:(NSCoder *)encoder;
@end
