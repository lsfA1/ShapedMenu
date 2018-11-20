//
//  MenuButtonView.h
//  ChMedicineProject
//
//  Created by 李少锋 on 2018/10/30.
//  Copyright © 2018年 zh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuButton.h"

NS_ASSUME_NONNULL_BEGIN

@interface MenuButtonView : UIView

@property (nonatomic, assign) CGPoint centerPoint;

@property (nonatomic, copy) void (^clickAddButton)(NSInteger index);

- (void)showItems;

- (void)dismiss;

+ (instancetype)standardMenuView;

@end

NS_ASSUME_NONNULL_END
