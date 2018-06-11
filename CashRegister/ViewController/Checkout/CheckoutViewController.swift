import UIKit

class CheckoutViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var payField: UITextFieldWithNumberPad!
    @IBOutlet weak var changeLabel: UILabel!
    
    var checkout: Checkout!
    
    class func viewController(with checkout: Checkout) -> CheckoutViewController {
        let storyboard = UIStoryboard(name: String(describing: self), bundle: nil)
        guard let viewController = storyboard.instantiateInitialViewController() as? CheckoutViewController else {
            fatalError()
        }
        viewController.checkout = checkout
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assert(checkout != nil)
        
        payField.doneButton.target = self
        payField.doneButton.action = #selector(type(of: self).textFieldShouldReturn(_:))
        
        payField.value = checkout.total()
        totalLabel.text = payField.text
        changeLabel.text = "0"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        payField.becomeFirstResponder()
        payField.selectAll(nil)
    }
    
    @IBAction func editingChenged(_ sender: Any) {
        changeLabel.text =  String(payField.value - checkout.total())
    }
}

extension CheckoutViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        DatabaseManager.shared().write(checkout)
        navigationController?.popViewController(animated: true)
        return true
    }
}
