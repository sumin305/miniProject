import Foundation

func changeSign (operand : Double) -> Double {
    return -operand
}
func multiply(op1 : Double, op2 : Double) -> Double {
    return op1 * op2
}
class CalculatorModel : ObservableObject{
    //state가 오리지널 데이터 bind는 state를 가리키는 일종의 포인터 -> 단순 변수위주
    //observableObject : 객체를 가르킴(객체 참조)
    //Published : observableObject의 object
    //Published가 바뀌면 밖에서 알려줘라
    
    @Published var displayValue : String = "0"
 
    private let buttonCodeVertical : [[String]] = [
        ["C", "±", "%", "÷"],
        ["7", "8", "9", "×"],
        ["4", "5", "6", "−"],
        ["1", "2", "3", "+"],
        ["0", ".", "="]
    ]
    
    private let buttonCodeHorizontal : [[String]] = [
        ["(",   ")",    "mc",   "m+",   "m-",   "mr",   "C",    "±",    "%",    "÷"],
        ["2nd", "x²",   "x³",   "xʸ",   "eˣ",   "10ˣ",  "7",    "8",    "9",    "×"],
        ["√x",  "2/x",  "3/x",  "y/x",  "ln",   "log10","4",    "5",    "6",    "−"],
        ["x!",  "sin",  "cos",  "tan",  "e",    "EE",   "1",    "2",    "3",    "+"],
        ["Rad", "sinh", "cosh", "tanh", "pi",   "Rand", "0",    "0",    ".",    "="]
            ]
    
    func getButtonCodeList() -> [[String]] {
        return buttonCodeVertical
    }
    private enum Operation {
        case unaryOperation ((Double) -> Double)
        case binaryOperation((Double,Double) -> Double)
        case equals
    }
    private var operations : Dictionary<String, Operation> = [
        "±" : Operation.unaryOperation(changeSign),
        "%" : Operation.unaryOperation({$0 / 100.0}),
        "×" : Operation.binaryOperation({$0 * $1}),
        "+" : Operation.binaryOperation({$0 + $1}),
        "−" : Operation.binaryOperation({$0 - $1}),
        "÷" : Operation.binaryOperation({$0 / $1}),
        "=" : Operation.equals
    ]
    
    private var pbo : PendingBinaryOperation?
    
    private struct PendingBinaryOperation {
        let function : (Double, Double) -> Double
        let firstOperand : Double
        
        func perform (with secondOperand : Double) -> Double {
            return function(firstOperand,secondOperand)
        }
    }
    private func performPendingbinaryOperation() {
        if let pend = pbo, let accum = accumulator {
            accumulator = pend.perform(with: accum)
            pbo = nil
        }
    }
    func inputToken(input : String) {
        if let _ = Int(input) {
            inputDigit(input : input)
        }else{
            if typing, let value = Double(displayValue){
                setOperand(operand: value)
                typing = false
            }
            performOperation(input)
            if let value = result{
                displayValue = String(value)
            }
          
        }
    }
    
    private var typing = false
    private func inputDigit (input:String) {
        if typing {
            let textCurrentlyInDisplay = displayValue
            displayValue = textCurrentlyInDisplay + input
        }else {
            displayValue = input
            typing = true
        }
    }
    
    private var accumulator : Double?
    
    private func performOperation (_ symbol : String) {
        if let operation = operations[symbol] {
            switch operation {
                case .unaryOperation(let function) :
                    if accumulator != nil {
                        accumulator = function(accumulator!)
                    }
                case .binaryOperation(let function) :
                    if accumulator != nil {
                        pbo = PendingBinaryOperation(function: function, firstOperand: accumulator!)
                        accumulator = nil
                    }
                case .equals:
                    performPendingbinaryOperation()
                    
            }
        }
    }
    private func setOperand(operand: Double) {
        accumulator = operand
    }
    private var result : Double? {
        get{
            return accumulator
        }
    }
    
}
