//
//  IconTextButton.swift
//  Hypets
//
//  Created by Ezana Tesfaye on 3/29/21.
//

import UIKit

final class CustomButton: UIButton {

    private let primaryLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = .white
        return label
        
    }()
    private let iconImageView : UIImageView = {
        let image = UIImageView()
        image.tintColor = .white
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
        
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(primaryLabel)
        addSubview(iconImageView)
        clipsToBounds = true
        layer.cornerRadius = 9
        layer.borderWidth = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(with viewModel: IconTextButtonViewModel ){
        primaryLabel.text = viewModel.text
        setImage(UIImage(named: viewModel.image), for: .normal)
        self.imageView?.contentMode = .scaleToFill
        
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        primaryLabel.sizeToFit()
        let iconSize:CGFloat = 25
        let iconX : CGFloat = (frame.size.width - primaryLabel.frame.size.width - iconSize - 5) / 2
        iconImageView.frame = CGRect(x: iconX, y: (frame.size.height - iconSize)/2, width: iconSize, height: iconSize)
        primaryLabel.frame = CGRect(x: iconX + iconSize + 5, y: 0, width: primaryLabel.frame.size.width, height: frame.size.height)
    }
}
struct IconTextButtonViewModel {
    let text : String
    let image : String
 

}

