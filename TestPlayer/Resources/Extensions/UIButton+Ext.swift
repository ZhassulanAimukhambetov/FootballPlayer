import UIKit

extension UIButton {
    func configure(with type: BaseButtonType) {
        backgroundColor = type.backgroundColor
        setTitleColor(type.titleColor, for: .normal)
        titleLabel?.font = type.titleFont
        layer.cornerRadius = type.cornerRaduis
    }
}
