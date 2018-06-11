import UIKit

class UITextFieldWithNumberPad: UITextField {
    private var _value: Int = 0
    let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: nil)
    
    var value: Int {
        get {
            return _value
        }
        set(v) {
            _value = v
            text = String(v)
        }
    }
    
    func setup() {
        value = 0
        keyboardType = .numberPad
        addTarget(self, action: #selector(UITextFieldWithNumberPad.didChangeText), for: .editingChanged)
    }
    
    @objc func didChangeText() {
        let value = Int(text ?? "")
        if let value = value {
            _value = value
        } else {
            self.value = _value
        }
    }
    override var inputAccessoryView: UIView? {
        get {
            let toolbar = UIToolbar()
            toolbar.isTranslucent = true
            toolbar.sizeToFit()
            
            let centerSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            
            toolbar.items = [centerSpace, doneButton]
            
            return toolbar
        }
        set {
        }
    }
    
    override var undoManager: UndoManager? {
        get { return nil }
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
}
