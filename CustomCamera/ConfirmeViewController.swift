//
//  ConfirmeViewController.swift
//  CustomCamera
//
//  Created by Tito Albino Evangelista da Silva Junior on 08/11/18.
//  Copyright © 2018 br.com.titoaesj. All rights reserved.
//

import UIKit

class ConfirmeViewController: UIViewController {
    
    @IBOutlet weak var previewImageView: UIImageView!
    
    private let directoryName = "customCamera"
    var imagePickerControoler : UIImagePickerController!
    var mImage : UIImage?
    var fileName : String?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        previewImageView.image = mImage
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segueToShowImage") {
            let destinationVC = segue.destination as! PreviewViewController
            if let mFileName = sender as? String {
                destinationVC.fileName = mFileName
            }
        }
    }
    
    @IBAction func takeNewPhoto(_ sender: Any) {
        self.performSegue(withIdentifier: "segueToCamera", sender: mImage)
    }
    
    @IBAction func sendButton(_ sender: Any) {
        if mImage != nil {
            fileName = String.uniqueFilename(withPrefix: "custom", withSufix: "jpeg")
            saveImageDocumentDirectory(image: mImage!, imageName: fileName!)
            self.performSegue(withIdentifier: "segueToShowImage", sender: fileName!)
        }
    }
    
    
    private func getDirectoryPath() -> String {
        return (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(directoryName)
    }
    
    private func saveImageDocumentDirectory(image: UIImage, imageName: String) {
        let fileManager = FileManager.default
        let path = getDirectoryPath()
        if !fileManager.fileExists(atPath: path) {
            try! fileManager.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
        }
        let url = NSURL(string: path)
        let imagePath = url!.appendingPathComponent(imageName)
        let urlString: String = imagePath!.absoluteString
        let imageData = mImage?.jpegData(compressionQuality: 0.5)
        if fileManager.createFile(atPath: urlString as String, contents: imageData, attributes: nil) {
            print("Arquivo salvo com sucesso")
        } else {
            print("Error ao salvar o arquivo")
        }
    }
    
    
    
    
}
