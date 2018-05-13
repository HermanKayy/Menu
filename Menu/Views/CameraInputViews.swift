//
//  CameraInputViews.swift
//  Menu
//
//  Created by Herman Kwan on 5/12/18.
//  Copyright © 2018 Herman Kwan. All rights reserved.
//

import UIKit

class CameraInputViews: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let tracker: UIImageView = {
        let track = UIImageView(image: #imageLiteral(resourceName: "tracker"))
        track.contentMode = .scaleAspectFill
        track.translatesAutoresizingMaskIntoConstraints = false
        return track
    }()
    
    let localAlert: UIView = {
        let la = UIView()
        la.translatesAutoresizingMaskIntoConstraints = false
        la.backgroundColor = UIColor.lightGray
        la.alpha = 0.8
        la.layer.cornerRadius = 15
        return la
    }()
    
    let qrLogo: UIImageView = {
        let logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = #imageLiteral(resourceName: "qr")
        logo.contentMode = .scaleAspectFit
        return logo
    }()
    
    let qrLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = " QR Code"
        label.font = label.font.withSize(15)
        label.textColor = UIColor.black
        return label
    }()
    
    let qrURLText: UILabel = {
        let qrLabel = UILabel()
        qrLabel.translatesAutoresizingMaskIntoConstraints = false
        qrLabel.textColor = UIColor.black
        return qrLabel
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(tracker)
        tracker.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        tracker.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: frame.height * 0.05).isActive = true
        tracker.heightAnchor.constraint(equalToConstant: frame.height * 0.7).isActive = true
        
        addSubview(localAlert)
        localAlert.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        localAlert.widthAnchor.constraint(equalToConstant: frame.width * 0.95).isActive = true
        localAlert.heightAnchor.constraint(equalToConstant: 100).isActive = true
        localAlert.topAnchor.constraint(equalTo: topAnchor, constant: -100).isActive = true
        
        localAlert.addSubview(qrLogo)
        qrLogo.leadingAnchor.constraint(equalTo: localAlert.leadingAnchor, constant: 7).isActive = true
        qrLogo.topAnchor.constraint(equalTo: localAlert.topAnchor, constant: 7).isActive = true
        qrLogo.heightAnchor.constraint(equalToConstant: 25).isActive = true
        qrLogo.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        localAlert.addSubview(qrLabel)
        qrLabel.leadingAnchor.constraint(equalTo: qrLogo.trailingAnchor).isActive = true
        qrLabel.topAnchor.constraint(equalTo: localAlert.topAnchor, constant: 7).isActive = true
        qrLabel.trailingAnchor.constraint(equalTo: localAlert.trailingAnchor).isActive = true
        qrLabel.heightAnchor.constraint(equalTo: qrLogo.heightAnchor).isActive = true
        
        localAlert.addSubview(qrURLText)
        qrURLText.leadingAnchor.constraint(equalTo: qrLogo.leadingAnchor).isActive = true
        qrURLText.topAnchor.constraint(equalTo: qrLogo.bottomAnchor).isActive = true
        qrURLText.trailingAnchor.constraint(equalTo: localAlert.trailingAnchor).isActive = true
        qrURLText.bottomAnchor.constraint(equalTo: localAlert.bottomAnchor).isActive = true
        
        
    }
    
}
