//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by Md Miah on 12/24/15.
//  Copyright © 2015 Md Miah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
        recordButton.backgroundColor = UIColor.blueColor()
        recordingInProgess.hidden = false
        stopButton.hidden = false
        //TODO: Show Text
        //TODO: Record users voice
        print("Recording..")
    }

    @IBAction func stopAudio(sender: UIButton) {
        recordingInProgess.hidden = true
    }
}

