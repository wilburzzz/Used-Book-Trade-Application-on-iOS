//
//  Request.m
//  FinalModel
//
//  Created by 朱金孟 on 4/28/15.
//  Copyright (c) 2015 JINMENG_ZHU. All rights reserved.
//

#import "Request.h"

@implementation Request

- (Request *) init;
{
    
    self.watch = @"unchecked";
    self.approve = @"unapproved";
    return [super init];
}

-(void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.sendUser forKey:@"sendUser"];
    [encoder encodeObject:self.receiveUser forKey:@"receiveUser"];
    [encoder encodeObject:self.comment forKey:@"comment"];
    [encoder encodeObject:self.approve forKey:@"approve"];
    [encoder encodeObject:self.watch forKey:@"watch"];
    [encoder encodeObject:self.forBook forKey:@"forBook"];
}

-(id)initWithCoder:(NSCoder *)decoder{
    self = [super init];
    if (!self) {
        return nil;
    }
    self.sendUser = [decoder decodeObjectForKey:@"sendUser"];
    self.receiveUser = [decoder decodeObjectForKey:@"receiveUser"];
    self.comment = [decoder decodeObjectForKey:@"comment"];
    self.approve = [decoder decodeObjectForKey:@"approve"];
    self.watch = [decoder decodeObjectForKey:@"watch"];
    self.forBook = [decoder decodeObjectForKey:@"forBook"];

    return self;
}

@end
