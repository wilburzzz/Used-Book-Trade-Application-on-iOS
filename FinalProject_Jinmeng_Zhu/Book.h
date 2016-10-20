//
//  Book.h
//  FinalModel
//
//  Created by 朱金孟 on 4/17/15.
//  Copyright (c) 2015 JINMENG_ZHU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Book : NSObject<NSCoding>

@property(strong, nonatomic) NSString *bookName;
@property(strong, nonatomic) NSString *bookAuthor;
@property(strong, nonatomic) NSString *bookPublisher;
@property(strong, nonatomic) NSString *sold;
@property(strong, nonatomic) NSDate *dateOfNew;
@property(strong, nonatomic) NSDate *dateOfDeal;
@property(strong, nonatomic) NSNumber *amount;
@property(strong, nonatomic) NSNumber *price;
@property(strong, nonatomic) UIImage *picture;
@property(strong, nonatomic) NSNumber *score;
@property(strong, nonatomic) NSString *sellerName;
-(id)initWithCoder:(NSCoder *)decoder;
-(void)encodeWithCoder:(NSCoder *)encoder;
@end
