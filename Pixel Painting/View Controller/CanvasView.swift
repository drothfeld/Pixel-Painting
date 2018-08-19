//
//  CanvasView.swift
//  Pixel Painting
//
//  Created by Dylan Rothfeld on 8/19/18.
//  Copyright © 2018 Dylan Rothfeld. All rights reserved.
//

import UIKit

class CanvasView: UIView {
    
    // Controller Values
    var lineColor: UIColor!
    var lineWidth: CGFloat!
    var path: UIBezierPath!
    var touchPoint: CGPoint!
    var startingPoint: CGPoint!
    
    // Layout properties for canvas view object
    override func layoutSubviews() {
        self.clipsToBounds = true
        self.isMultipleTouchEnabled = false
    }
    
    // Set tool settings to drawing
    func setToDraw() {
        lineColor = UIColor.black
        lineWidth = 5
    }
    
    // Set tool settings to erase
    func setToErase() {
        lineColor = UIColor.white
        lineWidth = 40
    }
    
    // User touches the canvas
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        startingPoint = touch?.location(in: self)
    }
    
    // User moves finger on canvas
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        touchPoint = touch?.location(in: self)
        
        // Draw line and reset starting point
        path = UIBezierPath()
        path.move(to: startingPoint)
        path.addLine(to: touchPoint)
        startingPoint = touchPoint
        
        drawShapeLayer()
    }
    
    // Returns the most recent touch point
    func getLastTouchPoint() -> CGPoint {
        if touchPoint == nil {
            return CGPoint(x: 0.0, y: 0.0)
        } else {
            return touchPoint
        }
    }
    
    // Reset last touch point
    func resetLastTouchPoint() {
        touchPoint = nil
    }
    
    // Applies draw properties to path line
    func drawShapeLayer() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(shapeLayer)
        self.setNeedsDisplay()
    }
    
    // Clears the canvas
    func clearCanvas() {
        path.removeAllPoints()
        self.layer.sublayers = nil
        self.setNeedsDisplay()
    }
}
