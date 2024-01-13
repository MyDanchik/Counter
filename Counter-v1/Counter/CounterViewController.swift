import UIKit

class CounterViewController: UIViewController, CounterViewProtocol {
    var presenter: CounterPresenterProtocol!
    
    let decreaseButton: UIButton = {
        let button = UIButton()
        button.setTitle("Уменьшить", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let increaseButton: UIButton = {
        let button = UIButton()
        button.setTitle("Увеличить", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let counterLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.viewDidLoad()
    }
    
    deinit {
        presenter.viewClosed()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(decreaseButton)
        view.addSubview(increaseButton)
        view.addSubview(counterLabel)
        
        decreaseButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        decreaseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        decreaseButton.addTarget(self, action: #selector(decreaseButtonTapped), for: .touchUpInside)
        
        increaseButton.topAnchor.constraint(equalTo: decreaseButton.bottomAnchor, constant: 20).isActive = true
        increaseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        increaseButton.addTarget(self, action: #selector(increaseButtonTapped), for: .touchUpInside)
        
        counterLabel.topAnchor.constraint(equalTo: increaseButton.bottomAnchor, constant: 20).isActive = true
        counterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc func decreaseButtonTapped() {
        presenter.decreaseCounter()
    }
    
    @objc func increaseButtonTapped() {
        presenter.increaseCounter()
    }
    
    func updateCounterValue(_ value: Int) {
        counterLabel.text = "\(value)"
    }
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Внимание", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
