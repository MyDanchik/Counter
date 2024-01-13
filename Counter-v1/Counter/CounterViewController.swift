import UIKit

class CounterViewController: UIViewController, CounterViewProtocol {
    var presenter: CounterPresenterProtocol!
    
    let decreaseButton: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.tintColor = UIColor.white
        button.backgroundColor = .continueButton
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        button.widthAnchor.constraint(equalToConstant: 190).isActive = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let increaseButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.tintColor = UIColor.white
        button.backgroundColor = .nextButton
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        button.widthAnchor.constraint(equalToConstant: 190).isActive = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let counterLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 40)
        label.textColor = .white
        label.backgroundColor = .labelSet
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 80).isActive = true
        label.widthAnchor.constraint(equalToConstant: 190).isActive = true
        label.clipsToBounds = true
        label.layer.cornerRadius = 10
        return label
    }()
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Счетчик"
        label.font = UIFont.systemFont(ofSize: 60)
        label.textColor = .white
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 80).isActive = true
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
        view.backgroundColor = .backgroundVC
        
        view.addSubview(decreaseButton)
        view.addSubview(increaseButton)
        view.addSubview(counterLabel)
        view.addSubview(textLabel)
        
        decreaseButton.addTarget(self, action: #selector(decreaseButtonTapped), for: .touchUpInside)
        
        increaseButton.addTarget(self, action: #selector(increaseButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            decreaseButton.topAnchor.constraint(equalTo: increaseButton.bottomAnchor, constant: 20),
            decreaseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            increaseButton.topAnchor.constraint(equalTo: counterLabel.bottomAnchor, constant: 20),
            increaseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            counterLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            counterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            textLabel.bottomAnchor.constraint(equalTo: counterLabel.topAnchor, constant: -50),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
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
