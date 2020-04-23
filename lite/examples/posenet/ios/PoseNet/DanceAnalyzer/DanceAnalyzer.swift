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
                if person[BodyPart.RIGHT_WRIST]!.y > person[BodyPart.RIGHT_ELBOW]!.y {
                    if person[BodyPart.RIGHT_ELBOW]!.y > person[BodyPart.RIGHT_SHOULDER]!.y {
                        return "first"
                    }
                }
            }
        }
        
        else if person[BodyPart.LEFT_WRIST]!.y < person[BodyPart.LEFT_ELBOW]!.y && person[BodyPart.LEFT_ELBOW]!.y < person[BodyPart.LEFT_SHOULDER]!.y {
                if person[BodyPart.RIGHT_WRIST]!.y < person[BodyPart.RIGHT_ELBOW]!.y && person[BodyPart.RIGHT_ELBOW]!.y < person[BodyPart.RIGHT_SHOULDER]!.y {
                    return "fifth"
            }
        }
        //second position
        //check slope of line
        else {
            if (person[BodyPart.LEFT_WRIST]!.x != person[BodyPart.LEFT_SHOULDER]!.x) &&  (person[BodyPart.RIGHT_WRIST]!.x != person[BodyPart.RIGHT_SHOULDER]!.x) {
                let leftSlope = abs((person[BodyPart.LEFT_WRIST]!.y - person[BodyPart.LEFT_SHOULDER]!.y)/(person[BodyPart.LEFT_WRIST]!.x - person[BodyPart.LEFT_SHOULDER]!.x))

                 let rightSlope = abs((person[BodyPart.RIGHT_WRIST]!.y - person[BodyPart.RIGHT_SHOULDER]!.y)/(person[BodyPart.RIGHT_WRIST]!.x - person[BodyPart.RIGHT_SHOULDER]!.x))

                if leftSlope < 0.5 && rightSlope < 0.5 {
                    return "second"
                }
            }
        }


        
        return "Not Ballet"
    }
}
