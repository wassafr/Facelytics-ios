//
//  FacelyticsDemoRootTableViewController.h
//  Facelytics
//
//  Created by Peter Schaeffer on 17/08/2015.
//  Copyright (c) 2015 Peter Schaeffer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Facelytics/Facelytics.h>
@interface FacelyticsDemoRootTableViewController : UITableViewController
@property(strong) NSArray *segueIdentifiers;
@property (strong) FLYCaptureManager *currentCaptureManager;

@end
