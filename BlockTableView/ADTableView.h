//
//  ADTableView.h
//  BlockTableView
//
//  Created by andong on 16/4/26.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ADTableViewCell,ADTabelInfo;

typedef void(^TableViewCellConfigureBlock)(ADTableViewCell *cell,ADTabelInfo *tableCellInfo);
typedef void(^DidSelectIndexPathBlock)(NSIndexPath *index,ADTabelInfo *tableCellInfo);
typedef void(^DidModifyIndexPahtBlock)(NSIndexPath *index,ADTabelInfo *tableCellInfo);
typedef void(^DidDeleteIndexPahtBlock)(NSIndexPath *index,ADTabelInfo *tableCellInfo);
typedef void(^DidSelectCellButtonBlock)(ADTableViewCell *cell);

@interface ADTableView : UITableView <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)NSMutableArray *infoArray;
@property (nonatomic,copy)TableViewCellConfigureBlock cellConfigureBlock;
@property (nonatomic,copy)DidSelectIndexPathBlock didselectBlock;
@property (nonatomic,copy)DidModifyIndexPahtBlock didModifyBlock;
@property (nonatomic,copy)DidDeleteIndexPahtBlock didDeleteBlock;
@property (nonatomic,copy)DidSelectCellButtonBlock didSelectCellButtonBlock;

-(instancetype)initWithGlobalInfoArray:(NSMutableArray *)mArrGlobalInfo
                             WithFrame:(CGRect)frame
       WithTableViewCellConfigureBlock:(TableViewCellConfigureBlock)ConfigureBlock
           WithDidSelectIndexPathBlock:(DidSelectIndexPathBlock)didselectBlock
           WithDidModifyIndexPahtBlock:(DidModifyIndexPahtBlock)didModifyBlock
           WithDidDeleteIndexPahtBlock:(DidDeleteIndexPahtBlock)didDeleteBlock
          WithDidSelectCellButtonBlock:(DidSelectCellButtonBlock)didSelectCellButtonBlock;

@end
