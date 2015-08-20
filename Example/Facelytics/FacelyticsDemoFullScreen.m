//
//  FacelyticsDemoFullScreen.m
//  Facelytics
//
//  Created by Peter Schaeffer on 17/08/2015.
//  Copyright (c) 2015 Wassa. All rights reserved.
//

#import "FacelyticsDemoFullScreen.h"

@implementation FacelyticsDemoFullScreen
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    //start the capture (ie :instantiate the camera, handle camera permission if needed)
    // to avoid to display the full screen with incorrect licence, we check it at the previous screen / no need to provide the key here
    
    
    [self.captureManager startCapturewithDefaultCameraCompletion:^(NSError *error) {
        if(error)
        {
            UIAlertView *unableToStartFLYAlert=[[UIAlertView alloc] initWithTitle:@"Enable to start facelytics sdk" message:error.localizedDescription delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [unableToStartFLYAlert show];
        }
        else
        {
            //start the face detection
            [self.captureManager startFaceRecognition];
            
            //add the detection delgate to retrieve face results
            [self.captureManager setDetectionDelegate:self];
        }
    }];
    
    
    self.maxUsers = 0;
    
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
        self.currentAge = firstFace.age.displayed_age;
        
        
        //the gender can be undertemined, you have to wait a several detections to have a reliable gender
        switch (gender.current) {
            case Undetermined:
                self.currentGender=nil;
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
        
        self.maxUsers = MAX(self.maxUsers, [event.faces count]);

        
    }
    
}
- (void)detectionDidStopAfterLicenceElapsedTime
{
    //dismiss the view controller
    NSString *alertMessage = [NSString stringWithFormat:@"Max Users : %ld \n Age : %@ \n Gender : %@ \n Emotion : %@",(long)self.maxUsers,self.currentAge,self.currentGender,self.currentEmotion];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Facelytics session ended" message:alertMessage delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

#pragma mark UIAlertViewDelegate
-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
