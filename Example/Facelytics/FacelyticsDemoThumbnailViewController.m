//
//  FacelyticsDemoThumbnailViewController.m
//  Facelytics
//
//  Created by Peter Schaeffer on 17/08/2015.
//  Copyright © 2015 Peter Schaeffer. All rights reserved.
//

#import "FacelyticsDemoThumbnailViewController.h"
@interface FacelyticsDemoThumbnailViewController ()

@end

@implementation FacelyticsDemoThumbnailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidAppear:(BOOL)animated
{
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
            
            //attach the preview
            FLYVideoPreviewViewController *previewVC = (FLYVideoPreviewViewController*)[self.childViewControllers firstObject];
            
            [self.captureManager attachPreview:previewVC];
            //add the detection delgate to retrieve face results
            [self.captureManager setDetectionDelegate:self];
        }
    }];

}

- (void)didReturnFacesAsEvent:(FLYEvent *)event
{
    //do somthing with the face (see FacelyticsDemoFullScreen for exemple)
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
