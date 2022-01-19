//
//  DataManager.swift
//  ShowAnimations
//
//  Created by Андрей Евдокимов on 19.01.2022.
//

struct DataManager {
    func getAnimations() -> [[KeysForAnimationSettings: String]] {
        [
            [
                .name: "slideUp",
                .curve: "easeIn",
                .force: "1",
                .duration: "2",
                .delay: "0.3"
            ],
            [
                .name: "fadeIn",
                .curve: "linear",
                .force: "2",
                .duration: "1",
                .delay: "0.5"
            ],
            [
                .name: "zoomIn",
                .curve: "easyInOut",
                .force: "1",
                .duration: "1.4",
                .delay: "0"
            ],
            [
                .name: "flash",
                .curve: "easeIn",
                .force: "1",
                .duration: "0.5",
                .delay: "0.9"
            ],
            [
                .name: "fall",
                .curve: "linear",
                .force: "2",
                .duration: "0.9",
                .delay: "0.3"
            ],
            [
                .name: "squeeze",
                .curve: "easyInOut",
                .force: "1.6",
                .duration: "1.3",
                .delay: "0"
            ]
        ]
    }
}
