//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Md Miah on 12/29/15.
//  Copyright © 2015 Md Miah. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3")
        if (filePath != nil) {
            print("Success")
        } else {
            print("Wrong Path!\(filePath)")
        }
        let fileUrl = NSURL.fileURLWithPath(filePath!)
        audioPlayer = try! AVAudioPlayer(contentsOfURL: fileUrl)
        audioPlayer.enableRate = true
        print(filePath)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
    @IBAction func playSlowAudio(sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.rate = 0.5
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
    }
    
    @IBAction func playAudioFast(sender: AnyObject) {
        audioPlayer.stop()
        audioPlayer.rate = 1.5
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
    }
  
    
    @IBAction func stopAudio(sender: AnyObject) {
        audioPlayer.stop()
        audioPlayer.currentTime = 0.0
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
