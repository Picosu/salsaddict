//
//  GenerateQRCodeViewController.swift
//  Salsaddict
//
//  Created by Maxence de Cussac on 10.12.22.
//

import UIKit

class GenerateQRCodeViewController: UIViewController {
    @IBOutlet weak var qrcodeImageView: UIImageView!
    
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)

        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)

            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }

        return nil
    }

    @IBAction func showQRCode(_ sender: Any) {
        qrcodeImageView.image = self.generateQRCode(from: "maxence")
    }
    //    let image = generateQRCode(from: "Hacking with Swift is the best iOS coding tutorial I've ever read!")
}
