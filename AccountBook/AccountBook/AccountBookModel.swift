import Foundation

struct AccountData: Codable{
    
    var category: AccountCategory = .none
    var title: String = ""
    var account: String = "0"
    var date: Date = Date()
    var is_expenditure: Bool = true
    
    init(category: AccountCategory, title: String, account: String, is_expenditure: Bool) {
        self.category = category
        self.title = title
        self.account = account
        self.is_expenditure = is_expenditure
    }

}
enum AccountCategory: String, CaseIterable, Codable{
    case none
    case saving
    case drink
    case food
    case transport
    
    var id: AccountCategory { self }
    
    var DisplayImoji: String {
        switch self{
            case .saving: return "π°"
            case .drink: return "βοΈ"
            case .food: return "π±"
            case .transport: return "π"
            default: return "πΈ"
        }
    }
    var Display: String{
        switch self{
            case .saving: return "λ μλΌκΈ° μ’μλ "
            case .drink: return "λ§μκΈ° μ’μλ "
            case .food: return "λ¨ΉκΈ° μ’μλ "
            default: return "λ μ°κΈ° μ’μλ "
        }
    }
}
