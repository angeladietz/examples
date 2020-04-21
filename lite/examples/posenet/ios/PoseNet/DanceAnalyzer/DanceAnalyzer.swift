//
//  DanceAnalyzer.swift
//  PoseNet
//
//  Created by Angela Dietz on 2020-04-20.
//  Copyright © 2020 tensorflow. All rights reserved.
//

import UIKit

class DanceAnalyzer: NSObject {

    func identifyPose(result: Result) -> String {
        let dots = result.dots
        var person = [BodyPart: CGPoint]()
        
        for (index, part) in BodyPart.allCases.enumerated() {
            person[part] = dots[index]
        }
        
        if person[BodyPart.LEFT_WRIST]!.y > person[BodyPart.LEFT_ELBOW]!.y {
            if person[BodyPart.LEFT_ELBOW]!.y > person[BodyPart.LEFT_SHOULDER]!.y {
                return "first position"
            }
        }
        
        
        return "NOT first position"
    }
}
