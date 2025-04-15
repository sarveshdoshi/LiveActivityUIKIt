//
//  ViewController.swift
//  LiveActivityUIKIt
//
//  Created by Sarvesh Doshi on 06/04/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var qrImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientBackground()
        qrImageView.image = generateQRCode(from: "https://github.com/sarveshdoshi")
    }
    
    private func gradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        
        
        gradientLayer.colors = [
            UIColor.systemPurple.withAlphaComponent(0.5).cgColor,
            UIColor.systemPink.withAlphaComponent(0.5).cgColor,
            UIColor.orange.withAlphaComponent(0.5).cgColor
        ]
        
        // Customize the gradient direction
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        
        // Smooth transition
        gradientLayer.locations = [0, 0.75, 1]
        
        // Insert the gradient as the bottom-most layer
        view.layer.insertSublayer(gradientLayer, at: 0)
    }

    
    func generateQRCode(from string: String, size: CGFloat = 200) -> UIImage? {
        let data = string.data(using: .ascii)

        guard let filter = CIFilter(name: "CIQRCodeGenerator") else { return nil }
        filter.setValue(data, forKey: "inputMessage")
        filter.setValue("Q", forKey: "inputCorrectionLevel") // L, M, Q, H

        guard let outputImage = filter.outputImage else { return nil }

        let transform = CGAffineTransform(scaleX: size / outputImage.extent.size.width,
                                          y: size / outputImage.extent.size.height)
        let scaledImage = outputImage.transformed(by: transform)

        return UIImage(ciImage: scaledImage)
    }
}

