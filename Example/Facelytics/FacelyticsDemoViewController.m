//
//  FacelyticsDemoViewController.m
//  Facelytics
//
//  Created by Peter Schaeffer on 20/08/2015.
//  Copyright (c) 2015 Peter Schaeffer. All rights reserved.
//

#import "FacelyticsDemoViewController.h"

@implementation FacelyticsDemoViewController
- (void)viewDidLoad
{
    self.currentGender = @"";
    self.currentAge = @"";
    self.currentEmotion = @"";
    self.maxUsers = 0;
}
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.captureManager stopFaceRecognition];
}
- (void)detectionDidStopAfterLicenceElapsedTime
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
#pragma mark -FLYDetectionDelegte
- (void)didReturnFacesAsEvent:(FLYEvent *)event
{
    //check if the ecent is != nil, if so we have at least one face
    if(event)
    {
        //we need to parse it if we want to use it ( for performance optimization, the object is populated only if needed)
        [event parse];
        
        //get the first face currently detected.
        FLYFace *firstFace = [event.faces firstObject];
        FLYGender *gender = firstFace.gender;
        
        //for the age, you can use the average age value to have an idea of the numerical age, to have a string representation as the one displayed, use the displayed age value
        if(![firstFace.age.displayed_age isEqualToString:@"null"])
        {
            self.currentAge = firstFace.age.displayed_age;
        }
        else
        {
            self.currentGender = @"";
        }
        
        
        //the gender can be undertemined, you have to wait a several detections to have a reliable gender
        switch (gender.current) {
            case Undetermined:
                self.currentGender=@"";
                break;
            case Female:
                self.currentGender=@"Female";
                break;
            default:
                self.currentGender = @"Male";
                break;
                
        }
        
        
        //get the current emotion of the face
        NSArray *emotionNames = @[@"neutral",@"happy",@"sad",@"surprise"];
        
        if(firstFace.emotion.current>=0)
        {
            self.currentEmotion = emotionNames[firstFace.emotion.current];
        }
        else
        {
            self.currentEmotion = @"";
        }
        
        self.maxUsers = MAX(self.maxUsers, [event.faces count]);
        
        
    }
    
}

@end
