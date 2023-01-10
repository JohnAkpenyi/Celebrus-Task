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
    let synth = AVSpeechSynthesizer()
    var url = ""
    var currentView = UIViewController()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func internetBtnPressed(_ sender: Any) {
        let vc = SFSafariViewController(url: URL(string: url)!)
        currentView.present(vc, animated: true)
    }
    
    @IBAction func speakerBtnPressed(_ sender: Any) {
        let utterance = AVSpeechUtterance(string: titleLabel.text!)
        
        utterance.rate = 0.57
        utterance.pitchMultiplier = 0.8
        utterance.postUtteranceDelay = 0.2
        utterance.volume = 0.8
        
        let voice = AVSpeechSynthesisVoice(language: "en-GB")
        
        utterance.voice = voice
        
        synth.speak(utterance)
    }
    
}
