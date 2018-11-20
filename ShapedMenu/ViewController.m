//
//  ViewController.m
//  ShapedMenu
//
//  Created by 李少锋 on 2018/11/20.
//  Copyright © 2018年 李少锋. All rights reserved.
//

#import "ViewController.h"
#import "MenuButtonView.h"

@interface ViewController ()

@property(nonatomic,assign)BOOL iSShowMenuButton;
@property (nonatomic,strong) UIView *alphaView;
@property(nonatomic,strong)MenuButtonView *menuView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *shopMallBtn =[[UIButton alloc]init];
    shopMallBtn.frame=CGRectMake([UIScreen mainScreen].bounds.size.width-100, [UIScreen mainScreen].bounds.size.height-200, 80, 80);
    [shopMallBtn setImage:[UIImage imageNamed:@"ShopMallMenu"] forState:UIControlStateNormal];
    [shopMallBtn addTarget:self action:@selector(clickAddButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:shopMallBtn];
    
    MenuButtonView *menuView =[MenuButtonView standardMenuView];
    menuView.centerPoint = shopMallBtn.center;
    __weak typeof(self) weakSelf = self;
    menuView.clickAddButton = ^(NSInteger tag){
        weakSelf.iSShowMenuButton = YES;
        [weakSelf clickAddButton:shopMallBtn];
        [self goVC:tag];
    };
    _menuView = menuView;
}

- (void)clickAddButton:(UIButton *)sender{
    
    if (!_iSShowMenuButton) {
        _alphaView.hidden=NO;
        [_menuView showItems];
    }else{
        _alphaView.hidden=YES;
        [_menuView dismiss];
    }
    _iSShowMenuButton = !_iSShowMenuButton;
}

-(void)goVC:(NSInteger)index{
    NSLog(@"%zd",index);
}


@end
