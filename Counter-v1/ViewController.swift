import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    @IBAction func nextButton(_ sender: UIButton) {
        let view = CounterViewController()
        let model = CounterModel()
        let presenter = CounterPresenter(view: view, model: model)
        view.presenter = presenter
        navigationController?.pushViewController(view, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

