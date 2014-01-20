//
//  UIImage+Fit.m
//  Qzone
//
//  Created by wangyipu on 14-1-20.
//  Copyright (c) 2014年 stone. All rights reserved.
//

#import "UIImage+Fit.h"

@implementation UIImage (Fit)

+ (UIImage *)resizeImage:(NSString *)imgName
{
    return  [[UIImage imageNamed:imgName] resizeImage];
}

- (UIImage *)resizeImage
{
    CGFloat leftCap = self.size.width * 0.5f;
    CGFloat topCap = self.size.height * 0.5f;
    return [self stretchableImageWithLeftCapWidth:leftCap topCapHeight:topCap];
}

@end
