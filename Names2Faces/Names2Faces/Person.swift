//
//  Person.swift
//  Names2Faces
//
//  Created by Ruter on 16/4/19.
//  Copyright © 2016年 Ruter. All rights reserved.
//

import UIKit

class Person: NSObject {
  
  var name: String
  var image: String
  
  init(name: String, image: String) {
    self.name = name
    self.image = image
  }

}
