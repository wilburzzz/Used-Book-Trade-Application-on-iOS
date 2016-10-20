//
//  SellCategory.m
//  FinalModel
//
//  Created by 朱金孟 on 4/30/15.
//  Copyright (c) 2015 JINMENG_ZHU. All rights reserved.
//

#import "SellCategory.h"

@implementation SellCategory

- (SellCategory *) init;
{
    _sellList = [[NSMutableArray alloc]init];
    return [super init];
}

-(id)initWithCoder:(NSCoder *)decoder {
    
    self=[super init];
    if (!self) {
        
        return nil;
    }
    self.sellList = [decoder decodeObjectForKey:@"sellList"];
    return self;
    
}



-(void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.sellList forKey:@"sellList"];
    
}
@end
