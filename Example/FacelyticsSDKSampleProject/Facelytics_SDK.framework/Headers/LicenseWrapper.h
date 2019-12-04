//
//  LicenseWrapper.h
//  Pixlytics-SDK
//
//  Created by Bertrand VILLAIN on 03/04/2019.
//  Copyright © 2019 Wassa. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "LicenseKeyStatus.h"

@interface LicenseWrapper : NSObject

- (instancetype _Nullable )initWithLicense:(NSString* _Nonnull) licenseKey;
- (LicenseKeyStatus)getLicenseStatus;
- (void)updateLicense:(NSString* _Nonnull) licenseKey;
- (NSString *_Nullable)getEmail;
- (NSString *_Nullable)getToken;

@end
