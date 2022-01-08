//
//  CustomTabBar.swift
//  Custom-TabBar
//
//  Created by braindamage on 2021/8/5.
//

import UIKit


class CustomTabBar: UITabBar {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(publishButton)
       
    }
    //private 绝对私有，除了在当前类种可以访问之外，其他任何类或者这个类的扩展都不能访问
    //fileprivate 文件私有。。可以在当前类文件种访问。其他文件种不能访问，
    //open 在任何类文件种都能访问
    //internal 默认 可以不写
    
    
    private lazy var publishButton:UIButton =  {
        let publishButton = UIButton(type: .custom)
        let config = UIImage.SymbolConfiguration(scale: .large)
        publishButton.setBackgroundImage(UIImage(systemName: "plus.rectangle.fill",withConfiguration: config), for: .normal)

        publishButton.contentMode = .scaleAspectFill
        return publishButton
        
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder)")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        //当前tabbai的宽度和高度
        
        let width = frame.width
        var height = frame.height - UIDevice.getBottomHeight()
     
      

        
        //设置其他按钮的frame
        let buttonW:CGFloat = width * 0.2
        let buttonH:CGFloat = height
        let buttonY:CGFloat = 0
        publishButton.frame.size = CGSize(width: buttonW * 0.7, height: buttonH * 0.8)
        publishButton.center = CGPoint(x:width*0.5,y:height*0.5 )
        
        var index = 0
        for button in subviews{
            //遇到自定义的跳过
            print("this is \(button)")
            print("button is kind \(!button.isKind(of: NSClassFromString("UITabBarButton")!))")
            if !button.isKind(of: NSClassFromString("UITabBarButton")!){
                continue
            }
            let buttonX = buttonW * CGFloat(index > 1 ? (index+1) : index)
            button.frame = CGRect(x: buttonX, y: buttonY, width: buttonW, height: buttonH)
            
            index+=1
        }
        
    }
    
}

