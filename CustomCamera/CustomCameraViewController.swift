//
//  ViewController.swift
//  CustomCamera
//
//  Created by Tito Albino Evangelista da Silva Junior on 07/11/18.
//  Copyright © 2018 br.com.titoaesj. All rights reserved.
//

import UIKit
import AVFoundation

class CustomCameraViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, CustomOverlayDelegate {
    
    @IBOutlet var customView: CustomOverlayView!
    var imagePickerControoler : UIImagePickerController!
    var image : UIImage?
    
    override func viewDidAppear(_ animated: Bool) {
         super.viewDidAppear(animated)
    
        if (image == nil) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePickerControoler = UIImagePickerController()
            imagePickerControoler.delegate = self
            imagePickerControoler.sourceType = .camera
            imagePickerControoler.allowsEditing = false
            imagePickerControoler.cameraCaptureMode = .photo
            imagePickerControoler.showsCameraControls = false
            
            
            //customView stuff
            customView.frame = self.imagePickerControoler.view.frame
            customView.delegate = self
            
            present(imagePickerControoler, animated: true, completion: { self.imagePickerControoler.cameraOverlayView = self.customView })
            
        } else {
            nocamera()
        }
        } else {
            segueToConfirme()
        }
    }
    
    private func segueToConfirme() {
    self.performSegue(withIdentifier: "segueToConfirme", sender: image)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            picker.dismiss(animated: true, completion: nil)
        
        
//        imagePickerControoler.dismiss(animated: true, completion: {
//            self.performSegue(withIdentifier: "segueToConfirme", sender: info[UIImagePickerController.InfoKey.originalImage] as? UIImage)
//        })
        
//        pictureUIImageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segueToConfirme") {
            let destinationVC = segue.destination as! ConfirmeViewController
            if let mImage = sender as? UIImage {
                destinationVC.mImage = mImage
                destinationVC.imagePickerControoler = imagePickerControoler
            }
        }
    }
    
    func nocamera()
    {
        let alertVC = UIAlertController(title: "No Camera",message: "Sorry, this device has no camera",preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",style:.default,handler: nil)
        alertVC.addAction(okAction)
        present(alertVC,animated: true,completion: nil)
    }
    
    func didCancel(overlayView: CustomOverlayView) {
         imagePickerControoler.dismiss(animated: true, completion: nil)
    }
    
    func didShoot(overlayView: CustomOverlayView) {
        imagePickerControoler.takePicture()
    }
    func didReverse(overlayView: CustomOverlayView) {
        if (imagePickerControoler.cameraDevice == .front) {
            imagePickerControoler.cameraDevice = .rear
        } else {
            imagePickerControoler.cameraDevice = .front
        }
    }
}
