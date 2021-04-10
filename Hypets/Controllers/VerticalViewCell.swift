import UIKit

class VerticalViewCell: UICollectionViewCell {
    
    static let identifier = "VerticalViewCell"
    
    private let backButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 10, y: 50, width: 100, height: 90))
        button.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        return button
    }()
    
    private let textLabel: UILabel = {
        let label = UILabel()
        let color = UIColor(hex: "#35b8ce")
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: "Avenir-Roman", size: 25)
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
   
        return label
    }()
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with model : DogFacts){
        let size = contentView.frame.size.width / 7
        let width = contentView.frame.size.width
        let height = contentView.frame.size.height / 2
        textLabel.frame = CGRect(x: 0, y: 0, width: width-size, height: height)
        textLabel.center = self.contentView.center
        textLabel.text = model.fact
        
        textLabel.numberOfLines = 0
        contentView.addSubview(textLabel)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        textLabel.text = nil
    }
    
}
extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}
