//
//  MenuButton.m
//  ChMedicineProject
//
//  Created by 李少锋 on 2018/10/30.
//  Copyright © 2018年 zh. All rights reserved.
//

#import "MenuButton.h"

@implementation MenuButton

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(23.5, 10, 14, 16);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0,30, self.bounds.size.width, 20);
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state{
    [super setTitle:title forState:state];
    self.titleLabel.font = [UIFont systemFontOfSize:10];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}


- (void)setImage:(UIImage *)image forState:(UIControlState)state{
    [super setImage:image forState:state];
}
+ (instancetype)buttonWithTitle:(NSString *)title imageTitle:(NSString *)imageTitle center:(CGPoint)point color:(UIColor *)color{
    CGRect frame = CGRectMake(0, 0, 60, 60);
    MenuButton *menu4 = [[MenuButton alloc] initWithFrame:frame];
    menu4.center = point;
    menu4.backgroundColor = color;
    menu4.layer.cornerRadius = 60/2.0;
    [menu4 setTitle:title forState:UIControlStateNormal];
    [menu4 setImage:[UIImage imageNamed:imageTitle] forState:UIControlStateNormal];
    return menu4;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
