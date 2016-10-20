//
//  SendRequestCategory.m
//  FinalModel
//
//  Created by 朱金孟 on 4/30/15.
//  Copyright (c) 2015 JINMENG_ZHU. All rights reserved.
//

#import "SendRequestCategory.h"

@implementation SendRequestCategory

- (SendRequestCategory *) init;
{
    _sendList = [[NSMutableArray alloc]init];
    return [super init];
}


-(id)initWithCoder:(NSCoder *)decoder {
    
    self=[super init];
    if (!self) {
        
        return nil;
    }
    self.sendList = [decoder decodeObjectForKey:@"sendList"];
    return self;
    
}



-(void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.sendList forKey:@"sendList"];
    
}

@end
