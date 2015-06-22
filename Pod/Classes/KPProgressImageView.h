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
@property (nonatomic, strong) UIColor* progressTintColor;
@property (nonatomic) CGFloat progressPercent;
@property (nonatomic) KPProgressDirection progressDirection;
@end
