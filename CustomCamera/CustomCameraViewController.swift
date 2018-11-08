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
    
    func didCancel(overlayView: CustomOverlayView) {
    }
    
    func didShoot(overlayView: CustomOverlayView) {
    }
    
    
    @IBOutlet weak var previewView: UIView!
    @IBOutlet weak var pictureUIImageView: UIImageView!
    @IBOutlet var customView: CustomOverlayView!
    
    var imagePickerControoler : UIImagePickerController!
    
    override func viewDidAppear(_ animated: Bool) {
         super.viewDidAppear(animated)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePickerControoler = UIImagePickerController()
            imagePickerControoler.delegate = self
            imagePickerControoler.sourceType = .camera
            imagePickerControoler.allowsEditing = false
            imagePickerControoler.cameraCaptureMode = .photo
            imagePickerControoler.showsCameraControls = false
            imagePickerControoler.cameraOverlayView = previewView
            
            //customView stuff
            customView.frame = self.imagePickerControoler.view.frame
            customView.cameraLabel.text = "Hello Cute Camera"
            customView.delegate = self
            
            
            present(imagePickerControoler, animated: true, completion: { self.imagePickerControoler.cameraOverlayView = self.customView })
            
        } else {
            nocamera()
        }
        

    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePickerControoler.dismiss(animated: true, completion: nil)
        pictureUIImageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
    }
    
    func nocamera()
    {
        let alertVC = UIAlertController(title: "No Camera",message: "Sorry, this device has no camera",preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",style:.default,handler: nil)
        alertVC.addAction(okAction)
        present(alertVC,animated: true,completion: nil)
    }
    
    func saveImage(imageName: String) {
        
        // Cria uma instancia para o FleManager
        let fileManager = FileManager.default
        
        // pega o path da imagem
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
        
        // Imagem tirada da câmera
        let image = pictureUIImageView.image!
        
        // pega os dados do PNG da imagem
        let data = image.pngData()
        
        // salva no diretorio de documentos
        fileManager.createFile(atPath: imagePath as String, contents: data, attributes: nil)
    }
    
}
