//
//  FacelyticsDemoNoPreviewViewController.m
//  Facelytics
//
//  Created by Peter Schaeffer on 18/08/2015.
//  Copyright (c) 2015 Peter Schaeffer. All rights reserved.
//

#import "FacelyticsDemoNoPreviewViewController.h"

@implementation FacelyticsDemoNoPreviewViewController
- (void)viewDidAppear:(BOOL)animated
{
    
    //creating our own instance -> no facelytics ui present in the scene
    self.captureManager = [[FLYCaptureManager alloc] init];
    
    
    [self.captureManager startCapturewithDefaultCameraAndLicenceKey:@"<your_key>" completion:^(NSError *error) {
        
        if(error)
        {
            UIAlertView *unableToStartFLYAlert=[[UIAlertView alloc] initWithTitle:@"Enable to start facelytics sdk" message:error.localizedDescription delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [unableToStartFLYAlert show];
        }
        else
        {
            //start the face detection
            [self.captureManager startFaceRecognition];
            
            //attach the preview
            FLYVideoPreviewViewController *previewVC = (FLYVideoPreviewViewController*)[self.childViewControllers firstObject];
            
            [self.captureManager attachPreview:previewVC];
            //add the detection delgate to retrieve face results
            [self.captureManager setDetectionDelegate:self];
        }
    }];
    
}
#pragma mark -FLYDetectionDelegte
- (void)didReturnFacesAsEvent:(FLYEvent *)event
{
    //get information in the parent implementation
    [super didReturnFacesAsEvent:event];
    
    //display it
    self.usersLabel.text = [NSString stringWithFormat:@"Max users :  %ld",(long)self.maxUsers];
    self.genderLabel.text = [NSString stringWithFormat:@"Emotion : %@",self.currentGender];
    self.ageLabel.text = [NSString stringWithFormat:@"Age : %@",self.currentAge];
    self.emotionLabel.text = [NSString stringWithFormat:@"Emotion : %@",self.currentEmotion];
}
@end
