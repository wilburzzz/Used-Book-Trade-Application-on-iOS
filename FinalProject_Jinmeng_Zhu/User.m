//
//  User.m
//  FinalModel
//
//  Created by 朱金孟 on 4/28/15.
//  Copyright (c) 2015 JINMENG_ZHU. All rights reserved.
//

#import "User.h"

@implementation User

- (User *) init;
{
    _sellList = [[SellCategory alloc]init];
    _purchaseList = [[PurchaseCategory alloc]init];
    _sendList = [[SendRequestCategory alloc]init];
    _receiveList = [[ReceiveRequestCategory alloc]init];
    return [super init];
}

-(void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.password forKey:@"password"];
    [encoder encodeObject:self.telephoneNumber forKey:@"telephoneNumber"];
    [encoder encodeObject:self.email forKey:@"email"];
    [encoder encodeObject:self.region forKey:@"region"];
    [encoder encodeObject:self.photo forKey:@"photo"];
    [encoder encodeObject:self.sellList forKey:@"sellList"];
    [encoder encodeObject:self.purchaseList forKey:@"purchaseList"];
    [encoder encodeObject:self.sendList forKey:@"sendList"];
    [encoder encodeObject:self.receiveList forKey:@"receiveList"];
}

-(id)initWithCoder:(NSCoder *)decoder{
    self = [super init];
    if (!self) {
        return nil;
    }
    self.name = [decoder decodeObjectForKey:@"name"];
    self.password = [decoder decodeObjectForKey:@"password"];
    self.telephoneNumber = [decoder decodeObjectForKey:@"telephoneNumber"];
    self.email = [decoder decodeObjectForKey:@"email"];
    self.region = [decoder decodeObjectForKey:@"region"];
    self.photo = [decoder decodeObjectForKey:@"photo"];
    self.sellList = [decoder decodeObjectForKey:@"sellList"];
    self.purchaseList = [decoder decodeObjectForKey:@"purchaseList"];
    self.sendList = [decoder decodeObjectForKey:@"sendList"];
    self.receiveList = [decoder decodeObjectForKey:@"receiveList"];
    
    
    return self;
}


@end
