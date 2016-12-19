//
//  GDMiddleTabSwitchView.h
//  GoodsDetailDemo
//
//  Created by 恺撒 on 2016/12/15.
//  Copyright © 2016年 God Is A Girl. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 *  中间的tab切换子view
 */

@protocol GDMiddleTabSwitchViewDelegate <NSObject>

- (void)tabSwitchViewDidSelectIndex:(NSInteger)index;

@end

@interface GDMiddleTabSwitchView : UIView

@property (nonatomic, assign) NSInteger currentSelectIndex;

@property (nonatomic, weak) id<GDMiddleTabSwitchViewDelegate>delegate;

- (void)getDataSourceTitlesArray:(NSArray *)titlesArray;

@end
