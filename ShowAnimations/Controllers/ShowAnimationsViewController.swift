//
//  ShowAnimationsViewController.swift
//  ShowAnimations
//
//  Created by Андрей Евдокимов on 19.01.2022.
//

import Spring

class ShowAnimationsViewController: UIViewController {
    
    @IBOutlet var animateView: SpringView!
    
    @IBOutlet var animationPropertyTextFields: [UILabel]!
    
    @IBOutlet var toggleAnimationsButton: UIButton!
    
    private let animationData = DataManager()
    
    private var animationSettings: [AnimationSetting] = []
    private var indexOfAnimationSetting = 0
    private var currentAnimationSettings: AnimationSetting!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        animateView.layer.cornerRadius = 14
        toggleAnimationsButton.layer.cornerRadius = 14
        
        createNewAnimations()
        setNewTextForLabels()
    }

    @IBAction func changeAnimation() {
        animateView.animation = currentAnimationSettings.name
        
        animateView.duration = currentAnimationSettings.duration
        animateView.curve = currentAnimationSettings.curve
        animateView.delay = currentAnimationSettings.delay
        animateView.force = currentAnimationSettings.force
        
        animateView.animate()
        
        setPropertyForNextAnimation()
    }
    
    private func createNewAnimations() {
        animationSettings = AnimationSetting.getAnimationsSettings(from: animationData.getAnimations())
        
        currentAnimationSettings = animationSettings.randomElement()
    }
    
    private func setNewTextForLabels() {
        for (index, animationPropertyTextField) in animationPropertyTextFields.enumerated() {
            let keyForAnimationSetting = KeysForAnimationSettings(rawValue: index)
            
            switch keyForAnimationSetting {
            case .name:
                animationPropertyTextField.text = currentAnimationSettings.name
            case .curve:
                animationPropertyTextField.text = currentAnimationSettings.curve
            case .force:
                animationPropertyTextField.text = String(currentAnimationSettings.force)
            case .duration:
                animationPropertyTextField.text = String(currentAnimationSettings.duration)
            case .delay:
                animationPropertyTextField.text = String(currentAnimationSettings.delay)
            case .none:
                print("Error!!!")
            }
        }
    }
    
    private func setPropertyForNextAnimation() {
        currentAnimationSettings = animationSettings.randomElement()
        
        toggleAnimationsButton.setTitle("Run - \(currentAnimationSettings.name ?? "error")", for: .normal)

        setNewTextForLabels()
    }
}
