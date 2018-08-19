//
//  ViewController.swift
//  Pixel Painting
//
//  Created by Dylan Rothfeld on 8/17/18.
//  Copyright © 2018 Dylan Rothfeld. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Storyboard IBOutlets
    @IBOutlet weak var MainCanvasView: CanvasView!
    
    // View loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        MainCanvasView.setToDraw()
    }
    
    // Hide status bar
    override var prefersStatusBarHidden: Bool{
        return true
    }
}

