//
//  KPProgressImageView.m
//  Pods
//
//  Created by MacOs on 22.06.2015.
//
//

#import "KPProgressImageView.h"
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
    self.imageContentInsets = [self transparencyInsetsRequiringFullOpacity:YES];
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

/*
 * Calculates the insets of transparency around all sides of the image
 *
 * @param fullyOpaque
 *        Whether the algorithm should consider pixels with an alpha value of something other than 255 as being transparent. Otherwise a non-zero value would be considered opaque.
 */
- (UIEdgeInsets)transparencyInsetsRequiringFullOpacity:(BOOL)fullyOpaque
{
    // Draw our image on that context
    NSInteger width  = (NSInteger)CGImageGetWidth([self.image CGImage]);
    NSInteger height = (NSInteger)CGImageGetHeight([self.image CGImage]);
    NSInteger bytesPerRow = width * (NSInteger)sizeof(uint8_t);
    
    // Allocate array to hold alpha channel
    uint8_t * bitmapData = calloc((size_t)(width * height), sizeof(uint8_t));
    
    // Create alpha-only bitmap context
    CGContextRef contextRef = CGBitmapContextCreate(bitmapData, (NSUInteger)width, (NSUInteger)height, 8, (NSUInteger)bytesPerRow, NULL, (kCGBitmapAlphaInfoMask & kCGImageAlphaOnly));
    
    CGImageRef cgImage = self.image.CGImage;
    CGRect rect = CGRectMake(0, 0, width, height);
    CGContextDrawImage(contextRef, rect, cgImage);
    
    // Sum all non-transparent pixels in every row and every column
    uint16_t * rowSum = calloc((size_t)height, sizeof(uint16_t));
    uint16_t * colSum = calloc((size_t)width,  sizeof(uint16_t));
    
    // Enumerate through all pixels
    for (NSInteger row = 0; row < height; row++) {
        
        for (NSInteger col = 0; col < width; col++) {
            
            if (fullyOpaque) {
                
                // Found non-transparent pixel
                if (bitmapData[row*bytesPerRow + col] == UINT8_MAX) {
                    
                    rowSum[row]++;
                    colSum[col]++;
                    
                }
                
            } else {
                
                // Found non-transparent pixel
                if (bitmapData[row*bytesPerRow + col]) {
                    
                    rowSum[row]++;
                    colSum[col]++;
                    
                }
                
            }
            
        }
        
    }
    
    // Initialize crop insets and enumerate cols/rows arrays until we find non-empty columns or row
    UIEdgeInsets crop = UIEdgeInsetsZero;
    
    // Top
    for (NSInteger i = 0; i < height; i++) {
        
        if (rowSum[i] > 0) {
            
            crop.top = i;
            break;
            
        }
        
    }
    
    // Bottom
    for (NSInteger i = height - 1; i >= 0; i--) {
        
        if (rowSum[i] > 0) {
            crop.bottom = MAX(0, height - i - 1);
            break;
        }
        
    }
    
    // Left
    for (NSInteger i = 0; i < width; i++) {
        
        if (colSum[i] > 0) {
            crop.left = i;
            break;
        }
        
    }
    
    // Right
    for (NSInteger i = width - 1; i >= 0; i--) {
        
        if (colSum[i] > 0) {
            
            crop.right = MAX(0, width - i - 1);
            break;
            
        }
    }
    
    free(bitmapData);
    free(colSum);
    free(rowSum);
    
    CGContextRelease(contextRef);
    
    return crop;
}
@end
