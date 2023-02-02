//
//  ContentView.swift
//  SampleSettingApp
//
//  Created by 이수민 on 2023/01/27.
//

import SwiftUI

struct ContentView: View {
    
    @State var searchTarget : String = ""
    @State private var isAirplainModeOn : Bool = false

    
    var body: some View {
        NavigationView {
            List{
                HStack{
                    Image(systemName: "magnifyingglass").foregroundColor(.gray)
                TextField(text: $searchTarget) {
                        Text("검색")
                    }
                Spacer()
                }.listRowBackground(Color("gray1"))                    .frame(width: .infinity, height: 5)
                
                
                Section{
                    profileCell()
                }
                Section{
                    NavigationLink("Apple Arcade 3개월 무료"){
                        Text("구입에 포함된 서비스")
                    }
                }
                    //첫번째 구역
                    Section{
                        ToggleCell(imageName: "airplane",
                                   iconColor: .orange,
                                   cellTitle: "에어플레인 모드", isModeOn: $isAirplainModeOn)
                        plainTextCell(imageName: "wifi",
                                      iconColor: .blue,
                                      cellTitle: "Wi-Fi",
                                      subTitle: "CNU-WiFi",
                                      destination: {Text("wifi 화면")})
                        plainTextCell(imageName: "wifi",
                                      iconColor: .blue,
                                      cellTitle: "Bluetooth",
                                      subTitle: "연결 안 됨",
                                      destination: {Text("블루투스 화면")})
                        plainTextCell(imageName: "antenna.radiowaves.left.and.right",
                                      iconColor: .green,
                                      cellTitle: "셀룰러",
                                      destination: {Text("셀룰러 화면")})
                        plainTextCell(imageName: "personalhotspot",
                                      iconColor: .green,
                                      cellTitle: "개인용 핫스팟",
                                      subTitle: "켬",
                                      destination: {Text("핫스팟 화면")})
                    }
                    //두번째 구역
                    Section{
                        plainTextCell(imageName: "app.badge",
                                      iconColor: .red,
                                      cellTitle: "알림",
                                      destination:{Text("알림화면")})
                        plainTextCell(imageName: "speaker.wave.3.fill",
                                      iconColor: .red,
                                      cellTitle: "사운드 및 햅틱",
                                      destination: {Text("사운드 및 햅틱 화면")})
                        plainTextCell(imageName: "moon.fill",
                                      iconColor: .purple,
                                      cellTitle: "집중 모드",
                                      destination: {Text("집중 모드 화면")})
                        plainTextCell(imageName: "hourglass",
                                      iconColor: .purple,
                                      cellTitle: "스크린 타임") {Text("스크린 타임 화면")}
                    }
        
           
            }.navigationTitle(Text("설정"))

        }
    }
    
    @ViewBuilder
    private func profileCell() -> some View{
        HStack{Image("soom")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width : 60)
                .padding(.leading, 6)
                .background(.gray)
                .clipShape(Circle())
            NavigationLink(
                destination: Text("프로필"))
            {  VStack(alignment: .leading, spacing: 3){
                Text("이수민")
                    .font(.system(size: 24))
                    .fontWeight(.regular)
                Text("Apple ID, iCloud+, 미디어 및 구입 항목")
                    .font(.system(size: 13))
            }
            .padding(.leading,4)
            }
        }
    }
    
    @ViewBuilder
    private func ToggleCell(imageName : String, iconColor : Color, cellTitle : String, isModeOn : Binding<Bool>) -> some View{
        HStack{
            Image(systemName: imageName).resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .padding(.all, 4)
                .background(iconColor)
                .foregroundColor(.white)
                .cornerRadius(6)
            Toggle(cellTitle, isOn: isModeOn)  }
    }

    @ViewBuilder
    private func plainTextCell<V : View>(imageName : String, iconColor : Color, cellTitle : String, subTitle : String? = nil, destination : @escaping () -> V) -> some View{
        HStack{
            Image(systemName: imageName).resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .padding(.all, 4)
                .background(iconColor)
                .foregroundColor(.white)
                .cornerRadius(6)
            NavigationLink {
                destination()
            } label: {
                if let subtitle = subTitle{
                    HStack{
                        Text(cellTitle)
                        Spacer()
                        Text(subTitle!)
                            .foregroundColor(.gray)
                    }
                }else{
                    Text(cellTitle)
                }
                
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
