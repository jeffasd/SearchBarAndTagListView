//
//  UITopicTagViewController.m
//  test_search_01
//
//  Created by jeffasd on 16/7/13.
//  Copyright © 2016年 jeffasd. All rights reserved.
//

#import "UITopicTagViewController.h"
#import "UITagListCell.h"

static NSString *const CELL_ID = @"cell_id";

@interface UITopicTagViewController () <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, strong) UISearchBar *searchBar;

@property (nonatomic, strong) NSMutableArray        *array;

@end

@implementation UITopicTagViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    self.title = @"请输入话题";
    
    self.view.backgroundColor = [UIColor cyanColor];
    
    [self initUI];
    
    _array = [[NSMutableArray alloc] initWithObjects:@"Foo",
              @"Tag Label 1",
              @"Tag Label 2",
              @"Tag Label 3",
              @"Tag Label 4",
              @"Long long long long long long Tag", nil];
}

- (UISearchBar *)searchBar{
    if (_searchBar == nil) {
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 0, 44)];
        _searchBar.delegate = self;
        
//        _searchBar.barTintColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:241/255.0 alpha:1.0];
        
        _searchBar.barTintColor = [UIColor cyanColor];
        _searchBar.layer.borderWidth = 0;
        
        
        _searchBar.barStyle = UIBarStyleBlackTranslucent;
        _searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
        _searchBar.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _searchBar.keyboardType =  UIKeyboardTypeDefault;
        _searchBar.returnKeyType = UIReturnKeyDone;
        
        _searchBar.showsCancelButton = NO;
//        _searchBar.showsBookmarkButton = YES;
        _searchBar.showsSearchResultsButton = NO;
//        _searchBar.barStyle= UISearchBarStyleDefault;
        _searchBar.barStyle= UISearchBarStyleProminent;
//        _searchBar.barStyle= UISearchBarStyleDefault;
        _searchBar.placeholder=@"请输入话题";
        _searchBar.keyboardType=UIKeyboardTypeNamePhonePad;
        
//        _searchBar.backgroundImage = [UIImage new];
        
//        [ _searchBar setBackgroundColor :[ UIColor lightGrayColor ]];
        
        NSLog(@"the serahbar is %@", [[[ _searchBar . subviews objectAtIndex : 0 ] subviews ] objectAtIndex : 0 ]);
        
        //去掉UISearchBar的那个灰色背景框
        float version = [[[UIDevice currentDevice] systemVersion] floatValue];
        if ([_searchBar respondsToSelector:@selector(barTintColor)]) {
            
            float iosversion7_1 = 7.1;
            
            if (version >= iosversion7_1){
                [[[[_searchBar.subviews objectAtIndex:0] subviews] objectAtIndex:0] removeFromSuperview];
                [_searchBar setBackgroundColor:[UIColor clearColor]];
            }
            else {            //iOS7.0
                
                [_searchBar setBarTintColor:[UIColor clearColor]];
                [_searchBar setBackgroundColor:[UIColor clearColor]];
            }
        }
        else {
            //iOS7.0以下
            [[_searchBar.subviews objectAtIndex:0] removeFromSuperview];
            [_searchBar setBackgroundColor:[UIColor clearColor]];
            
        }
//
    }
    return _searchBar;
}

- (void)initUI{
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITagListCell class] forCellReuseIdentifier:CELL_ID];
    
//    [[UITableViewCell alloc] initWithStyle:<#(UITableViewCellStyle)#> reuseIdentifier:<#(nullable NSString *)#>];
    
    [self.view addSubview:tableView];
    
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    tableView.tableHeaderView = self.searchBar;
    
    tableView.tableFooterView = [UIView new];
    
//    tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    
    self.tableView = tableView;
    
//    NSArray *arr = @[@"sdf", @"sdf"];
    
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
//    return @"sdfsf";
    
    if (section == 0) {
        return @"推荐话题";
    }else if (section == 1){
        return @"常用话题";
    }
    
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    return 44;
    
    return [UITagListCell cellHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITagListCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID forIndexPath:indexPath];
    
    NSString *name = [NSString stringWithFormat:@"the index is %ld", (long)indexPath.row];
    
    cell.textLabel.text = name;
    
    cell.array = _array;
    
    return cell;
}


//- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar                     // return NO to not become first responder
//{
//    return YES;
//}
//
//- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar                     // called when text starts editing
//{
//
//}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar                        // return NO to not resign first responder
{
    return YES;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar                       // called when text ends editing
{
    
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText   // called when text changes (including clear)
{
    NSLog(@"the searchText is %@", searchText);
}
- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text NS_AVAILABLE_IOS(3_0) // called before text changes
{
    return YES;
}
//
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar                     // called when keyboard search button pressed
{
    
    [searchBar resignFirstResponder];
    
    NSLog(@"the searchText is %@", searchBar.text);
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    
//    UITagListCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
//    [cell addTag:searchBar.text];
    
    
    [_array addObject:searchBar.text];
    
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    
}
//- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar __TVOS_PROHIBITED; // called when bookmark button pressed
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar __TVOS_PROHIBITED   // called when cancel button pressed
{
    
}
//- (void)searchBarResultsListButtonClicked:(UISearchBar *)searchBar NS_AVAILABLE_IOS(3_2) __TVOS_PROHIBITED; // called when search results button pressed
//
//- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope NS_AVAILABLE_IOS(3_0);





@end
