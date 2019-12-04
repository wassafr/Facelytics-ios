//
//  PredictionResultCollectionViewCell.swift
//  FacelyticsSDKSampleProject
//
//  Created by Bertrand VILLAIN on 28/11/2019.
//  Copyright © 2019 Wassa. All rights reserved.
//

import UIKit
import Facelytics_SDK

class PredictionResultCollectionViewCell: UICollectionViewCell {

  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var resultLabel: UILabel!
  @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!
  
  func loadData(dataSource: PredictionResultDataSource) {
    let screenBounds = UIScreen.main.bounds
    imageView.image = dataSource.detectedFace.image
    imageHeightConstraint.constant = (screenBounds.width / 3) - 30
    if let ageResult = dataSource.ageResult {
      self.resultLabel.text = "\(ageResult.age)"
    }
    if let genderResult = dataSource.genderResult {
      self.resultLabel.textColor = genderResult.gender == .male ? #colorLiteral(red: 0.3246597648, green: 0.6645558476, blue: 1, alpha: 1) : #colorLiteral(red: 1, green: 0.2635481954, blue: 1, alpha: 1)
    }
  }

}

class PredictionResultDataSource {
  var detectedFace: DetectedFace
  var genderResult: GenderPredictionResult?
  var ageResult: AgePredictionResult?
  
  init(detectedFace: DetectedFace) {
    self.detectedFace = detectedFace
  }
}
