//
//  CameraViewController.swift
//  XcodePhotoApp
//
//  Created by Nargiz on 8/27/20.
//  Copyright © 2020 nargizhus. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func savePhoto(image:UIImage) {
        // Call the photo service to store the photo
        PhotoService.savePhoto(image: image)
        
    }

}
