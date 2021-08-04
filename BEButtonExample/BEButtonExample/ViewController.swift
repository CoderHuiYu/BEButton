//
//  ViewController.swift
//  BEButtonExample
//
//  Created by JefferyYu on 2021/8/4.
//

import UIKit

class ViewController: UIViewController {
    var btn = SPButton(imagePosition: .bottom)
    var beBtn = BEButton(imageTitleSpace: 20, imagePositon: .bottom)
    var sBtn = UIButton()
    var height: CGFloat = 80
    override func viewDidLoad() {
        super.viewDidLoad()
        btn.backgroundColor = .purple
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("测试Title文字", for: .normal)
        btn.setImage(UIImage(named: "light"), for: .normal)
        btn.titleLabel?.backgroundColor = .red
        btn.imageView?.backgroundColor = .red
        btn.frame = CGRect(x: 100, y: 100, width: 300, height: height)
        btn.imageTitleSpace = 20
//        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        btn.contentHorizontalAlignment = .center
        view.addSubview(btn)
        
        beBtn.backgroundColor = .purple
        beBtn.translatesAutoresizingMaskIntoConstraints = false
        beBtn.setTitle("测试Title文字", for: .normal)
        beBtn.setImage(UIImage(named: "light"), for: .normal)
        beBtn.titleLabel?.backgroundColor = .red
        beBtn.imageView?.backgroundColor = .red
        beBtn.frame = CGRect(x: 100, y: 250, width: 300, height: height)
//        beBtn.imageTitleSpace = 20
        beBtn.contentHorizontalAlignment = .center
//        beBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        view.addSubview(beBtn)
        
        sBtn.backgroundColor = .purple
        sBtn.translatesAutoresizingMaskIntoConstraints = false
        sBtn.setTitle("测试Title文字", for: .normal)
        sBtn.setImage(UIImage(named: "light"), for: .normal)
        sBtn.titleLabel?.backgroundColor = .red
        sBtn.imageView?.backgroundColor = .red
        sBtn.frame = CGRect(x: 100, y: 400, width: 300, height: height)
        sBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        sBtn.contentHorizontalAlignment = .left
        view.addSubview(sBtn)
    }

    @IBAction func add(_ sender: Any) {
        
        height += 10
        btn.frame = CGRect(x: 100, y: 100, width: 120, height: height)
    }
    
    @IBAction func sub(_ sender: Any) {
        height -= 10
        btn.frame = CGRect(x: 100, y: 100, width: 120, height: height)
    }
    
}

