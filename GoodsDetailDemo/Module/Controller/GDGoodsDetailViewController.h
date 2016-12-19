//
//  GDGoodsDetailViewController.h
//  GoodsDetailDemo
//
//  Created by 恺撒 on 2016/12/13.
//  Copyright © 2016年 God Is A Girl. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 *  为了优雅的实现美丽说App商品详情页的效果
 *  第一步，拆分成5个独立子view
 *  第二步，进行合理的组装
 */

/*
 // 将下面的融合进上面的试一下
 *  第一种方式有一个硬伤：上面滑动不能很好的传到下层
 *  第二种方式仍然有一个硬伤：允许scrollview滚动时很难同步不同tab对应tableview的偏移量
 // 将上面的融合进下面的试一下
 *  貌似完美解决，666
 *  因为使用了一个系统的UIReplicantContentView类型view，所以最好用真机体验
 */

/*
 * ToDo: 
 * 1 数量及位置可配置
 * 2 默认显示tab控制
 * 3 现在布局全是计算frame，稍后或改成masonry
 * 5 数据传递，模型绑定
 * 6 得到数据再初始化子控件
 * 7 对collectionview的支持不够
 */

@interface GDGoodsDetailViewController : UIViewController

@end
