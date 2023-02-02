
import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var brain : CalculatorModel = CalculatorModel()
    
    func inputToken (token:String) {
        brain.inputToken(input: token)
    }
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack {
                Spacer()
                HStack{
                    Spacer()
                    Text(brain.displayValue)
                        .padding()
                        .font(.system(size: 73))
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                }
                ForEach(Array(brain.getButtonCodeList().enumerated()), id:\.offset){vIdx, line in
                    HStack{
                        let hLast = line.count - 1
                        ForEach(Array(line.enumerated()), id : \.offset) {hIdx, buttonTitle in
                            Button {
                                inputToken(token: buttonTitle)
                            } label: {
                                Text(buttonTitle)
                                    .frame(width : 80, height:80)
                                    .background(hIdx == hLast ? .orange : vIdx == 0 ? .gray : .secondary)
                                    .cornerRadius(40)
                                    .foregroundColor(.white)
                                    .font(.system(size: 33))
                            }
                            
                            
                        }
                    }
                }
                
                
                
            }.padding()
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
