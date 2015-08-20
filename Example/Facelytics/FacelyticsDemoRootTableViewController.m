//
//  FacelyticsDemoRootTableViewController.m
//  Facelytics
//
//  Created by Peter Schaeffer on 17/08/2015.
//  Copyright (c) 2015 Peter Schaeffer. All rights reserved.
//

#import "FacelyticsDemoRootTableViewController.h"
#import "FacelyticsDemoViewController.h"

@interface FacelyticsDemoRootTableViewController ()

@end

@implementation FacelyticsDemoRootTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.segueIdentifiers = @[@"showFullScreenVC",@"showThumbnailVC",@"showNoPreviewVC"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //except for the last row, we do the check before showing the view because there is facelytics related ui
    if(indexPath.row !=2)
    {
        //create a new capture manager
        self.currentCaptureManager = [[FLYCaptureManager alloc] init];
        
        //the entire ui is based on facelytcis, check if the device is powerfull enough to run facelytics
        if([FLYCaptureManager deviceSupportsFacelytics])
        {
            // check the licence first to avoid showing a blank ViewController
#warning replace by the key available on face-lytics.com
            NSString *licenceKey = @"<your_key>";
            
            [self.currentCaptureManager requestLicenceAuthorisation:licenceKey completion:^(NSError *error) {
                if(!error)
                {
                    [self performSegueWithIdentifier:self.segueIdentifiers[indexPath.row] sender:self];
                }
                else
                {
                    UIAlertView *unableToStartFLYAlert=[[UIAlertView alloc] initWithTitle:@"Enable to start facelytics sdk" message:error.localizedDescription delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [unableToStartFLYAlert show];
                }
            }];
        }
        else
        {
            //fallback if the device doesn't support facelytics
            UIAlertView *unableToStartFLYAlert=[[UIAlertView alloc] initWithTitle:@"Enable to start facelytics sdk" message:@"this device doesn't support facelytics" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [unableToStartFLYAlert show];
        }
    }
    else
    {
        [self performSegueWithIdentifier:self.segueIdentifiers[indexPath.row] sender:self];
    }
}




#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if([segue.destinationViewController respondsToSelector:@selector(setCaptureManager:)] && ![segue.identifier isEqualToString:self.segueIdentifiers[2]])
    {
        [(FacelyticsDemoViewController*)segue.destinationViewController setCaptureManager:self.currentCaptureManager];
        //do not retain a local instance of the manager to allow it to be release properly
        self.currentCaptureManager = nil;
    }
}


@end
