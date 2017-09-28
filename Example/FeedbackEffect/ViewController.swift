//
//  ViewController.swift
//  FeedbackEffect
//
//  Created by Joe Fabisevich on 9/7/17.
//  Copyright © 2017 Mergesort. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // These are just 4 combos, you can mix and match and make tons of your own!
    
    @IBAction func urlAndHaptics(_ sender: Any) {
        // Uses the haptic feedback built into iOS along with an
        // alert sound to make a user feel they've finished a unit of work.

        let notificationFeedback = HapticFeedback.notification(.success)

        // We can optionally prepare the generator that relates to the feedback we're trying to activate.
        notificationFeedback.prepare()

        let soundUrl = Bundle.main.url(forResource: "Success", withExtension: "m4a")
        FeedbackEffect.play(sound: soundUrl, feedback: notificationFeedback)
    }
    
    @IBAction func urlAndVibration(_ sender: Any) {
        // Uses the vibration feedback fallback (for users without 3D Touch devices)
        // built into iOS along with an alert sound to make a user feel they've finished
        // a unit of work.

        let selectionVibration = VibrationFeedback.notification
        let soundUrl = Bundle.main.url(forResource: "Success", withExtension: "m4a")
        FeedbackEffect.play(sound: soundUrl, feedback: selectionVibration)
    }

    @IBAction func toneAndHaptics(_ sender: Any) {
        // Uses the haptic feedback built into iOS along with the tap sound
        // to make a user feel like they're really tapping a button.

        let selectionFeedback = HapticFeedback.selection
        selectionFeedback.prepare()
        let tapSound = SoundEffect.tap
        FeedbackEffect.play(sound: tapSound, feedback: selectionFeedback)
    }
    
    @IBAction func toneAndVibration(_ sender: Any) {
        // Uses the vibration feedback fallback (for users without 3D Touch devices)
        // built into iOS along with an alert sound to make a user feel they've finished
        // a unit of work.

        let vibration = VibrationFeedback.notification
        let sound = MessageTone.tweet
        FeedbackEffect.play(sound: sound, feedback: vibration)
    }
    
}

