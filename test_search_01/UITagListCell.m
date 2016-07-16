//
//  UITagListCell.m
//  test_search_01
//
//  Created by jeffasd on 16/7/16.
//  Copyright © 2016年 jeffasd. All rights reserved.
//

#import "UITagListCell.h"
#import "DWTagList.h"

static CGFloat _cellHeight;

#define kTopEdge    30.0

@interface UITagListCell () <DWTagListDelegate>
{
    
    
}

@property (nonatomic, strong) DWTagList *listView;



@end

@implementation UITagListCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        
    }
    
    return self;
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.backgroundColor = [UIColor cyanColor];
        
        [self initUI];
    }
    
    return self;
}

- (void)initUI{
    
    NSLog(@"frame is %@", NSStringFromCGRect(self.frame));
    
    NSLog(@"frame is %@", NSStringFromCGRect([UIScreen mainScreen].bounds));
    
    DWTagList *listView = [DWTagList new];
    listView.frame = CGRectMake(0, kTopEdge, [UIScreen mainScreen].bounds.size.width, 0);
    [self addSubview:listView];
    
    [listView setAutomaticResize:YES];
    
    //    [_tagList setAutomaticResize:NO];
    
    listView.backgroundColor = [UIColor cyanColor];
    
//    _array = [[NSMutableArray alloc] initWithObjects:@"Foo",
//              @"Tag Label 1",
//              @"Tag Label 2",
//              @"Tag Label 3",
//              @"Tag Label 4",
//              @"Long long long long long long Tag", nil];
//    [listView setTags:_array];
    [listView setTagDelegate:self];
    
    self.listView = listView;
    
    _cellHeight = [_listView fittedSize].height;
    
}

- (void)addTag:(NSString *)tagStr{
    
    if ([tagStr length]) {
        [_array addObject:tagStr];
    }

    [_listView setTags:_array];
    
    _cellHeight = [_listView fittedSize].height;
    
    [self layoutIfNeeded];
}


- (void)setArray:(NSMutableArray *)array{
    
    _array = array;
    
    [_listView setTags:_array];
    
    _cellHeight = [_listView fittedSize].height + kTopEdge;
    
    [self layoutIfNeeded];
    
}


+ (CGFloat)cellHeight{
    
    return _cellHeight;
}

- (void)selectedTag:(NSString *)tagName tagIndex:(NSInteger)tagIndex
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message"
                                                    message:[NSString stringWithFormat:@"You tapped tag %@ at index %ld", tagName,(long)tagIndex]
                                                   delegate:nil
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles:nil];
    [alert show];
}

@end
