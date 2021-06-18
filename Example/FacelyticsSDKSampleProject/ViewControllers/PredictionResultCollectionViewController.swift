//
//  PredictionResultCollectionViewController.swift
//  FacelyticsSDKSampleProject
//
//  Created by Bertrand VILLAIN on 28/11/2019.
//  Copyright © 2019 Wassa. All rights reserved.
//

import Facelytics_SDK
import UIKit

/**
 Here we test face detection, gender and age prediction from the picture selected in the previous View Controller
 */
class PredictionResultCollectionViewController: UIViewController {
  
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var groupImageView: UIImageView!
  @IBOutlet weak var sourceImageHeightConstraint: NSLayoutConstraint!
  
  var dataSource: [PredictionResultDataSource] = []
  var sourceGroupImage: UIImage!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let sourceRatio = sourceGroupImage.size.height / sourceGroupImage.size.width
    sourceImageHeightConstraint.constant = groupImageView.frame.width * sourceRatio
    groupImageView.image = sourceGroupImage
    FacelyticsService.shared.facelyticsInstance?.detectFaces(image: sourceGroupImage, completion: { (faces, _) in
      if let faces = faces,
        !faces.isEmpty {
        self.dataSource = faces.compactMap({ (face) -> PredictionResultDataSource? in
          return PredictionResultDataSource(detectedFace: face)
        })
        self.collectionView.reloadData()
        faces.enumerated().forEach { (element) in
          DispatchQueue.global().async {
            self.updatePredictionResult(face: element.element, offset: element.offset)
          }
          
        }
      }
    })
  }
  
  /**
   That method just do the prediction for age and gender for a given [DetectedFace]
   Then it updates the right cell to display age and gender information
   */
  func updatePredictionResult(face: DetectedFace, offset: Int) {
    
    FacelyticsService.shared.facelyticsInstance?.facelyticsPredict(faceToPredict: face.image, completion: { predictionResult, error in
      /// The UI changes must be called from main Thread
      DispatchQueue.main.async {
        if let error = error {
          print("❌ \(error.localizedDescription)")
        } else if let ageResult = predictionResult?.agePredictionResult,
                  let genderResult = predictionResult?.genderPredictionResult {
          self.dataSource[offset].ageResult = ageResult
          self.dataSource[offset].genderResult = genderResult
          self.collectionView.reloadItems(at: [IndexPath(item: offset, section: 0)])
        }
      }
    })
    
  }
  
  /**
   Returns to HomeViewController
   */
  @IBAction func touchUpInside(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
  }
  
}

extension PredictionResultCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataSource.count
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let screenBounds = UIScreen.main.bounds
    return CGSize(width: (screenBounds.width / 3) - 30, height: (screenBounds.width / 3) - 30)
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "PredictionResultCollectionViewCell", for: indexPath) as! PredictionResultCollectionViewCell
    cell.loadData(dataSource: dataSource[indexPath.item])
    return cell
  }
  
}
