//
//  KPViewController.h
//  KPProgressImageView
//
//  Created by Kamil Piasek on 06/22/2015.
//  Copyright (c) 2014 Kamil Piasek. All rights reserved.
//

@import UIKit;
#import <KPProgressImageView/KPProgressImageView.h>

@interface KPViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet KPProgressImageView *topLeft;
@property (weak, nonatomic) IBOutlet KPProgressImageView *topRight;
@property (weak, nonatomic) IBOutlet KPProgressImageView *bottomLeft;
@property (weak, nonatomic) IBOutlet KPProgressImageView *bottomRight;
- (IBAction)sliderValueChanged:(id)sender;

@end
