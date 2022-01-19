//
//  AnimationSetting.swift
//  ShowAnimations
//
//  Created by Андрей Евдокимов on 19.01.2022.
//

struct AnimationSetting {
    let name: String!
    let curve: String!
    let force: Double!
    let duration: Double!
    let delay: Double!
    
    static func getAnimationsSettings(from settings: [[KeysForAnimationSettings: String]]) -> [AnimationSetting] {
        var animationSettings: [AnimationSetting] = []

        for setting in settings {
            animationSettings.append(

                AnimationSetting(
                    name: setting[.name],
                    curve: setting[.curve],
                    force: Double(setting[.force] ?? "") ?? 1,
                    duration: Double(setting[.duration] ?? "") ?? 1,
                    delay: Double(setting[.delay] ?? "") ?? 0.3
                )
            )
        }
        
        return animationSettings
    }
}

enum KeysForAnimationSettings: Int {
    case name
    case curve
    case force
    case duration
    case delay
}

