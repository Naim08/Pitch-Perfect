//
//  RecordSoundsViewController.swift
//  Pitch Perfect
//
//  Created by Md Miah on 12/24/15.
//  Copyright © 2015 Md Miah. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {
    var audioRecorder:AVAudioRecorder!
    var recordedAudio: RecordedAudio!

    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var recordingInProgess: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(animated: Bool) {
        stopButton.hidden = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAudio(sender: UIButton) {
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        
        let recordingName = "my_audio.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        print(filePath)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        try! audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
        recordingInProgess.hidden = false
        stopButton.hidden = false
        //TODO: Show Text
        //TODO: Record users voice
        print("Recording..")
    }
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder!, successfully flag: Bool) {
        if(flag) {
        //TODO: Save the Recording
        recordedAudio = RecordedAudio()
        recordedAudio.filePathUrl = recorder.url
        recordedAudio.title = recorder.url.lastPathComponent
        //TODO: Move to the next Scence - Segue
        self.performSegueWithIdentifier("stopRecording", sender: recordedAudio)
        } else {
            print("Great you finished")
            recordButton.enabled = true
            stopButton.hidden = true
            
        }
        
    }

    @IBAction func stopAudio(sender: UIButton) {
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
        recordingInProgess.hidden = true
    }
}

