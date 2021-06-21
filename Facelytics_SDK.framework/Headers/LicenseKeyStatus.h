//
//  LicenseKeyStatus.h
//  Pixlytics-SDK
//
//  Created by Bertrand VILLAIN on 01/04/2019.
//  Copyright © 2019 Wassa. All rights reserved.
//

#ifndef LICENSEKEYSTATUS_h
#define LICENSEKEYSTATUS_h

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 *  The different possible status of your license key, if you have any problem with your license contact Pixlytics support
 */
typedef NS_ENUM(NSInteger, LicenseKeyStatus) {
  ///Your license is valid
  LicenseOk,
  ///The format contained in your license is not valid
  InvalidLicenseFormat,
  ///Your license has been modified and signature is not valid anymore
  InvalidLicenseModified,
  ///Your license is no longer valid, date has expired
  InvalidLicenseExpired,
  ///Your license is blocked because of unpayment
  InvalidLicenseNotPaid,
  ///Your license is blocked
  InvalidLicenseBlocked,
  ///Other error
  LicenseUnknownError
};

NS_ASSUME_NONNULL_END

#endif
