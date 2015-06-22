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
}

-(void)setImage:(UIImage *)image{
    [self detectImageContentInsets:image];
    [self setupImage:image];
}

-(void)setProgressPercent:(CGFloat)progressPercent{
    _progressPercent = progressPercent;
    [self setupImage:self.image];
}

-(void)detectImageContentInsets:(UIImage *)image{
    self.imageContentInsets = [image transparencyInsetsRequiringFullOpacity:YES];
}

-(void)setupImage:(UIImage *)image{
    CGFloat divideLine = [self calculateDivideLineForImage:image];
    
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0f);
    UIColor* tintColor = self.tintColor;
    [tintColor setFill];
    CGRect rect = CGRectMake(0.f, 0.f, image.size.width, image.size.height);
    UIRectFill(rect);
    [self.progressTintColor setFill];
    CGRect rect2 = CGRectMake(0.f, divideLine, rect.size.width, rect.size.height-divideLine);
    UIRectFill(rect2);
    [image drawInRect:rect blendMode:kCGBlendModeDestinationIn alpha:1.0f];
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [super setImage:tintedImage];
}

//-(void)drawProgressOnImage{
//
//}

-(CGFloat)calculateDivideLineForImage:(UIImage *)image{
    return (image.size.height - (self.imageContentInsets.top + self.imageContentInsets.bottom))*(1.f-self.progressPercent) + self.imageContentInsets.top;
}
@end
