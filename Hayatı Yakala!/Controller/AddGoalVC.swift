//
//  AddGoalVC.swift
//  Hayatı Yakala!
//
//  Created by Kemal Güler on 26.06.2023.
//

import UIKit

class AddGoalVC: UIViewController {
    
    var goalType: GoalTypes = .ShortTerm
    
    private let titleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.isEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let titleLabel1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let titleLabel2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let titleStackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 4
        stack.distribution = .fillProportionally
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var goalDescriptionTextView: UITextView = {
        let view = UITextView()
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let timeButtonShort: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.isEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let timeButtonMedium: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.isEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let timeButtonLong: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.isEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let buttonStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 14
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let wholeStackView: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .white
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.isEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
    }
}

// MARK: - UILayout
extension AddGoalVC {
    
    private func addSubViews() {
        addTitleView()
        addTitleStackView()
        addBackButton()
        addButtonsToStack()
        addWholeStackView()
        addNextButton()
    }
    
    private func addTitleView() {
        view.addSubview(titleView)
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            titleView.heightAnchor.constraint(equalToConstant: 76)
        ])
    }
    
    private func addTitleStackView() {
        titleView.addSubview(titleStackView)
        titleStackView.addArrangedSubview(titleLabel1)
        titleStackView.addArrangedSubview(titleLabel2)
        NSLayoutConstraint.activate([
            titleStackView.bottomAnchor.constraint(equalTo: titleView.bottomAnchor, constant: -16),
            titleStackView.centerXAnchor.constraint(equalTo: titleView.centerXAnchor)
        ])
    }
    
    private func addBackButton() {
        titleView.addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.centerYAnchor.constraint(equalTo: titleStackView.centerYAnchor),
            backButton.leadingAnchor.constraint(equalTo: titleView.leadingAnchor, constant: 16)
        ])
    }
    
    private func addButtonsToStack() {
        buttonStackView.addArrangedSubview(timeButtonShort)
        buttonStackView.addArrangedSubview(timeButtonMedium)
        buttonStackView.addArrangedSubview(timeButtonLong)
    }
    
    private func addWholeStackView() {
        view.addSubview(wholeStackView)
        wholeStackView.addArrangedSubview(goalDescriptionTextView)
        wholeStackView.addArrangedSubview(timeLabel)
        wholeStackView.addArrangedSubview(buttonStackView)
        NSLayoutConstraint.activate([
            wholeStackView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 8),
            wholeStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            wholeStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            wholeStackView.heightAnchor.constraint(equalToConstant: 270)
        ])
    }
    
    private func addNextButton() {
        view.addSubview(nextButton)
        NSLayoutConstraint.activate([
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32)
        ])
    }
}

// MARK: - Configure
extension AddGoalVC {
    
    private func configureContents() {
        configureView()
        configureTitleView()
        configureBackButton()
        configureTitleLabel1()
        configureTitleLabel2()
        configureGoalDescriptionTextView()
        configureTimeLabel()
        configureTimeButtonShort()
        configureTimeButtonMedium()
        configureTimeButtonLong()
        configureNextButton()
        configureTargets()
    }
    
    private func configureView() {
        view.backgroundColor = .white
    }
    
    private func configureTitleView() {
        titleView.backgroundColor = .init(red: 15/255, green: 184/255, blue: 246/255, alpha: 1)
    }
    
    private func configureBackButton() {
        backButton.setTitle("Geri", for: .normal)
        backButton.tintColor = .white
        backButton.titleLabel?.font = UIFont(name: "TrebuchetMS", size: 18)
    }
    
    private func configureTitleLabel1() {
        titleLabel1.text = "HAYATI"
        titleLabel1.font = UIFont(name: "AvenirNext-Regular", size: 18)
        titleLabel1.textColor = .white
        titleLabel1.textAlignment = .center
    }
    
    private func configureTitleLabel2() {
        titleLabel2.text = "YAKALA"
        titleLabel2.font = UIFont(name: "AvenirNext-Bold", size: 18)
        titleLabel2.textColor = .white
        titleLabel2.textAlignment = .center
    }
    
    private func configureGoalDescriptionTextView() {
        goalDescriptionTextView.font = UIFont(name: "TrebuchetMS-Bold", size: 18)
        goalDescriptionTextView.textColor = .lightGray
        goalDescriptionTextView.text = "Gerçekleştirmek istediğin hedefi açıkla."
    }
    
    private func configureTimeLabel() {
        timeLabel.font = UIFont(name: "TrebuchetMS", size: 16)
        timeLabel.textColor = .darkGray
        timeLabel.text = "Hangi sürede gerçekleştireceğini seç :"
    }
    
    private func configureTimeButtonShort() {
        timeButtonShort.setTitle("Kısa Vadeli", for: .normal)
        timeButtonShort.titleLabel?.font = UIFont(name: "TrebuchetMS-Bold", size: 18)
        timeButtonShort.tintColor = .white
        timeButtonShort.selectedButtonBackgroundColor()
    }
    
    private func configureTimeButtonMedium() {
        timeButtonMedium.setTitle("Orta Vadeli", for: .normal)
        timeButtonMedium.titleLabel?.font = UIFont(name: "TrebuchetMS-Bold", size: 18)
        timeButtonMedium.tintColor = .white
        timeButtonMedium.notSelectedButtonBackgroundColor()
    }
    
    private func configureTimeButtonLong() {
        timeButtonLong.setTitle("Uzun Vadeli", for: .normal)
        timeButtonLong.titleLabel?.font = UIFont(name: "TrebuchetMS-Bold", size: 18)
        timeButtonLong.tintColor = .white
        timeButtonLong.notSelectedButtonBackgroundColor()
    }
    
    private func configureNextButton() {
        nextButton.setTitle("İLERİ", for: .normal)
        nextButton.titleLabel?.font = UIFont(name: "TrebuchetMS-Bold", size: 22)
        nextButton.backgroundColor = .init(red: 51/255, green: 1, blue: 153/255, alpha: 1)
        nextButton.replaceWithKeyboard()
    }
    
    private func configureTargets() {
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        timeButtonShort.addTarget(self, action: #selector(timeButtonShortTapped), for: .touchUpInside)
        timeButtonMedium.addTarget(self, action: #selector(timeButtonMediumTapped), for: .touchUpInside)
        timeButtonLong.addTarget(self, action: #selector(timeButtonLongTapped), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
}

// MARK: - Actions
extension AddGoalVC {
    
    @objc
    func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    func timeButtonShortTapped() {
        goalType = .ShortTerm
        timeButtonShort.selectedButtonBackgroundColor()
        timeButtonMedium.notSelectedButtonBackgroundColor()
        timeButtonLong.notSelectedButtonBackgroundColor()
    }
    
    @objc
    func timeButtonMediumTapped() {
        goalType = .MediumTerm
        timeButtonShort.notSelectedButtonBackgroundColor()
        timeButtonMedium.selectedButtonBackgroundColor()
        timeButtonLong.notSelectedButtonBackgroundColor()
    }
    
    @objc
    func timeButtonLongTapped() {
        goalType = .LongTerm
        timeButtonShort.notSelectedButtonBackgroundColor()
        timeButtonMedium.notSelectedButtonBackgroundColor()
        timeButtonLong.selectedButtonBackgroundColor()
    }
    
    @objc
    func nextButtonTapped() {
        if goalDescriptionTextView.text != "" && goalDescriptionTextView.text != "Gerçekleştirmek istediğin hedefi açıkla." {
            let vc = CreateGoalVC()
            vc.dataAssignment(description: goalDescriptionTextView.text, type: goalType)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

// MARK: - UITextViewDelegate
extension AddGoalVC: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalDescriptionTextView.text = ""
        goalDescriptionTextView.textColor = .black
    }
}
