//
//  ButtonItemWithTitleImage.h
//  WTSProject
//
//  Created by Charlot on 2017/3/28.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ButtonItemWithTitleImage : UIControl
@property (nonatomic,strong)UIImageView *imageView;
@property (nonatomic,strong)UILabel *label;
- (id)initWithFrame:(CGRect)frame
      WithImageName:(NSString *)imageName
     WithImageWidth:(CGFloat)imgWidth
WithImageHeightPercentInItem:(CGFloat)imgPercent
          WithTitle:(NSString *)title
       WithFontSize:(CGFloat)fontSize
      WithFontColor:(UIColor *)color
            WithGap:(CGFloat)gap;
@end
