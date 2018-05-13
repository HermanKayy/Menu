//
//  CameraViewController.swift
//  Menu
//
//  Created by Herman Kwan on 4/27/18.
//  Copyright © 2018 Herman Kwan. All rights reserved.
//

import UIKit
import AVFoundation
import Firebase

class CameraViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    let cameraInputViews = CameraInputViews(frame: UIScreen.main.bounds)
    var video = AVCaptureVideoPreviewLayer()  // This shows where the camera is actually pointing at
    var objectStringValue = "" 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(cameraInputViews)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(localAlertTapped))
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(localAlertSwiped))
        swipeGesture.direction = .up
        
        cameraInputViews.localAlert.addGestureRecognizer(tapGesture)
        cameraInputViews.localAlert.addGestureRecognizer(swipeGesture)
        setupCameraSession()

        view.bringSubview(toFront: cameraInputViews)
    }
    
    @objc func localAlertTapped() {
        
        let scrollVC = ScrollViewController()
        let navController = UINavigationController(rootViewController: scrollVC)
        
        switch objectStringValue {
        case "https://f988v.app.goo.gl/sReo":
            scrollVC.categories = RestaurantController.shared.categories
        default:
            guard let url = URL(string: objectStringValue) else { return }
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
        present(navController, animated: true, completion: nil)
    }
    
    @objc func localAlertSwiped() {
        let viewHeight = view.frame.height - view.safeAreaLayoutGuide.layoutFrame.height
        UIView.animate(withDuration: 0.5) {
            self.cameraInputViews.localAlert.transform = CGAffineTransform(translationX: 0, y: -viewHeight)
        }
    }
    
    func setupCameraSession() {
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
        view.bringSubview(toFront: cameraInputViews.tracker)
        session.startRunning()
    }
    
    // run this function everytime we get an output
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if metadataObjects.count != 0 { // make sure we have something before processing it
            // cast it to a machinereadablecodeobject
            if let object = metadataObjects[0] as? AVMetadataMachineReadableCodeObject {
                // make sure the object type is a qr code
                if object.type == AVMetadataObject.ObjectType.qr {
                    
                    cameraInputViews.qrURLText.text = object.stringValue
                    
                    let viewHeight = view.frame.height - view.safeAreaLayoutGuide.layoutFrame.height
                    UIView.animate(withDuration: 0.5) {
                        self.cameraInputViews.localAlert.transform = CGAffineTransform(translationX: 0, y: viewHeight * 1.1)
                    }
                    
                    if let objectString = object.stringValue {
                        objectStringValue = objectString
                        
                        switch objectString {
                        case "https://f988v.app.goo.gl/sReo":
                            RestaurantController.shared.loadDB(resNumber: 0)
                        default:
                            return
                        }
                    }
                }
            }
        }
    }
}









