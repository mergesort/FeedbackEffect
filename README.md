# FeedbackEffect

### A μ library for playing sound effects and providing haptic feedback… with ease.

[![BuddyBuild](https://dashboard.buddybuild.com/api/statusImage?appID=59b1c96ebb97170001f8ebd4&branch=master&build=latest)](https://dashboard.buddybuild.com/apps/59b1c96ebb97170001f8ebd4/build/latest?branch=master)
[![Pod Version](https://img.shields.io/badge/Pod-1.0-6193DF.svg)](https://cocoapods.org/)
![Swift Version](https://img.shields.io/badge/Swift-3.0%20|%203.1%20|%203.2%20|%204.0-brightgreen.svg)
![License MIT](https://img.shields.io/badge/License-MIT-lightgrey.svg) 
![Plaform](https://img.shields.io/badge/Platform-iOS-lightgrey.svg)

### Your app should be special. Other people's apps suck. How do we make your app extra awesome? Feedback and sound effects my friend.

Until now there has not been a unified API to allow you to integrate sound effects _and_ haptic feedback with ease. If you're guessing that now there is, then you're right… now there is.

---

### The API couldn't be simpler.

```swift
let selectionFeedback = HapticFeedback.notification(.success)
let soundUrl = Bundle.main.url(forResource: "Success", withExtension: "m4a")
FeedbackEffect.play(sound: soundUrl, feedback: selectionFeedback)
```

---

### Q&A time

**Q: Is that all?**

A: Yep.

**Q: Really?**

A: Fine, let's go into more detail.

---

### SoundEmitting

There are two kinds of `SoundEmitting`. You can provide a URL to any resource that iOS can play (such as an m4a), or use some common sounds from iOS pre-configured.

Three types conform to `SoundEmitting` out of the box:

- URL
- MessageTone
- SoundEffect

If you'd like to add some more, all you have to do is conform to the protocol. If you find some more that are built into iOS, feel free to file a PR and it'll gladly be accepted.

---

### HapticEmitting

There are two ways to provide a user with haptic feedback. Both `HapticFeedback` and `VibrationFeedback` conform to `HapticEmitting`.

- **HapticFeedback**: Uses iOS's built in `UIFeedbackGenerator` to generate feedback effects. You can use this just how you would normally use `UIImpactGenerator`, `UISelectionGenerator`, and `UINotificationFeedbackGenerator`.

- **VibrationFeedback**: For older devices which do not have a taptic engine. It will generate similar vibration patterns to the `UIFeedbackGenerator`, which unfortunately do not match `UIFeedbackGenerator` exactly one for one but are rather close.

---

### Q&A part II

**Q: Is that it?**

A: Yep. You're on your own from here padawan. Let's leave you with a few more examples to make you feel safe though.

---

### Examples

Uses the haptic feedback built into iOS along with the tap sound to make a user feel like they're really tapping a button.

```swift
let notificationFeedback = HapticFeedback.selection
let tapSound = SoundEffect.tap
FeedbackEffect.play(sound: tapSound, feedback: notificationFeedback)
```

Uses the haptic feedback built into iOS along with an success sound to make a user feel they've completed a unit of work successfully.

```swift
let selectionFeedback = HapticFeedback.notification(.success)
let soundUrl = Bundle.main.url(forResource: "Success", withExtension: "m4a")
FeedbackEffect.play(sound: soundUrl, feedback: selectionFeedback)
```

Uses the vibration feedback fallback (for users without 3D Touch devices) built into iOS along with a pre-configured sound effect.

```swift
let vibration = VibrationFeedback.notification
let sound = MessageTone.tweet
FeedbackEffect.play(sound: sound, feedback: vibration)
```

You can use just one at a time too if you wish. Just provide haptics and leave the sound parameter nil. You can also do the opposite and provide a sound with no haptics.

```swift
let vibration = HapticFeedback.notification(.error)
FeedbackEffect.play(sound: nil, feedback: vibration)
```

---

## Requirements

- iOS 10.0+
- Xcode 8.0+

## Installation
You can use [CocoaPods](http://cocoapods.org/) to install `FeedbackEffect ` by adding it to your `Podfile`:

```ruby
platform :ios, '10.0'
use_frameworks!

pod 'FeedbackEffect'
```

Or install it manually by downloading `FeedbackEffect.swift` and dropping it in your project.

## About me

Hi, I'm [Joe](http://fabisevi.ch) everywhere on the web, but especially on [Twitter](https://twitter.com/mergesort).

## License

See the [license](LICENSE) for more information about how you can use TypedNotifications.
