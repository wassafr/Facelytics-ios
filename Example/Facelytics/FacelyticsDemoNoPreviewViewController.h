//
//  FacelyticsDemoNoPreviewViewController.h
//  Facelytics
//
//  Created by Peter Schaeffer on 18/08/2015.
//  Copyright (c) 2015 Peter Schaeffer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FacelyticsDemoViewController.h"
@interface FacelyticsDemoNoPreviewViewController : FacelyticsDemoViewController
@property (weak, nonatomic) IBOutlet UILabel *usersLabel;
@property (weak, nonatomic) IBOutlet UILabel *genderLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UILabel *emotionLabel;
@end
