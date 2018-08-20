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
    
    // Controller Values
    var isResetViewOpen: Bool = false
    var isColorPickerViewOpen: Bool = false
    var isDrawing: Bool = true
    var isErasing: Bool = false
    var currentColor: UIColor = black
    var currentWidth: CGFloat = 5.00
    var currentAlpha: CGFloat = 1.00
    
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
        isColorPickerViewOpen = !isColorPickerViewOpen
        ColorPickerView.isHidden = !ColorPickerView.isHidden
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
        isResetViewOpen = !isResetViewOpen
        ResetCanvasConfirmationView.isHidden = !ResetCanvasConfirmationView.isHidden
    }
    
    // Yes reset canvas button is pressed
    @IBAction func yesResetCanvasPressed(_ sender: Any) {
        isResetViewOpen = false
        ResetCanvasConfirmationView.isHidden = true
        isColorPickerViewOpen = false
        ColorPickerView.isHidden = true
        
        MainCanvasView.setToDraw()
        MainCanvasView.clearCanvas()
    }
    
    // No reset canvas button is pressed
    @IBAction func noResetCanvasPressed(_ sender: Any) {
        isResetViewOpen = false
        ResetCanvasConfirmationView.isHidden = true
    }
    
    // New color pick option is selected
    @IBAction func colorPickerOptionPressed(_ sender: Any) {
        let pickedColor: UIColor = colorPickerOptions[(sender as! UIButton).tag]
        MainCanvasView.setLineColor(newColor: pickedColor)
        ColorPickerButton.backgroundColor = pickedColor
        
        
        isColorPickerViewOpen = false
        ColorPickerView.isHidden = true
    }
    
    // Hide status bar
    override var prefersStatusBarHidden: Bool{
        return true
    }
}

