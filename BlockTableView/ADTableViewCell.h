//
//  ADTableViewCell.h
//  BlockTableView
//
//  Created by andong on 16/4/26.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ADTabelInfo;
@interface ADTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *IconImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *dataLab;
@property (weak, nonatomic) IBOutlet UIButton *InfoBtn;

@property (nonatomic,strong)ADTabelInfo *cellInfo;

@end
