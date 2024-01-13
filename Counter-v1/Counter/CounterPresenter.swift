class CounterPresenter: CounterPresenterProtocol {
    weak var view: CounterViewProtocol?
    var model: CounterModelProtocol
    
    init(view: CounterViewProtocol, model: CounterModelProtocol) {
        self.view = view
        self.model = model
    }
    
    func decreaseCounter() {
        model.decrease()
        updateView()
    }
    
    func increaseCounter() {
        model.increase()
        updateView()
    }
    
    func viewDidLoad() {
        updateView()
    }
    
    func viewClosed() {
        view = nil
    }
    
    private func updateView() {
        let value = model.currentValue
        if value < 0 {
            view?.showAlert(message: "Значение не может быть меньше 0")
            model.currentValue = 0
        } else if value > 25 {
            view?.showAlert(message: "Достигнут лимит (25)")
            model.currentValue = 25
        } else {
            view?.updateCounterValue(value)
        }
    }
}
