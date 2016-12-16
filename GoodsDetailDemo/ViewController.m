//
//  ViewController.m
//  GoodsDetailDemo
//
//  Created by 恺撒 on 2016/12/13.
//  Copyright © 2016年 God Is A Girl. All rights reserved.
//

#import "ViewController.h"
#import "GDGoodsDetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)onGoBtnTapped:(id)sender {
    
    GDGoodsDetailViewController *goodsDetailVC = [[GDGoodsDetailViewController alloc] initWithNibName:@"GDGoodsDetailViewController" bundle:nil];
    [self.navigationController pushViewController:goodsDetailVC animated:YES];
    
}

@end
