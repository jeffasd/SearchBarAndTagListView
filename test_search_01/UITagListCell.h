//
//  UITagListCell.h
//  test_search_01
//
//  Created by jeffasd on 16/7/16.
//  Copyright © 2016年 jeffasd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITagListCell : UITableViewCell

+ (CGFloat)cellHeight;

- (void)addTag:(NSString *)tagStr;
@property (nonatomic, strong) NSMutableArray        *array;

@end
