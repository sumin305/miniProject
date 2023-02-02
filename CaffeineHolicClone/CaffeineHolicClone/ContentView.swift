//
//  ContentView.swift
//  CaffeineHolicClone
//
//  Created by 이수민 on 2023/01/19.
//

import SwiftUI

struct ContentView: View {
    @State var caffeine : CaffeineModel = CaffeineModel()
    @State private var dailyList : [String] = ["Welcome", "to Caffeine Holic"]
    @State var bgColor : Color = .white
   
    func resetState() {
        dailyList = caffeine.doReset()
        bgColor = .white
    }
    func getRest() {
        dailyList = caffeine.doRest()
        bgColor = .blue
    }
    
    func incCoffee() {
        dailyList = caffeine.doWakening()
        bgColor = .brown
    }
    func incStress() {
        dailyList = caffeine.doStress()
        bgColor = .pink
    }
    var ColorView : some View {
    
        VStack{
            
        }.frame(maxWidth : .infinity, maxHeight : .infinity)
        .background(bgColor)
        .opacity(0.5)
    }
    var DailyView : some View {
        HStack(alignment: .top){
            VStack(alignment: .leading, spacing : 20){
                List(dailyList, id: \.self) { item in
                    Text(item)
                }
                Spacer()
                Text(" ")
            }
            .frame(width : 200)
            .opacity(0.3)
            Spacer()
        }
        .padding()
    }
    var Images : some View {
            Image(caffeine.changeImage())
                .resizable()
                .frame(width: caffeine.imageFrame.width, height: caffeine.imageFrame.height)
        }
    var Buttons : some View {
        VStack {
            HStack(spacing: 20){
                Text("")
                Spacer()
                Button("NEW"){
                    resetState()
                }
            }
            .padding()
            Spacer()
            HStack{
                Button("Get Some Rest"){
                    getRest()
                }.padding()
                Button("Get Some Coffee"){
                    incCoffee()
                }.padding()
                Button("Get Some Stress"){
                    incStress()
                }.padding()
            }
        }
        .padding()
    }
    var body: some View {
            ZStack{
                ColorView
                DailyView
                Images
                Buttons
            }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
