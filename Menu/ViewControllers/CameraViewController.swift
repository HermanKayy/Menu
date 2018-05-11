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
    
    var video = AVCaptureVideoPreviewLayer()  // This shows where the camera is actually pointing at
    var objectStringValue = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(localAlertTapped))
        localAlert.addGestureRecognizer(tapGesture)
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(localAlertSwiped))
        swipeGesture.direction = .up
        localAlert.addGestureRecognizer(swipeGesture)
        setupTracker()
        setupLocalAlert()
        setupCameraSession()
        setupQRLogo()
        setupQRLabel()
        setupQRURLText()
        
        view.bringSubview(toFront: tracker)
        view.bringSubview(toFront: localAlert)
    }
    
    @objc func localAlertTapped() {
        
        let scrollVC = ScrollViewController()
        let navController = UINavigationController(rootViewController: scrollVC)
        
        switch objectStringValue {
        case "https://f988v.app.goo.gl/sReo":
            scrollVC.categories = TableViewsController.shared.categories
        default:
            guard let url = URL(string: objectStringValue) else { return }
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
        present(navController, animated: true, completion: nil)
    }
    
    @objc func localAlertSwiped() {
        let viewHeight = view.frame.height - view.safeAreaLayoutGuide.layoutFrame.height
        UIView.animate(withDuration: 0.5) {
            self.localAlert.transform = CGAffineTransform(translationX: 0, y: -viewHeight)
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
        
        session.startRunning()
    }
    
    let localAlert: UIView = {
        let la = UIView()
        la.translatesAutoresizingMaskIntoConstraints = false
        la.backgroundColor = UIColor.lightGray
        la.alpha = 0.8
        la.layer.cornerRadius = 15
        return la
    }()
    
    func setupLocalAlert() {
        view.addSubview(localAlert)
        localAlert.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        localAlert.widthAnchor.constraint(equalToConstant: view.frame.width * 0.95).isActive = true
        localAlert.heightAnchor.constraint(equalToConstant: 100).isActive = true
        localAlert.topAnchor.constraint(equalTo: view.topAnchor, constant: -100).isActive = true
    }
    
    let qrLogo: UIImageView = {
        let logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = #imageLiteral(resourceName: "qr")
        logo.contentMode = .scaleAspectFit
        return logo
    }()
    
    func setupQRLogo() {
        localAlert.addSubview(qrLogo)
        qrLogo.leadingAnchor.constraint(equalTo: localAlert.leadingAnchor, constant: 7).isActive = true
        qrLogo.topAnchor.constraint(equalTo: localAlert.topAnchor, constant: 7).isActive = true
        qrLogo.heightAnchor.constraint(equalToConstant: 25).isActive = true
        qrLogo.widthAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    let qrLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = " QR Code"
        label.font = label.font.withSize(15)
        label.textColor = UIColor.black
        return label
    }()
    
    func setupQRLabel() {
        localAlert.addSubview(qrLabel)
        qrLabel.leadingAnchor.constraint(equalTo: qrLogo.trailingAnchor).isActive = true
        qrLabel.topAnchor.constraint(equalTo: localAlert.topAnchor, constant: 7).isActive = true
        qrLabel.trailingAnchor.constraint(equalTo: localAlert.trailingAnchor).isActive = true
        qrLabel.heightAnchor.constraint(equalTo: qrLogo.heightAnchor).isActive = true
    }
    
    let qrURLText: UILabel = {
        let qrLabel = UILabel()
        qrLabel.translatesAutoresizingMaskIntoConstraints = false
        qrLabel.textColor = UIColor.black
        return qrLabel
    }()
    
    func setupQRURLText() {
        localAlert.addSubview(qrURLText)
        qrURLText.leadingAnchor.constraint(equalTo: qrLogo.leadingAnchor).isActive = true
        qrURLText.topAnchor.constraint(equalTo: qrLogo.bottomAnchor).isActive = true
        qrURLText.trailingAnchor.constraint(equalTo: localAlert.trailingAnchor).isActive = true
        qrURLText.bottomAnchor.constraint(equalTo: localAlert.bottomAnchor).isActive = true
    }
    
    let tracker: UIImageView = {
        let track = UIImageView(image: #imageLiteral(resourceName: "tracker"))
        track.contentMode = .scaleAspectFill
        track.translatesAutoresizingMaskIntoConstraints = false
        return track
    }()
    
    func setupTracker() {
        view.addSubview(tracker)
        tracker.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tracker.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.frame.height * 0.05).isActive = true
        tracker.heightAnchor.constraint(equalToConstant: view.frame.height * 0.7).isActive = true
    }
    
    // run this function everytime we get an output
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if metadataObjects.count != 0 { // make sure we have something before processing it
            // cast it to a machinereadablecodeobject
            if let object = metadataObjects[0] as? AVMetadataMachineReadableCodeObject {
                // make sure the object type is a qr code
                if object.type == AVMetadataObject.ObjectType.qr {
                    
                    qrURLText.text = object.stringValue
                    
                    let viewHeight = view.frame.height - view.safeAreaLayoutGuide.layoutFrame.height
                    UIView.animate(withDuration: 0.5) {
                        self.localAlert.transform = CGAffineTransform(translationX: 0, y: viewHeight * 1.1)
                    }
                    
                    if let objectString = object.stringValue {
                        objectStringValue = objectString
                        
                        switch objectString {
                        case "https://f988v.app.goo.gl/sReo":
                            TableViewsController.shared.loadDB(resNumber: 0)
                        default:
                            return
                        }
                        
                    }
                }
            }
        }
    }
}









