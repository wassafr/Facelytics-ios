//
//  HomeViewController.swift
//  FacelyticsSDKSampleProject
//
//  Created by Bertrand VILLAIN on 28/11/2019.
//  Copyright © 2019 Wassa. All rights reserved.
//

import UIKit
import Facelytics_SDK

/**
 That View Controller just list pictures of people to test in Facelytics
 To test your own pictures you can add assets in the folder Assets.xcassets with a name under the form "group_<an ID from 0 to 100>"
 You can also edit the dataSource returned in the collectionView
 */
class HomeViewController: UIViewController {
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  var groupPicturesDataSource: [UIImage] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.addGroupPictures()
    FacelyticsService.shared.initService()
    self.collectionView.reloadData()
  }
  
  func addGroupPictures() {
    for i in 0...50 {
      if let groupImage = UIImage(named: "group_\(i)") {
        self.groupPicturesDataSource.append(groupImage)
      }
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    super.prepare(for: segue, sender: sender)
    if let nextVC = segue.destination as? PredictionResultCollectionViewController {
      nextVC.sourceGroupImage = sender as? UIImage
    }
  }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return groupPicturesDataSource.count
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let screenBounds = UIScreen.main.bounds
    return CGSize(width: (screenBounds.width / 2) - 24, height: (screenBounds.width / 2) - 24)
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "GroupToPredictCollectionViewCell", for: indexPath) as! GroupToPredictCollectionViewCell
    cell.loadData(dataSource: groupPicturesDataSource[indexPath.item])
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let groupPicture = groupPicturesDataSource[indexPath.item]
    if FacelyticsService.shared.serviceStarted {
      self.performSegue(withIdentifier: "GroupToPredictCollectionViewCell", sender: groupPicture)
    }
  }
  
}
