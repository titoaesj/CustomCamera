//
//  CustomOverlayView.swift
//  CustomCamera
//
//  Created by Tito Albino Evangelista da Silva Junior on 08/11/18.
//  Copyright © 2018 br.com.titoaesj. All rights reserved.
//

import UIKit

protocol CustomOverlayDelegate{
    func didCancel(overlayView:CustomOverlayView)
    func didShoot(overlayView:CustomOverlayView)
}

class CustomOverlayView: UIView {
    
    @IBOutlet weak var cameraLabel: UILabel!
    var delegate:CustomOverlayDelegate! = nil
    
    @IBAction func cancelButton(sender: UIButton) {
        cameraLabel.text = "I want to exit"
        delegate.didCancel(overlayView: self)
    }
    @IBAction func shootButton(sender: UIButton) {
        cameraLabel.text = "Even Cooler Camera"
        delegate.didShoot(overlayView: self)
    }
}
