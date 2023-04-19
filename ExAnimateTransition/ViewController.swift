//
//  ViewController.swift
//  ExAnimateTransition
//
//  Created by 김종권 on 2023/04/19.
//

import UIKit

class ViewController: UIViewController {
    private let animateButton: UIButton = {
        let button = UIButton()
        button.setTitle("animate button", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
        button.addTarget(self, action: #selector(tapAnimateButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let transitionButton: UIButton = {
        let button = UIButton()
        button.setTitle("transition button", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
        button.addTarget(self, action: #selector(tapTransitionButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let label: UILabel = {
        let label = UILabel()
        label.text = "label"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let myImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "blog")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(animateButton)
        view.addSubview(transitionButton)
        view.addSubview(label)
        view.addSubview(myImageView)
        
        NSLayoutConstraint.activate([
            animateButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 56),
            animateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            transitionButton.topAnchor.constraint(equalTo: animateButton.bottomAnchor, constant: 16),
            transitionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            myImageView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 16),
            myImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    @objc private func tapAnimateButton() {
        UIView.animate(
            withDuration: 2,
            delay: 0,
            options: .curveEaseOut,
            animations: {
                self.view.backgroundColor = .lightGray.withAlphaComponent(0.3)
                self.label.alpha = 0
                self.label.font = .systemFont(ofSize: 50)
                
                // 적용 x (UIView.transition만 적용됨)
                self.myImageView.image = UIImage(named: "img2")
            }
        )
    }

    @objc private func tapTransitionButton() {
            UIView.transition(
                with: myImageView,
                duration: 2,
                options: .transitionFlipFromBottom,
                animations: {
                    self.myImageView.image = UIImage(named: "img2")
                }
            )
    }
}
