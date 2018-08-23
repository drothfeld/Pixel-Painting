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
    @IBOutlet weak var ToolbarView: UIView!
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
    var currentColor: UIColor = defaultColor
    var currentWidth: CGFloat = defaultWidth
    var currentAlpha: Float = defaultAlpha
    let toastDuration: Double = 2.0
    
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
        let sliderValue: CGFloat = CGFloat((sender as! UISlider).value)
        MainCanvasView.setLineWidth(newWidth: sliderValue)
    }
    
    // Alpha slider value changes
    @IBAction func alphaSliderChanges(_ sender: Any) {
        let sliderValue: Float = (sender as! UISlider).value
        MainCanvasView.setLineAlpha(newAlpha: sliderValue)
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
        takeCanvasSnapshot()
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
        
        ColorPickerButton.backgroundColor = black
        WidthSlider.value = Float(defaultWidth)
        AlphaSlider.value = defaultAlpha
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
    
    // Take a snapshot of the users canvas and
    // save it to the Photos app
    func takeCanvasSnapshot() {
        ToolbarView.isHidden = true
        let style = ToastStyle()
        let canvasSnapshot: UIImage = UIApplication.shared.screenShot!
        self.view.makeToast("Canvas image has been saved to Photos Library.", duration: toastDuration, position: .top, style: style)
        UIImageWriteToSavedPhotosAlbum(canvasSnapshot, nil, nil, nil)
        ToolbarView.isHidden = false
    }
    
    // Hide status bar
    override var prefersStatusBarHidden: Bool{
        return true
    }
}

