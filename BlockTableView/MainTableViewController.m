//
//  MainTableViewController.m
//  BlockTableView
//
//  Created by andong on 16/4/26.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import "MainTableViewController.h"
#import "ADTableView.h"
#import "ADTabelInfo.h"
@interface MainTableViewController ()

@property (strong, nonatomic) ADTableView *mytableView;

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self layoutUI];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)layoutUI
{
    ADTabelInfo *info = [[ADTabelInfo alloc]init];
    info.title = @"hahaha";
    info.dataInfo = @"2016.8.12";
    
    NSMutableArray *array = [NSMutableArray arrayWithObjects:info,info,info, nil];
    
    _mytableView = [[ADTableView alloc]initWithGlobalInfoArray:array WithFrame:self.view.frame WithTableViewCellConfigureBlock:^(ADTableViewCell *cell, ADTabelInfo *tableCellInfo) {
        
    } WithDidSelectIndexPathBlock:^(NSIndexPath *index, ADTabelInfo *tableCellInfo) {
        
    } WithDidModifyIndexPahtBlock:^(NSIndexPath *index, ADTabelInfo *tableCellInfo) {
        
    } WithDidDeleteIndexPahtBlock:^(NSIndexPath *index, ADTabelInfo *tableCellInfo) {
        
    } WithDidSelectCellButtonBlock:^(ADTableViewCell *cell) {
        
    }];
    
    [self.view addSubview:_mytableView];
    
}





@end
