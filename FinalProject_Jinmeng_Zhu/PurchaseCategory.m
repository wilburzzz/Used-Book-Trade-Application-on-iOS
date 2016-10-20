//
//  PurchaseCategory.m
//  FinalModel
//
//  Created by 朱金孟 on 4/30/15.
//  Copyright (c) 2015 JINMENG_ZHU. All rights reserved.
//

#import "PurchaseCategory.h"

@implementation PurchaseCategory

- (PurchaseCategory *) init;
{
    _purchaseList = [[NSMutableArray alloc]init];
    return [super init];
}

-(id)initWithCoder:(NSCoder *)decoder {
    
    self=[super init];
    if (!self) {
        
        return nil;
    }
    self.purchaseList = [decoder decodeObjectForKey:@"purchaseList"];
    return self;
    
}



-(void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.purchaseList forKey:@"purchaseList"];
    
}
@end
