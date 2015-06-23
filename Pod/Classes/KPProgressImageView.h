//
//  KPProgressImageView.h
//  Pods
//
//  Created by MacOs on 22.06.2015.
//
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    KPProgressDirectionTopToBottom,
    KPProgressDirectionBottomToTop,
    KPProgressDirectionLeftToRight,
    KPProgressDirectionRightToLeft,
} KPProgressDirection;

@interface KPProgressImageView : UIImageView
/**
 Color used to tint part of image wich shows progress
 */
@property (nonatomic, strong) UIColor* progressTintColor;

/**
 Value 0.f-1.f, describes percentage of progress
 */
@property (nonatomic) CGFloat progressPercent;

/**
 Enum property based on wich direction of progress tint is drawn.  By default KPProgressDirectionBottomToTop
 */
@property (nonatomic) KPProgressDirection progressDirection;
@end
