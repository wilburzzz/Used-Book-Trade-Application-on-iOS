//
//  Book.m
//  FinalModel
//
//  Created by 朱金孟 on 4/17/15.
//  Copyright (c) 2015 JINMENG_ZHU. All rights reserved.
//

#import "Book.h"

@implementation Book

- (Book *) init;
{
    
    self.sold = @"unsold";
    return [super init];
}


-(void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.bookName forKey:@"bookName"];
    [encoder encodeObject:self.bookAuthor forKey:@"bookAuthor"];
    [encoder encodeObject:self.bookPublisher forKey:@"bookPublisher"];
    [encoder encodeObject:self.sold forKey:@"sold"];
    [encoder encodeObject:self.dateOfNew forKey:@"dateOfNew"];
    [encoder encodeObject:self.dateOfDeal forKey:@"dateOfDeal"];
    [encoder encodeObject:self.amount forKey:@"amount"];
    [encoder encodeObject:self.price forKey:@"price"];
    [encoder encodeObject:self.picture forKey:@"picture"];
    [encoder encodeObject:self.score forKey:@"score"];
    [encoder encodeObject:self.sellerName forKey:@"sellerName"];
}

-(id)initWithCoder:(NSCoder *)decoder{
    self = [super init];
    if (!self) {
        return nil;
    }
    self.bookName = [decoder decodeObjectForKey:@"bookName"];
    self.bookAuthor = [decoder decodeObjectForKey:@"bookAuthor"];
    self.bookPublisher = [decoder decodeObjectForKey:@"bookPublisher"];
    self.sold = [decoder decodeObjectForKey:@"sold"];
    self.dateOfNew = [decoder decodeObjectForKey:@"dateOfNew"];
    self.amount = [decoder decodeObjectForKey:@"amount"];
    self.price = [decoder decodeObjectForKey:@"price"];
    self.picture = [decoder decodeObjectForKey:@"picture"];
    self.dateOfDeal = [decoder decodeObjectForKey:@"dateOfDeal"];
    self.score = [decoder decodeObjectForKey:@"score"];
    self.sellerName = [decoder decodeObjectForKey:@"sellerName"];
    
    
    return self;
}


@end
