//
//  ADTableView.m
//  BlockTableView
//
//  Created by andong on 16/4/26.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import "ADTableView.h"
#import "ADTableViewCell.h"
#import "ADTabelInfo.h"

static NSString *const CellNibName = @"ADTableViewCell";

@implementation ADTableView

-(instancetype)initWithGlobalInfoArray:(NSMutableArray *)mArrGlobalInfo
                             WithFrame:(CGRect)frame
       WithTableViewCellConfigureBlock:(TableViewCellConfigureBlock)ConfigureBlock
           WithDidSelectIndexPathBlock:(DidSelectIndexPathBlock)didselectBlock
           WithDidModifyIndexPahtBlock:(DidModifyIndexPahtBlock)didModifyBlock
           WithDidDeleteIndexPahtBlock:(DidDeleteIndexPahtBlock)didDeleteBlock
          WithDidSelectCellButtonBlock:(DidSelectCellButtonBlock)didSelectCellButtonBlock
{
    if (self = [super init]) {
        
        _infoArray                = mArrGlobalInfo;
        self.frame                = frame;
        _cellConfigureBlock       = ConfigureBlock;
        _didDeleteBlock           = didDeleteBlock;
        _didModifyBlock           = didModifyBlock;
        _didselectBlock           = didselectBlock;
        _didSelectCellButtonBlock = didSelectCellButtonBlock;
        
        self.dataSource = self;
        self.delegate   = self;
        
        [self tableViewLayout];
    }
    return self;
}

-(void)tableViewLayout
{
    // 设置边距，解决单元格分割线默认偏移像素过多的问题
    if ([self respondsToSelector:@selector(setSeparatorInset:)]) {
        [self setSeparatorInset:UIEdgeInsetsZero]; // 设置单元格（上左下右）内边距
    }
    if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
        [self setLayoutMargins:UIEdgeInsetsZero]; // 设置单元格（上左下右）外边距
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return 1;
    return _infoArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reuseId = @"ADTableViewCell";
    
    UINib *nib = [UINib nibWithNibName:CellNibName bundle:[NSBundle mainBundle]];
    [tableView registerNib:nib forCellReuseIdentifier:reuseId];
    
    ADTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    
    ADTabelInfo *cellInfo = self.infoArray[indexPath.row];
    cell.cellInfo = cellInfo;
    cell.IconImage.image = [UIImage imageNamed:cellInfo.iconPath];
    cell.titleLab.text = cellInfo.title;
    cell.dataLab.text = cellInfo.dataInfo;
    
    [cell.InfoBtn addTarget:self action:@selector(didSelectCellButton:) forControlEvents:UIControlEventTouchUpInside];
    
    
    //取消默认选中行的颜色
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   _didselectBlock(indexPath,(ADTabelInfo *)_infoArray[indexPath.row]);
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewRowAction *ModifyAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"修改" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        _didModifyBlock(indexPath,(ADTabelInfo *)_infoArray[indexPath.row]);
    }];
    
    UITableViewRowAction *DeleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        _didDeleteBlock(indexPath,(ADTabelInfo *)_infoArray[indexPath.row]);
    }];
    
    return @[ModifyAction,DeleteAction];
}
-(void)didSelectCellButton:(id)sender
{
   ADTableViewCell *cell = (ADTableViewCell *)[sender superview];
   
    _didSelectCellButtonBlock(cell);
}

@end
