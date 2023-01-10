//
//  ResultsViewCEll.swift
//  Celebrus Task
//
//  Created by John Akpenyi on 10/01/2023.
//

import UIKit
import AVFoundation
import SafariServices

class ResultsViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    var url = ""
    var currentView = UIViewController()
    
    //Speech instation has to be outisde of function or it wont work
    let synth = AVSpeechSynthesizer()
    

    @IBAction func internetBtnPressed(_ sender: Any) {
        let vc = SFSafariViewController(url: URL(string: url)!)
        currentView.present(vc, animated: true)
    }
    
    @IBAction func speakerBtnPressed(_ sender: Any) {
        let utterance = AVSpeechUtterance(string: titleLabel.text!)
        
        utterance.rate = 0.5
        utterance.postUtteranceDelay = 0.2
        utterance.volume = 0.8
        
        let voice = AVSpeechSynthesisVoice(language: "en-GB")
        
        utterance.voice = voice
        
        synth.speak(utterance)
    }
    
}
