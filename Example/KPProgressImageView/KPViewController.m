//
//  KPViewController.m
//  KPProgressImageView
//
//  Created by Kamil Piasek on 06/22/2015.
//  Copyright (c) 2014 Kamil Piasek. All rights reserved.
//

#import "KPViewController.h"

@interface KPViewController ()

@end

@implementation KPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self configureCommonParams:self.topLeft];
    [self configureCommonParams:self.topRight];
    [self configureCommonParams:self.bottomLeft];
    [self configureCommonParams:self.bottomRight];
    
    self.topLeft.progressDirection = KPProgressDirectionLeftToRight;
    self.topRight.progressDirection = KPProgressDirectionRightToLeft;
    self.bottomLeft.progressDirection = KPProgressDirectionTopToBottom;
    self.bottomRight.progressDirection = KPProgressDirectionBottomToTop;
}

-(void)configureCommonParams:(KPProgressImageView*)imageView{
    imageView.tintColor = [UIColor grayColor];
    imageView.progressTintColor = [UIColor redColor];
    imageView.image = [UIImage imageNamed:@"progressIcon"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sliderValueChanged:(id)sender {
    self.topLeft.progressPercent = self.slider.value;
    self.topRight.progressPercent = self.slider.value;
    self.bottomLeft.progressPercent = self.slider.value;
    self.bottomRight.progressPercent = self.slider.value;
}
@end
