//
//  KPProgressImageView.h
//  Pods
//
//  Created by MacOs on 22.06.2015.
//
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    KPProgressTopToBottom,
    KPProgressBottomToTop,
    KPProgressLeftToRight,
    KPProgressRightToLeft,
} KPProgressDirection;

@interface KPProgressImageView : UIImageView
@property (nonatomic, strong) UIColor* progressTintColor;
@property (nonatomic) CGFloat progressPercent;
@property (nonatomic) KPProgressDirection progressDirection;
@end
