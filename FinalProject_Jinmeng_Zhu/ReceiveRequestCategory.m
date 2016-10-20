//
//  ReceiveRequestCategory.m
//  FinalModel
//
//  Created by 朱金孟 on 4/30/15.
//  Copyright (c) 2015 JINMENG_ZHU. All rights reserved.
//

#import "ReceiveRequestCategory.h"

@implementation ReceiveRequestCategory

- (ReceiveRequestCategory *) init;
{
    _receiveList = [[NSMutableArray alloc]init];
    return [super init];
}

-(id)initWithCoder:(NSCoder *)decoder {
    
    self=[super init];
    if (!self) {
        
        return nil;
    }
    self.receiveList = [decoder decodeObjectForKey:@"receiveList"];
    return self;
    
}



-(void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.receiveList forKey:@"receiveList"];
    
}

@end
