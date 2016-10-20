//
//  UserCategory.m
//  FinalModel
//
//  Created by 朱金孟 on 4/28/15.
//  Copyright (c) 2015 JINMENG_ZHU. All rights reserved.
//

#import "UserCategory.h"

@implementation UserCategory

- (UserCategory *)init;
{
    _users = [[NSMutableArray alloc] init];
    return [super init];
}

-(id)initWithCoder:(NSCoder *)decoder {
    
    self=[super init];
    if (!self) {
       
        return nil;
    }
    self.users = [decoder decodeObjectForKey:@"users"];
    return self;
    
}



-(void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.users forKey:@"users"];
    
}

@end
