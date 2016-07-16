//
//  ViewController.m
//  test_search_01
//
//  Created by jeffasd on 16/7/13.
//  Copyright © 2016年 jeffasd. All rights reserved.
//

#import "ViewController.h"
#import "UITopicTagViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    

}
- (IBAction)btnAction:(UIButton *)sender {
    
    UITopicTagViewController *topicVC = [UITopicTagViewController new];
    
    //    [self presentViewController:topicVC animated:YES completion:nil];
    
    [self.navigationController pushViewController:topicVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
