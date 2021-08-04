//
//  BEButton+Helper.swift
//  BEButtonExample
//
//  Created by JefferyYu on 2021/8/4.
//

import Foundation
extension BEButton {
    // Left
    func imageRectImageAtLeft(forContentRect contentRect: CGRect, imageRect: CGRect, titleRect: CGRect) -> CGRect {
        var imageOrigin: CGPoint = imageRect.origin
    
        switch contentHorizontalAlignment {
        case .center:
            imageOrigin.x -= imageTitleSpace*0.5
            break
        case .right, .trailing:
            imageOrigin.x -= imageTitleSpace  // 右对齐的时候，label会完全贴右边，所以就让图片的x往左偏移imageTitleSpace 就行了
            break
        case .fill:
            imageOrigin.x -= imageTitleSpace*0.5
            break
        default: // 左对齐 图片不动 label动
            break
        }
        return CGRect(origin: imageOrigin, size: imageRect.size)
    }
    
    func titleRectImageAtLeft(forContentRect contentRect: CGRect, imageRect: CGRect, titleRect: CGRect) -> CGRect {
        var titleOrigin: CGPoint = titleRect.origin
    
        switch contentHorizontalAlignment {
        case .center:
            titleOrigin.x += imageTitleSpace*0.5
            break
        case .left, .leading:
            titleOrigin.x += imageTitleSpace  // 左对齐的时候，image会完全贴左边，所以就让label的x往右偏移imageTitleSpace 就行了
            break
        case .fill:
            titleOrigin.x += imageTitleSpace*0.5
            break
        default: // 右对齐 图片动 label不动
            break
        }
        return CGRect(origin: titleOrigin, size: titleRect.size)
    }
    
    // Right
    func imageRectImageAtRight(forContentRect contentRect: CGRect, imageRect: CGRect, titleRect: CGRect) -> CGRect {
        var imageOrigin: CGPoint = imageRect.origin
        let buttonWidth = contentRect.width + contentEdgeInsets.left + contentEdgeInsets.right
        switch contentHorizontalAlignment {
        case .center:
            //(contentRect.size.width - imageEdgeInsets.left - imageEdgeInsets.right - (imageRect.width + titleRect.width))/2.0  --> 起始点x
            imageOrigin.x = (contentRect.size.width - imageEdgeInsets.left - imageEdgeInsets.right - (imageRect.width + titleRect.width))/2.0 + titleRect.width + contentEdgeInsets.left + imageEdgeInsets.left + imageTitleSpace * 0.5
            break
        case .left, .leading:
            imageOrigin.x = contentEdgeInsets.left + imageEdgeInsets.left + titleRect.width + imageTitleSpace
            break
        case .right, .trailing:
            // 注意image的大小要使用系统计算的结果，这里不能使用self.currentImage.size.width，当imageEdgeInsets的left过大时可以进行测试
            imageOrigin.x = buttonWidth - imageRect.width - imageEdgeInsets.right - contentEdgeInsets.right
            break
        case .fill:
            imageOrigin.x = buttonWidth - imageRect.width - imageEdgeInsets.right - contentEdgeInsets.right + imageTitleSpace*0.5
            break
        @unknown default: break
        }
        return CGRect(origin: imageOrigin, size: imageRect.size)
    }
    
    func titleRectImageAtRight(forContentRect contentRect: CGRect, imageRect: CGRect, titleRect: CGRect) -> CGRect {
        var titleOrigin: CGPoint = titleRect.origin
        let buttonWidth = contentRect.width + contentEdgeInsets.left + contentEdgeInsets.right
        switch contentHorizontalAlignment {
        case .center:
            titleOrigin.x += (contentRect.size.width - imageEdgeInsets.left - imageEdgeInsets.right - (imageRect.width + titleRect.width))/2.0 + contentEdgeInsets.left + titleEdgeInsets.left - imageTitleSpace*0.5
            break
        case .left, .leading:
            titleOrigin.x = contentEdgeInsets.left + titleEdgeInsets.left
            break
        case .right, .trailing:
            //这里必须使用self.currentImage的宽度。不能使用imageSize.width，因为图片可能会被压缩或者拉伸，例如当图片的imageEdgeInsets的right设置过大，图片的宽度就会被压缩，这时的图片宽度不是我们要的
            titleOrigin.x = buttonWidth - (currentImage?.size.width ?? 0) - titleRect.width - titleEdgeInsets.right - contentEdgeInsets.right - imageTitleSpace
            break
        case .fill:
            titleOrigin.x = buttonWidth - (currentImage?.size.width ?? 0) - titleRect.width - titleEdgeInsets.right - contentEdgeInsets.right - imageTitleSpace*0.5
            break
        @unknown default: break
        }
        return CGRect(origin: titleOrigin, size: titleRect.size)
    }
    
    // top
    func imageRectImageAtTop(forContentRect contentRect: CGRect, imageRect: CGRect, titleRect: CGRect) -> CGRect {
        var imageOrigin: CGPoint = imageRect.origin
        var imageSize: CGSize = imageRect.size
        let buttonWidth = contentRect.width + contentEdgeInsets.left + contentEdgeInsets.right
        switch contentHorizontalAlignment {
        case .center:
            //(contentRect.size.width - imageEdgeInsets.left - imageEdgeInsets.right - (imageRect.width + titleRect.width))/2.0  --> 起始点x
            imageOrigin.x = (contentRect.size.width - imageEdgeInsets.left - imageEdgeInsets.right - imageRect.width )/2.0 + contentEdgeInsets.left + imageEdgeInsets.left
            break
        case .left, .leading:
            imageOrigin.x = contentEdgeInsets.left + imageEdgeInsets.left
            break
        case .right, .trailing:
            imageOrigin.x = buttonWidth - imageRect.width - imageEdgeInsets.right - contentEdgeInsets.right
            break
        case .fill:
            imageOrigin.x = imageEdgeInsets.left + contentEdgeInsets.left
            imageSize.width = buttonWidth
            break
        @unknown default: break
        }
        
        
        switch contentVerticalAlignment {
        case .center:
            imageOrigin.y = (contentRect.height - (imageRect.height + titleRect.height) - imageEdgeInsets.bottom - imageEdgeInsets.top)/2 + imageEdgeInsets.top + contentEdgeInsets.top - imageTitleSpace*0.5
            break
        case .top:
            imageOrigin.y = contentEdgeInsets.top + imageEdgeInsets.top - imageTitleSpace*0.5
          break
        case .bottom:
            imageOrigin.y = contentRect.height - (imageRect.height + titleRect.height) - imageEdgeInsets.bottom - contentEdgeInsets.bottom - imageTitleSpace*0.5
            break
        case .fill:
            imageOrigin.y = contentEdgeInsets.top + imageEdgeInsets.top - imageTitleSpace*0.5
            imageSize.height = contentRect.height - imageEdgeInsets.bottom - imageEdgeInsets.top
            break
        default:
            break
        }
        
        
        return CGRect(origin: imageOrigin, size: imageSize)
    }
    
    func titleRectImageAtTop(forContentRect contentRect: CGRect, imageRect: CGRect, titleRect: CGRect) -> CGRect {
        var titleOrigin: CGPoint = titleRect.origin
        let titleSize = caculateTitleSize(titleSize: titleRect.size)
        let buttonWidth = contentRect.width + contentEdgeInsets.left + contentEdgeInsets.right
        let buttonHeight = contentRect.height + contentEdgeInsets.top + contentEdgeInsets.bottom
        
        switch contentHorizontalAlignment {
        case .center:
            titleOrigin.x = (buttonWidth - titleSize.width)/2 + contentEdgeInsets.left + titleEdgeInsets.left
            break
        case .left, .leading:
            titleOrigin.x = contentEdgeInsets.left + titleEdgeInsets.left
            break
        case .right, .trailing:
            titleOrigin.x = buttonWidth - titleSize.width - contentEdgeInsets.right - titleEdgeInsets.right
            break
        case .fill:
            titleOrigin.x = contentEdgeInsets.left + titleEdgeInsets.left
            break
        default:
            break
        }
        
        switch contentVerticalAlignment {
        case .center:
            titleOrigin.y = (contentRect.height - (imageRect.height + titleRect.height) - titleEdgeInsets.bottom - titleEdgeInsets.top)/2 + imageRect.height + titleEdgeInsets.top + imageTitleSpace*0.5
            break
        case .top:
            titleOrigin.y = imageRect.height + titleEdgeInsets.top + contentEdgeInsets.top + imageTitleSpace*0.5
            break
        case .bottom:
            titleOrigin.y = buttonHeight - imageRect.height - titleEdgeInsets.bottom - contentEdgeInsets.bottom + imageTitleSpace*0.5
            break
        case .fill:
            titleOrigin.y = buttonHeight - imageRect.height - titleEdgeInsets.bottom - contentEdgeInsets.bottom + imageTitleSpace*0.5
            break
        default:
            break
        }
        
        return CGRect(origin: titleOrigin, size: titleRect.size)
    }
    
    // bottom
    func imageRectImageAtBottom(forContentRect contentRect: CGRect, imageRect: CGRect, titleRect: CGRect) -> CGRect {
        var imageOrigin: CGPoint = imageRect.origin
        var imageSize: CGSize = imageRect.size
        let buttonWidth = contentRect.width + contentEdgeInsets.left + contentEdgeInsets.right
        switch contentHorizontalAlignment {
        case .center:
            //(contentRect.size.width - imageEdgeInsets.left - imageEdgeInsets.right - (imageRect.width + titleRect.width))/2.0  --> 起始点x
            imageOrigin.x = (contentRect.size.width - imageEdgeInsets.left - imageEdgeInsets.right - imageRect.width )/2.0 + contentEdgeInsets.left + imageEdgeInsets.left
            break
        case .left, .leading:
            imageOrigin.x = contentEdgeInsets.left + imageEdgeInsets.left
            break
        case .right, .trailing:
            imageOrigin.x = buttonWidth - imageRect.width - imageEdgeInsets.right - contentEdgeInsets.right
            break
        case .fill:
            imageOrigin.x = imageEdgeInsets.left + contentEdgeInsets.left
            imageSize.width = buttonWidth
            break
        @unknown default: break
        }
        
        
        switch contentVerticalAlignment {
        case .center:
            imageOrigin.y = (contentRect.height - (imageRect.height + titleRect.height) - imageEdgeInsets.bottom - imageEdgeInsets.top)/2 + titleRect.height + imageEdgeInsets.top + contentEdgeInsets.top + imageTitleSpace*0.5
            break
        case .top:
            imageOrigin.y = contentEdgeInsets.top + imageEdgeInsets.top + titleRect.height + imageTitleSpace*0.5
          break
        case .bottom:
            imageOrigin.y = contentRect.height - imageRect.height  - imageEdgeInsets.bottom - contentEdgeInsets.bottom + imageTitleSpace*0.5
            break
        case .fill:
            imageOrigin.y = contentRect.height - imageRect.height  - imageEdgeInsets.bottom - contentEdgeInsets.bottom + imageTitleSpace*0.5
            imageSize.height = contentRect.height - imageEdgeInsets.bottom - imageEdgeInsets.top - caculateTitleSize(titleSize: titleRect.size).height
            break
        default:
            break
        }
        
        
        return CGRect(origin: imageOrigin, size: imageSize)
    }
    
    func titleRectImageAtBottom(forContentRect contentRect: CGRect, imageRect: CGRect, titleRect: CGRect) -> CGRect {
        var titleOrigin: CGPoint = titleRect.origin
        let titleSize = caculateTitleSize(titleSize: titleRect.size)
        let buttonWidth = contentRect.width + contentEdgeInsets.left + contentEdgeInsets.right
        let buttonHeight = contentRect.height + contentEdgeInsets.top + contentEdgeInsets.bottom
        
        switch contentHorizontalAlignment {
        case .center:
            titleOrigin.x = (buttonWidth - titleSize.width)/2 + contentEdgeInsets.left + titleEdgeInsets.left
            break
        case .left, .leading:
            titleOrigin.x = contentEdgeInsets.left + titleEdgeInsets.left
            break
        case .right, .trailing:
            titleOrigin.x = buttonWidth - titleSize.width - contentEdgeInsets.right - titleEdgeInsets.right
            break
        case .fill:
            titleOrigin.x = contentEdgeInsets.left + titleEdgeInsets.left
            break
        default:
            break
        }
        
        switch contentVerticalAlignment {
        case .center:
            titleOrigin.y = (contentRect.height - (imageRect.height + titleRect.height) - titleEdgeInsets.bottom - titleEdgeInsets.top)/2 + contentEdgeInsets.top + titleEdgeInsets.top - imageTitleSpace*0.5
            break
        case .top:
            titleOrigin.y = titleEdgeInsets.top + contentEdgeInsets.top - imageTitleSpace*0.5
            break
        case .bottom:
            titleOrigin.y = buttonHeight - imageRect.height - titleRect.height - titleEdgeInsets.bottom - contentEdgeInsets.bottom - imageTitleSpace*0.5
            break
        case .fill:
            titleOrigin.y = titleEdgeInsets.top + contentEdgeInsets.top - imageTitleSpace*0.5
            break
        default:
            break
        }
        
        return CGRect(origin: titleOrigin, size: titleRect.size)
    }
    
    
    private func caculateTitleSize(titleSize: CGSize) -> CGSize {
        var myTitleSize = titleSize
        let titleLabel = findTitleLabel()
        if titleLabel == nil {
            myTitleSize =  NSString(string: currentTitle!).size(withAttributes:[ NSAttributedString.Key.font : UIFont.systemFont(ofSize: UIFont.buttonFontSize) ])
        } else {
            myTitleSize = titleLabel!.intrinsicContentSize
        }
        return myTitleSize
    }
    
    private func findTitleLabel() -> UILabel? {
        
        for view in subviews {
            if view.isKind(of: NSClassFromString("UIButtonLabel") ?? UILabel.self) {
                return view as? UILabel
            }
        }
        return nil
    }
}
