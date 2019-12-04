//
//  FacelyticsService.swift
//  FacelyticsSDKSampleProject
//
//  Created by Bertrand VILLAIN on 28/11/2019.
//  Copyright © 2019 Wassa. All rights reserved.
//

import Foundation
import Facelytics_SDK

class FacelyticsService {
  
  /// ⚠️ You have to edit  the licenseKey before running the project
  let licenseKey = "yourLicenseKey"
  static let shared = FacelyticsService()  // 2. Shared instance
  private init() {}
  
  var facelyticsInstance: Facelytics?
  var serviceStarted = false
  
  /**
   The service must be initialized at the app starting
   */
  func initService() {
    facelyticsInstance = Facelytics(licenceKey: licenseKey, completion: nil)
    DispatchQueue.global().async {
      self.facelyticsInstance?.loadModels(completion: { (error) in
        if let error = error {
          print("❌ Cannot initialize Facelytics \(error.localizedDescription)")
        } else {
          self.serviceStarted = true
        }
      })
      
    }
  }
  
}
