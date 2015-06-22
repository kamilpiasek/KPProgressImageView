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
    self.imageView.tintColor = [UIColor greenColor];
    self.imageView.progressTintColor = [UIColor redColor];
    self.imageView.image = [UIImage imageNamed:@"progressIcon.png"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sliderValueChanged:(id)sender {
    self.imageView.progressPercent = self.slider.value;
}
@end
