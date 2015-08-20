//
//  FacelyticsDemoFullScreen.h
//  Facelytics
//
//  Created by Peter Schaeffer on 17/08/2015.
//  Copyright (c) 2015 Peter Schaeffer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Facelytics/Facelytics.h>

@interface FacelyticsDemoFullScreen : FLYVideoPreviewViewController
@property (nonatomic,strong) NSString *currentGender;
@property (nonatomic,strong) NSString *currentAge;
@property (nonatomic,strong) NSString *currentEmotion;
@property (nonatomic,assign) NSInteger maxUsers;
@end
