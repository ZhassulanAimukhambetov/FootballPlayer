import UIKit

extension UILabel {
    func configure(with type: BaseLabelType) {
        backgroundColor = type.backgroundColor
        textColor = type.titleColor
        font = type.titleFont
        textAlignment = .center
        numberOfLines = 0
    }
}
