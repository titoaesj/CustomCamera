//
//  PreviewViewController.swift
//  CustomCamera
//
//  Created by Tito Albino Evangelista da Silva Junior on 09/11/18.
//  Copyright © 2018 br.com.titoaesj. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController {
    
    @IBOutlet weak var previewImageView: UIImageView!
    
    private let directoryName = "customCamera"
    var fileName : String?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if fileName != nil {
            getPreViewImage(imageName: fileName!)
        }
    }
    
    private func getDirectoryPath() -> String {
        return (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(directoryName)
    }
    
    private func getPreViewImage(imageName: String){
        let fileManager = FileManager.default
        let imagePAth = (self.getDirectoryPath() as NSString).appendingPathComponent(imageName)
        if fileManager.fileExists(atPath: imagePAth){
            self.previewImageView.image = UIImage(contentsOfFile: imagePAth)
            
            UIImageWriteToSavedPhotosAlbum( self.previewImageView.image!, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)

        }else{
            print("Sem imagem")
        }
        
    }

    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            // we got back an error!
            let ac = UIAlertController(title: "Ocorreu um error ao salvar", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Sucesso!", message: "Imagem adicionada ao album.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    
}
