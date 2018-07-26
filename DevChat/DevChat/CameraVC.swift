//
//  ViewController.swift
//  DevChat
//
//  Created by nic on 11/11/2016.
//  Copyright © 2016 nicksdev. All rights reserved.
//

import UIKit

class CameraVC: AAPLCameraViewController, AAPLCameraVCDelegate {
    @IBOutlet weak var previewView: AAPLPreviewView!

    @IBOutlet weak var cameraBtn: UIButton!
    
    @IBOutlet weak var recordBtn: UIButton!
    
    
    override func viewDidLoad() {
        
        self._previewView = previewView
        
        delagate = self
        
        super.viewDidLoad()

        
        
    
    }

    @IBAction func recordBtnPressed(_ sender: Any) {
        toggleMovieRecording()
    }
   
    @IBAction func changeCameraBtnPressed(_ sender: Any) {
        changeCamera()
    }
    func shouldEnableCameraUI(_ enable: Bool) {
        cameraBtn.isEnabled = enable
        
        
    }
    func shouldEnableRecordUI(_ enable: Bool) {
        recordBtn.isEnabled = enable
    }
    func recordingHasStarted() {
        //
    }
    func canStartRecording() {
        //
    }

}

