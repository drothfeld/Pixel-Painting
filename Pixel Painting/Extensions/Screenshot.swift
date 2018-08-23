//
//  Screenshot.swift
//  Pixel Painting
//
//  Created by Dylan Rothfeld on 8/22/18.
//  Copyright © 2018 Dylan Rothfeld. All rights reserved.
//

import UIKit

extension UIApplication {
    var screenShot: UIImage?  {
        return keyWindow?.layer.screenShot
    }
}

extension CALayer {
    var screenShot: UIImage?  {
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(frame.size, false, scale)
        if let context = UIGraphicsGetCurrentContext() {
            render(in: context)
            let screenshot = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return screenshot
        }
        return nil
    }
}
