class CounterModel: CounterModelProtocol {
    var currentValue: Int = 0
    
    func increase() {
        currentValue += 1
    }
    
    func decrease() {
        currentValue -= 1
    }
}
