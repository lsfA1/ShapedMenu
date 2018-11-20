# ShapedMenu
### 初始化
* MenuButtonView *menuView =[MenuButtonView standardMenuView];
   * menuView.centerPoint = shopMallBtn.center;
   * __weak typeof(self) weakSelf = self;
   * menuView.clickAddButton = ^(NSInteger tag){
       *weakSelf.iSShowMenuButton = YES;
       *[weakSelf clickAddButton:shopMallBtn];
       *[self goVC:tag];
   * };
   * _menuView = menuView;
   
### 通过以下方法得到每个按钮的point
* - (NSArray *)creatPointArrayWithNumber:(NSInteger)number point:(CGPoint)point r:(CGFloat)r {
   * NSMutableArray *array = [NSMutableArray array];
   * CGFloat f = M_PI_2/(number-1.7);
   * for (int i = 0; i < number; i ++) {
    **    CGFloat y = r * cos(f * i);
     *   CGFloat x = r * sin(f * i);
     *   CGPoint newPoint = CGPointMake(point.x - x, point.y - y+20);
     *   NSString *pointStr = NSStringFromCGPoint(newPoint);
     *   [array addObject:pointStr];
  *  }
  *  return array;
* }

![image](https://github.com/lsfA1/ShapedMenu/raw/master/ShapedMenu/img/01.png)
