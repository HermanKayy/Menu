//
//  CameraViewController.swift
//  Menu
//
//  Created by Herman Kwan on 4/27/18.
//  Copyright © 2018 Herman Kwan. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    var video = AVCaptureVideoPreviewLayer()  // This shows where the camera is actually pointing at
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue
//        setupScannerBox()
        setupTracker()
        
        let session = AVCaptureSession()    // Creating session to convert input into output
        let captureDevice = AVCaptureDevice.default(for: AVMediaType.video) // Register our camera as the capture device
        
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice!) // taking input from our capture device
            session.addInput(input) // providing our session with raw materials which is the input
        } catch {
            print("Error:", error)
        }
        
        let output = AVCaptureMetadataOutput()  // create output to recognize a QR Code
        session.addOutput(output)   // Add to session
        
        // Define where our output will be processed from our session
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        
        output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]   // What kind of output, we just want qr code
        
        video = AVCaptureVideoPreviewLayer(session: session)
        video.frame = view.layer.bounds // fill the whole screen with the video
        video.videoGravity = AVLayerVideoGravity.resizeAspectFill
        view.layer.addSublayer(video)   // add the video, why subLayer?
        view.bringSubview(toFront: tracker)
        view.bringSubview(toFront: scannerBox)

        
        session.startRunning()
        
    }
    
    let scannerBox: UIView = {
        let sb = UIView()
        sb.translatesAutoresizingMaskIntoConstraints = false
        sb.backgroundColor = UIColor.clear
        sb.layer.borderWidth = 2
        sb.layer.borderColor = UIColor.white.cgColor
        sb.layer.cornerRadius = 10
        return sb
    }()   
    
    let tracker: UIImageView = {
        let track = UIImageView(image: #imageLiteral(resourceName: "Tracker"))
        track.translatesAutoresizingMaskIntoConstraints = false
        return track
    }()
    
    func setupTracker() {
        view.addSubview(tracker)
        tracker.heightAnchor.constraint(equalToConstant: view.frame.height * 0.3).isActive = true
        tracker.widthAnchor.constraint(equalToConstant: view.frame.width * 0.9).isActive = true
        tracker.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tracker.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func setupScannerBox() {
        view.addSubview(scannerBox)
        
        scannerBox.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scannerBox.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        scannerBox.heightAnchor.constraint(equalToConstant: 200).isActive = true
        scannerBox.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    // run this function everytime we get an output
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if metadataObjects.count != 0 { // make sure we have something before processing it
            // cast it to a machinereadablecodeobject
            if let object = metadataObjects[0] as? AVMetadataMachineReadableCodeObject {
                // make sure the object type is a qr code
                if object.type == AVMetadataObject.ObjectType.qr {
                    
                    // display a message, either to retake or copy the code
                    let alert = UIAlertController(title: "QR Code", message: object.stringValue, preferredStyle: .alert)
                    let retake = UIAlertAction(title: "Retake", style: .default, handler: nil)
                    let copy = UIAlertAction(title: "Copy", style: .default) { (_) in
                        UIPasteboard.general.string = object.stringValue
                    }
                    alert.addAction(retake)
                    alert.addAction(copy)
                    present(alert, animated: true, completion: nil)
                }
            }
        }
    }

}
