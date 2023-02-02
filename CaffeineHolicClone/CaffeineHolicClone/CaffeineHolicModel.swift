//
//  CaffeineHolicModel.swift
//  CaffeineHolicClone
//
//  Created by 이수민 on 2023/01/19.
//

import Foundation

class CaffeineModel {
    enum CaffeineState : String{
        case Intro
        case Rest
        case Wakening
        case Stressful
    }
    let originList : [String] = ["Welcome", "to Caffeine Holic"]
    var dailyList : [String] = []
    var currentState : CaffeineState = CaffeineState.Intro
    var imageFrame : CGSize = CGSize(width: 200, height: 200)
    var stateCount : [CaffeineState : Int] = [.Rest:0, .Wakening:0, .Stressful:0]

    func changeState (newState : CaffeineState) -> [String] {
        print(stateCount)
        addDailyList(newState : newState)
        if newState == .Intro{
            
            imageFrame.width = 200
            imageFrame.height = 200
        }
        else if newState != self.currentState { //상태가 변할 경우
            imageFrame.width = 200
            imageFrame.height = 200
            self.currentState = newState
        }
        else{ // 상태가 변하지 않을 경우
            if imageFrame.width < 350{
                imageFrame.width += 10
                imageFrame.height += 10
            }
        }
            return dailyList
    }
    private func addDailyList (newState : CaffeineState) {
        if newState == .Intro{
            dailyList = originList
        }
        else if stateCount[newState] == 0{
            dailyList.insert(newState.rawValue+String(stateCount[newState]!), at:0)
            stateCount[newState]! += 1
            
        }
        else{
            dailyList[dailyList.firstIndex(of: newState.rawValue+String(stateCount[newState]!-1))!] = newState.rawValue+String(stateCount[newState]!)
            stateCount[newState]! += 1
        }
    }
    func changeImage() -> String {
        return "Profile." + currentState.rawValue
    }
    func doReset() -> [String]{
        changeState(newState: .Intro)
    }
    func doRest() -> [String]{
        changeState(newState: .Rest)
    }
    func doWakening() -> [String]{
        changeState(newState: .Wakening)
    }
    func doStress() -> [String]{
        changeState(newState: .Stressful)
    }
}
