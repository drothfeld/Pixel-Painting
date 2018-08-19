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
    @IBOutlet weak var ResetCanvasConfirmationView: UIView!
    @IBOutlet weak var ColorPickerView: UIView!
    @IBOutlet weak var WidthSlider: UISlider!
    @IBOutlet weak var AlphaSlider: UISlider!
    @IBOutlet weak var ColorPickerButton: UIButton!
    @IBOutlet weak var PencilToolButton: UIButton!
    @IBOutlet weak var EraserToolButton: UIButton!
    
    // View loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        canvasSetup()
    }
    
    // Do any needed setup for the canvas
    func canvasSetup() {
        MainCanvasView.setToDraw()
    }
    
    // Width slider value changes
    @IBAction func widthSliderChanges(_ sender: Any) {
    }
    
    // Alpha slider value changes
    @IBAction func alphaSliderChanges(_ sender: Any) {
    }
    
    // Color picker toolbar option is pressed
    @IBAction func colorPickerToolPressed(_ sender: Any) {
    }
    
    // Pencil tool is pressed
    @IBAction func pencilToolPressed(_ sender: Any) {
    }
    
    // Eraser tool is pressed
    @IBAction func eraserToolPressed(_ sender: Any) {
    }
    
    // Save button is pressed
    @IBAction func saveCanvasPressed(_ sender: Any) {
    }
    
    // Reset button is pressed
    @IBAction func resetCanvasPressed(_ sender: Any) {
    }
    
    // Hide status bar
    override var prefersStatusBarHidden: Bool{
        return true
    }
}

