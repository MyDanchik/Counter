import UIKit

class ViewController: UIViewController {
    
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
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Начать", for: .normal)
        button.tintColor = UIColor.white
        button.backgroundColor = .nextButton
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 10
        return button
    }()
    
    func setupUI() {
        view.backgroundColor = .backgroundVC
        view.addSubview(textLabel)
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nextButton.heightAnchor.constraint(equalToConstant: 60),
            nextButton.widthAnchor.constraint(equalToConstant: 190),
            
            textLabel.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -50),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        nextButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        print("Кнопка была нажата")
        let view = CounterViewController()
        let model = CounterModel()
        let presenter = CounterPresenter(view: view, model: model)
        view.presenter = presenter
        navigationController?.pushViewController(view, animated: true)
    }
}
