//
//  ViewController.swift
//  emergencyApp
//
//  Created by nic on 25/6/2018.
//  Copyright © 2018 nic. All rights reserved.
//

import UIKit
import AVFoundation


class PhoneButtonController: UIViewController, AVAudioRecorderDelegate {
    
    // app will turn phone into a listening device
    /* need to set permissions for listeniing activity.
        need to make second screen whereby phone shows
        location of previous events*/
    var audioSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!
    
    

    
    let recordButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Tap to Record", for: .normal)
        btn.backgroundColor = UIColor.red
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(recordTapped), for: .touchUpInside)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        btn.isHidden = true
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 125
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    let permissionsTextView: UITextView = {
       let tv = UITextView()
        tv.text = "Please allow app to have permission to record"
        tv.font = UIFont.boldSystemFont(ofSize: 15)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.isHidden = true
        return tv
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationItem.title = "Emergency Help"
        navigationController?.navigationBar.barStyle = .blackTranslucent

        //  if above doesnt change status bar to clear
//        override var preferredStatusBarStyle: UIStatusBarStyle {
//            return .lightContent
//        }
        
        view.backgroundColor = UIColor.white
                            ///        add subviews   ///
        view.addSubview(recordButton)
        view.addSubview(permissionsTextView)
        
        
        
                            ///        add view layout   ///
        setupRecordBtn()
        setupPermissionTV()
        
        // this is for the recording and hopefully it works
        audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try audioSession.setActive(true)
            audioSession.requestRecordPermission() { [unowned self] allowed in
                DispatchQueue.main.async {
                    if allowed {
                        self.recordButton.isHidden = false
                    } else {
                        // failed to record!
                        self.permissionsTextView.isHidden = false
                        
                    }
                }
            }
        } catch {
            // failed to record!
        }
        
        
        
    }
    @objc func recordTapped() {
        if audioRecorder == nil {
            startRecording()
        } else {
            finishRecording(success: true)
        }
        
    }
    
    
    
    func setupRecordBtn() {
        // need x, y, height, width
        
        recordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        recordButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        recordButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        recordButton.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        
        
    }
    func setupPermissionTV() {
        permissionsTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        permissionsTextView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        permissionsTextView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        permissionsTextView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func startRecording() {
        let audioFilename = getDocumentsDirectory().appendingPathComponent("recording.m4a")
        
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder.delegate = self
            audioRecorder.record()
            
            recordButton.setTitle("Tap to stop", for: .normal)
        } catch {
            finishRecording(success: false)
        }

    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
        
    }
    
    func finishRecording(success: Bool) {
        audioRecorder.stop()
        audioRecorder = nil
        
        if success {
            recordButton.setTitle("Tap to re-record", for: .normal)
        } else{
            recordButton.setTitle("Tap to record", for: .normal)
        }
    }



}

