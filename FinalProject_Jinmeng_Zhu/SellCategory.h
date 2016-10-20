//
//  SellCategory.h
//  FinalModel
//
//  Created by 朱金孟 on 4/30/15.
//  Copyright (c) 2015 JINMENG_ZHU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SellCategory : NSObject<NSCoding>

@property(strong, nonatomic) NSMutableArray* sellList;

-(id)initWithCoder:(NSCoder *)decoder;
-(void)encodeWithCoder:(NSCoder *)encoder;
@end
