//
//  MenuButton.h
//  ChMedicineProject
//
//  Created by 李少锋 on 2018/10/30.
//  Copyright © 2018年 zh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MenuButton : UIButton

+ (instancetype)buttonWithTitle:(NSString *)title imageTitle:(NSString *)imageTitle center:(CGPoint)point color:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
