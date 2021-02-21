import UIKit

protocol ReusableView: class {
    static var ID: String { get }
}

extension ReusableView where Self: UIView {
    static var ID: String {
        return NSStringFromClass(self)
    }
}

extension UITableViewCell: ReusableView {}
