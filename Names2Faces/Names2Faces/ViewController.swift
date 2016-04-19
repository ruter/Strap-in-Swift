//
//  ViewController.swift
//  Names2Faces
//
//  Created by Ruter on 16/4/19.
//  Copyright © 2016年 Ruter. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

  @IBOutlet weak var collectionView: UICollectionView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(addNewPerson))
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func addNewPerson() {
    let picker = UIImagePickerController()
    picker.allowsEditing = true
    picker.delegate = self
    presentViewController(picker, animated: true, completion: nil)
  }

  // MARK: - UICollectionView dataSource & delegate
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Person", forIndexPath: indexPath) as! PersonCell
    
    return cell
  }

  // MARK: - UIImagePickerController delegate
  func imagePickerControllerDidCancel(picker: UIImagePickerController) {
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
    var newImage: UIImage
    
    if let possibleImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
      newImage = possibleImage
    } else if let possibleImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
      newImage = possibleImage
    } else {
      return
    }
    
    let imageName = NSUUID().UUIDString
    let imagePath = getDocumentsDirectory().stringByAppendingPathComponent(imageName)
    
    if let jpegData = UIImageJPEGRepresentation(newImage, 80) {
      jpegData.writeToFile(imagePath, atomically: true)
    }
    
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  func getDocumentsDirectory() -> NSString {
    let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
    let documentsDirectory = paths[0]
    return documentsDirectory
  }
  
}

