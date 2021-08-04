//
//  BEButton.swift
//  BEButtonExample
//
//  Created by JefferyYu on 2021/8/4.
//

import UIKit

class BEButton: UIButton {
    enum Position {
        case left, right, top, bottom
    }

    var imageTitleSpace: CGFloat = 0 { didSet { setNeedsLayout() } }
    var imagePositon: Position = .left  { didSet { setNeedsLayout() } }
    
    convenience init(frame: CGRect, title: String? = nil, image: UIImage? = nil, imageTitleSpace space: CGFloat = 0, iamgePositon position: Position = .left) {
        self.init(frame: frame)
        if let title = title { setTitle(title, for: .normal) }
        if let image = image { setImage(image, for: .normal) }
        imageTitleSpace = space
        imagePositon = position
    }
    
    init(imageTitleSpace space: CGFloat = 0, imagePositon position: Position = .left) {
        super.init(frame: .zero)
        imageTitleSpace = space
        imagePositon = position
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialization()
    }
    
    required public init?(coder: NSCoder) { super.init(coder: coder); initialization() }
     
    /// Componets
    private func initialization() {
      
    }
    
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        var imageRect = super.imageRect(forContentRect: contentRect)
        let titleRect = super.titleRect(forContentRect: contentRect)
        if currentTitle == nil {return imageRect }
        switch imagePositon {
        case .left:
            imageRect = imageRectImageAtLeft(forContentRect: contentRect, imageRect: imageRect, titleRect: titleRect)
            break
        case .right: 
            imageRect = imageRectImageAtRight(forContentRect: contentRect, imageRect: imageRect, titleRect: titleRect)
            break
        case .top:
            imageRect = imageRectImageAtTop(forContentRect: contentRect, imageRect: imageRect, titleRect: titleRect)
            break
        case .bottom:
            imageRect = imageRectImageAtBottom(forContentRect: contentRect, imageRect: imageRect, titleRect: titleRect)
            break
        }
        return imageRect
    }
    
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        let imageRect = super.imageRect(forContentRect: contentRect)
        var titleRect = super.titleRect(forContentRect: contentRect)
        if currentImage == nil {return titleRect }
        switch imagePositon {
        case .left:
            titleRect = titleRectImageAtLeft(forContentRect: contentRect, imageRect: imageRect, titleRect: titleRect)
            break
        case .right:
            titleRect = titleRectImageAtRight(forContentRect: contentRect, imageRect: imageRect, titleRect: titleRect)
            break
        case .top:
            titleRect = titleRectImageAtTop(forContentRect: contentRect, imageRect: imageRect, titleRect: titleRect)
            break
        case .bottom:
            titleRect = titleRectImageAtBottom(forContentRect: contentRect, imageRect: imageRect, titleRect: titleRect)
            break
        }
        return titleRect
    }
}
