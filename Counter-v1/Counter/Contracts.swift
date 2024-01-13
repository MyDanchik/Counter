protocol CounterViewProtocol: AnyObject {
    func updateCounterValue(_ value: Int)
    func showAlert(message: String)
}

protocol CounterPresenterProtocol {
    func decreaseCounter()
    func increaseCounter()
    func viewDidLoad()
    func viewClosed()
}

protocol CounterModelProtocol {
    var currentValue: Int { get set }
    func increase()
    func decrease()
}
