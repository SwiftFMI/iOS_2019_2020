//
//  ViewController.swift
//  GestureRecognizer
//
//  Created by Petko Haydushki on 7.01.20.
//  Copyright © 2020 Petko Haydushki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sliderWrapperView: UIView!
    @IBOutlet weak var slider: UIView!
   
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    
    var sliderPanGesture : UIPanGestureRecognizer!
    var sliderTapGesture : UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        sliderWrapperView.layer.cornerRadius = sliderWrapperView.frame.size.height/2.0
        sliderWrapperView.layer.masksToBounds = true
        slider.layer.cornerRadius = sliderWrapperView.frame.size.height/2.0
        slider.layer.masksToBounds = true
        slider.layer.borderColor = UIColor.blue.cgColor
        slider.layer.borderWidth = 2.0
        
        self.sliderPanGesture = UIPanGestureRecognizer.init(target: self, action:  #selector(self.handlePan(_:)))
        self.slider.addGestureRecognizer(self.sliderPanGesture)
        self.sliderTapGesture = UITapGestureRecognizer.init(target: self, action:  #selector(self.handleTap(_:)))
    self.sliderWrapperView.addGestureRecognizer(self.sliderTapGesture)
    }
    
    @objc func handlePan(_ sender: UIPanGestureRecognizer) {
      let translation = sender.translation(in: self.sliderWrapperView)
      if let view = sender.view {
        let newXPosition = view.center.x + translation.x
        if ((newXPosition) > view.frame.size.width/2.0 && newXPosition < (self.sliderWrapperView.frame.size.width - view.frame.size.width/2.0)) {
            view.center = CGPoint(x:newXPosition, y:view.center.y)
        }
      }
        
      sender.setTranslation(CGPoint.zero, in: self.sliderWrapperView)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
      let location = sender.location(in: self.sliderWrapperView)
        
        // location x is more than 0 plus half the slider size width
        if (location.x > slider.frame.size.width/2.0) {
            // location x is less than the wrapper width minus half the slider size width
            if (location.x < sliderWrapperView.frame.size.width - slider.frame.size.width/2.0) {
                self.slider.center = CGPoint(x: location.x, y: slider.center.y)
            } else {
                    // set the position to the right most point
                    self.slider.center = CGPoint(x: sliderWrapperView.frame.size.width - slider.frame.size.width/2.0, y: slider.center.y)
            }
        } else {
            // set the position to the left most point
            self.slider.center = CGPoint(x: slider.frame.size.width/2.0, y: slider.center.y)
        }
    }
    
    @IBAction func rotationGestureAction(_ sender: UIRotationGestureRecognizer) {
        if let view = sender.view {
          view.transform = view.transform.rotated(by: sender.rotation)
          sender.rotation = 0
        }
    }
    
    
}

