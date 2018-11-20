//
//  MenuButtonView.m
//  ChMedicineProject
//
//  Created by 李少锋 on 2018/10/30.
//  Copyright © 2018年 zh. All rights reserved.
//

#import "MenuButtonView.h"

#define kWindow [[UIApplication sharedApplication] keyWindow]

@interface MenuButtonView ()

@end

@implementation MenuButtonView

+ (instancetype)standardMenuView{
    static MenuButtonView *instanceMenuView=nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instanceMenuView = [[self alloc] init];
    });
    return instanceMenuView;
}

- (NSArray *)creatPointArrayWithNumber:(NSInteger)number point:(CGPoint)point r:(CGFloat)r {
    NSMutableArray *array = [NSMutableArray array];
    CGFloat f = M_PI_2/(number-1.7);
    for (int i = 0; i < number; i ++) {
        CGFloat y = r * cos(f * i);
        CGFloat x = r * sin(f * i);
        CGPoint newPoint = CGPointMake(point.x - x, point.y - y+20);
        NSString *pointStr = NSStringFromCGPoint(newPoint);
        [array addObject:pointStr];
    }
    return array;
}

- (void)showItems{
    CGPoint center = self.centerPoint;
    CGFloat r = 180;
    NSArray *pointArr=[self creatPointArrayWithNumber:4 point:center r:r];
    NSMutableArray *titleArray=[[NSMutableArray alloc]initWithObjects:@"优品",@"电子书",@"积分商城",@"音视频课程",nil];
    NSMutableArray *imagesNameArray=[[NSMutableArray alloc]initWithObjects:@"icon_menu_general",@"icon_menu_leave",@"icon_menu_reim",@"icon_menu_overtime",nil];
    NSMutableArray *colorsArray=[[NSMutableArray alloc]initWithObjects:[UIColor colorWithRed:93/255.0 green:198/255.0 blue:78/255.0 alpha:1.0],[UIColor colorWithRed:242/255.0 green:104/255.0 blue:90/255.0 alpha:1.0],[UIColor colorWithRed:93/255.0 green:198/255.0 blue:78/255.0 alpha:1.0],[UIColor colorWithRed:198/255.0 green:111/255.0 blue:221/255.0 alpha:1.0],nil];
    
    for(int i=0;i<titleArray.count;i++){
        MenuButton *menu = [MenuButton buttonWithTitle:titleArray[i] imageTitle:imagesNameArray[i] center:center color:colorsArray[i]];
        menu.tag = i+100;
        menu.alpha=0;
        [menu addTarget:self action:@selector(_addExamApprovel:) forControlEvents:UIControlEventTouchUpInside];
        [kWindow addSubview:menu];
    }
    
    [UIView animateWithDuration:0.3 animations:^{
        for(int i=0;i<pointArr.count;i++){
            UIView *view=[kWindow viewWithTag:i+100];
            if([view isKindOfClass:[MenuButton class]]){
                view.alpha=1;
                CGPoint point=CGPointFromString(pointArr[i]);
                view.center=point;
            }
        }
    }];
}

- (void)dismiss{
    [UIView animateWithDuration:0.3 animations:^{
        for(UIView *view in kWindow.subviews){
            if([view isKindOfClass:[MenuButton class]]){
                view.center=self.centerPoint;
                view.alpha=0;
            }
        }
    } completion:^(BOOL finished) {
        for(UIView *view in kWindow.subviews){
            if([view isKindOfClass:[MenuButton class]]){
                [view removeFromSuperview];
            }
        }
    }];
}

- (void)_addExamApprovel:(UIButton *)sender{
    if (self.clickAddButton) {
        self.clickAddButton(sender.tag-100);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
