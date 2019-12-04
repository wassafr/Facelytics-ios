//
//  GroupToPredictCollectionViewCell.swift
//  FacelyticsSDKSampleProject
//
//  Created by Bertrand VILLAIN on 28/11/2019.
//  Copyright © 2019 Wassa. All rights reserved.
//

import UIKit

class GroupToPredictCollectionViewCell: UICollectionViewCell {

  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var heightImageConstraint: NSLayoutConstraint!
  
  func loadData(dataSource: UIImage) {
    let screenBounds = UIScreen.main.bounds
    heightImageConstraint.constant = (screenBounds.width / 2) - 14
    imageView.image = dataSource
  }

}
