//
//  KPProgressImageView.m
//  Pods
//
//  Created by MacOs on 22.06.2015.
//
//

#import "KPProgressImageView.h"
#import "UIImage+Trim.h"

@interface KPProgressImageView()
@property (nonatomic) UIEdgeInsets imageContentInsets;
@end
@implementation KPProgressImageView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setup];
}

-(void)setup{
    self.progressPercent = 0.f;
    self.progressDirection = KPProgressDirectionRightToLeft;
}

-(void)setImage:(UIImage *)image{
    [self detectImageContentInsets:image];
    [self setupImage:image];
}

-(void)setProgressPercent:(CGFloat)progressPercent{
    _progressPercent = progressPercent;
    [self setupImage:self.image];
}

-(void)setProgressDirection:(KPProgressDirection)progressDirection{
    _progressDirection = progressDirection;
    [self setupImage:self.image];
}

-(void)detectImageContentInsets:(UIImage *)image{
    self.imageContentInsets = [image transparencyInsetsRequiringFullOpacity:YES];
}

-(void)setupImage:(UIImage *)image{
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0f);
    UIColor* tintColor = self.tintColor;
    [tintColor setFill];
    CGRect fullImageRect = CGRectMake(0.f, 0.f, image.size.width, image.size.height);
    UIRectFill(fullImageRect);
    [self.progressTintColor setFill];
    CGRect progressRect = [self calculateprogressRectForImage:image];
    UIRectFill(progressRect);
    [image drawInRect:fullImageRect blendMode:kCGBlendModeDestinationIn alpha:1.0f];
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [super setImage:tintedImage];
}

-(CGRect)calculateprogressRectForImage:(UIImage *)image{
    
    
    switch (self.progressDirection) {
        case KPProgressDirectionBottomToTop:{
            CGFloat divideLine = (image.size.height - (self.imageContentInsets.top + self.imageContentInsets.bottom))*(1.f-self.progressPercent) + self.imageContentInsets.top;
            return CGRectMake(0.f, divideLine, image.size.width, image.size.height-divideLine);
        }
        case KPProgressDirectionTopToBottom:{
            CGFloat divideLine = (image.size.height - (self.imageContentInsets.top + self.imageContentInsets.bottom))*self.progressPercent + self.imageContentInsets.top;
            return CGRectMake(0.f, 0.f, image.size.width, divideLine);
        }
        case KPProgressDirectionRightToLeft:{
            CGFloat divideLine = (image.size.width - (self.imageContentInsets.right + self.imageContentInsets.left))*(1.f-self.progressPercent) + self.imageContentInsets.left;
            return CGRectMake(divideLine, 0.f, image.size.width-divideLine, image.size.height);
        }
        case KPProgressDirectionLeftToRight:{
            CGFloat divideLine = (image.size.width - (self.imageContentInsets.right + self.imageContentInsets.left))*self.progressPercent + self.imageContentInsets.left;
            return CGRectMake(0.f, 0.f, divideLine, image.size.height);
        }
            
        default:
            break;
    }
}
@end
