//
//  ViewController.swift
//  HWgesturegame
//
//  Created by Карина Дьячина on 18.01.24.
//

import UIKit

class ViewController: UIViewController {

    var myButton: UIButton = {
        let button = UIButton()
            button.layer.cornerRadius = 10
            button.backgroundColor = .systemBlue
            button.setTitle("Start Game", for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
    var circleView: UIView = {
            let circle = UIView()
            return circle
        }()
    
    let tapGesture = UITapGestureRecognizer()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        setConstraints()
        
        myButton.addTarget(self, action: #selector(myButtonTapped), for: .touchUpInside)
        
    }
    

    @objc func myButtonTapped() {
 createCircleView()
    }
    
    @objc func circleTapped(_ gesture: UITapGestureRecognizer) {
        circleView.removeFromSuperview()
        
        let safeAreaWidth = Int(view.safeAreaLayoutGuide.layoutFrame.size.width /*- myButton.widthAnchor)*/)
        let smth = Int(myButton.frame.maxY)
        let safeAreaHeight = Int(view.safeAreaLayoutGuide.layoutFrame.maxY)
        
        
        let circleSide = Int(circleView.bounds.size.width)
        
        circleView.frame = CGRect(x: Int.random(in: 1 ..< (safeAreaWidth - circleSide)), y: Int.random(in: (smth + circleSide) ..< (safeAreaHeight - circleSide)), width: circleSide, height: circleSide)
        circleView.backgroundColor =  UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
        view.addSubview(circleView)
        UIView.animate(withDuration: 2.0) {
            self.circleView.transform = CGAffineTransform(scaleX: 0.5, y: 1.5)
        } completion: { _ in
            self.circleView.transform = .identity
        }
    }
    

}
    


extension ViewController {
    
    func setConstraints() {
       view.addSubview(myButton)
        NSLayoutConstraint.activate([
            myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            myButton.heightAnchor.constraint(equalToConstant: 70),
            myButton.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    func createCircleView() {
        let circleSize: CGFloat = 100
        let randomX = CGFloat.random(in: 0...(view.bounds.width - circleSize))
        let randomY = CGFloat.random(in: 0...(view.bounds.height - circleSize))
        
        circleView = UIView(frame: CGRect(x: randomX, y: randomY, width: circleSize, height: circleSize))
        circleView.backgroundColor = UIColor.systemPink
        circleView.layer.cornerRadius = circleSize / 2
        view.addSubview(circleView)
        
        tapGesture.addTarget(self, action: #selector(circleTapped))
        circleView.addGestureRecognizer(tapGesture)
    }
}
