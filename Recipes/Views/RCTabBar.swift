//
//  CustomTabBar.swift

import UIKit

class RCTabBar: UITabBar {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(publishButton)
    }
    
    private lazy var publishButton: UIButton =  {
        let publishButton = UIButton(type: .custom)
        let config = UIImage.SymbolConfiguration(scale: .large)
        publishButton.setBackgroundImage(UIImage(systemName: "plus.circle.fill", withConfiguration: config), for: .normal)
        publishButton.contentMode = .scaleAspectFill
        return publishButton
        
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder)")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let width = frame.width
        let height = frame.height - UIDevice.getBottomHeight()
        
        let buttonW:CGFloat = width * 0.2
        let buttonH:CGFloat = height
        let buttonY:CGFloat = 0
        publishButton.frame.size = CGSize(width: buttonW * 0.6, height: buttonW * 0.6)
        publishButton.center = CGPoint(x: width * 0.5, y: height * 0.5 )
        
        var index = 0
        for button in subviews{
            if !button.isKind(of: NSClassFromString("UITabBarButton")!){
                continue
            }
            let buttonX = buttonW * CGFloat(index > 1 ? (index + 1) : index)
            button.frame = CGRect(x: buttonX, y: buttonY, width: buttonW, height: buttonH)
            
            index += 1
        }
        
    }
    
}

