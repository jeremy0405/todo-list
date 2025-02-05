//
//  PopUpView.swift
//  ToDoListApp
//
//  Created by Jihee hwang on 2022/04/08.
//

import UIKit

class PopUpView: UIView {
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let containerHeadLineLabel: UILabel = {
        let label = UILabel()
        label.text = "새로운 카드 추가"
        label.font = UIFont(name: Constant.Font.gothicNeoBold, size: 18)
        return label
    }()
    
    private let containerTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "제목을 입력하세요."
        label.font = UIFont(name: Constant.Font.gothicNeoBold, size: 15)
        label.textColor = .darkGray
        return label
    }()
    
    private let containerContentsLabel: UILabel = {
        let label = UILabel()
        label.text = "내용을 입력하세요."
        label.font = UIFont(name: Constant.Font.gothicNeo, size: 15)
        label.textColor = .darkGray
        return label
    }()
    
    
    private let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        return stackView
    }()
    
    private let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("취소", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont(name: Constant.Font.gothicNeo, size: 14)
        button.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        button.layer.cornerRadius = 5
        return button
    }()
    
    private let submitButton: UIButton = {
        let button = UIButton()
        button.setTitle("등록", for: .normal)
        button.titleLabel?.font = UIFont(name: Constant.Font.gothicNeo, size: 14)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }
    
    private func setUpView() {
        configureView()
        
        addSubview(containerView)
        layoutPopUpView()
        
        containerView.addSubview(containerHeadLineLabel)
        layoutContainerHeadLineLabel()
        
        containerView.addSubview(containerStackView)
        containerStackView.addArrangedSubview(containerTitleLabel)
        containerStackView.addArrangedSubview(containerContentsLabel)
        layoutContainerStackView()
        
        containerStackView.addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(cancelButton)
        buttonStackView.addArrangedSubview(submitButton)
        layoutButtonStackView()
    }
    
    private func configureView() {
        backgroundColor = .black.withAlphaComponent(0.4)
    }
    
    private func layoutPopUpView() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: 400).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 175).isActive = true
    }
    
    private func layoutContainerHeadLineLabel() {
        containerHeadLineLabel.translatesAutoresizingMaskIntoConstraints = false
        
        containerHeadLineLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16).isActive = true
        containerHeadLineLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -136).isActive = true
        containerHeadLineLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16).isActive = true
        containerHeadLineLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16).isActive = true
    }
    
    private func layoutContainerStackView() {
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        containerStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 60).isActive = true
        containerStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -72).isActive = true
        containerStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16).isActive = true
        containerStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16).isActive = true
    }
    
    private func layoutButtonStackView() {
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.topAnchor.constraint(equalTo: containerStackView.bottomAnchor, constant: 16).isActive = true
        buttonStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16).isActive = true
        buttonStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 160).isActive = true
        buttonStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16).isActive = true
    }
}
