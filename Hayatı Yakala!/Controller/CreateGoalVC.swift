//
//  CreateGoalVC.swift
//  Hayatı Yakala!
//
//  Created by Kemal Güler on 15.07.2023.
//

import UIKit

class CreateGoalVC: UIViewController {
    
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
    
    private let placeHolderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let goalCountTextField: UITextField = {
        let text = UITextField()
        text.keyboardType = .numberPad
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 30
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let compeleteButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.isEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let viewForButton: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var goalDescription: String!
    var goalType: GoalTypes!
    
    func dataAssignment(description: String, type: GoalTypes) {
        self.goalDescription = description
        self.goalType = type
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
    }
}

// MARK: - UILayout
extension CreateGoalVC {
    
    private func addSubViews() {
        addTitleView()
        addTitleStackView()
        addBackButton()
        addStackView()
        addViewForButton()
        addCompeleteButton()
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
    
    private func addStackView() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(placeHolderLabel)
        stackView.addArrangedSubview(goalCountTextField)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func addViewForButton() {
        view.addSubview(viewForButton)
        NSLayoutConstraint.activate([
            viewForButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 8),
            viewForButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            viewForButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            viewForButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32)
        ])
    }
     
    private func addCompeleteButton() {
        viewForButton.addSubview(compeleteButton)
        NSLayoutConstraint.activate([
            compeleteButton.heightAnchor.constraint(equalToConstant: 50),
            compeleteButton.leadingAnchor.constraint(equalTo: viewForButton.leadingAnchor),
            compeleteButton.trailingAnchor.constraint(equalTo: viewForButton.trailingAnchor),
            compeleteButton.bottomAnchor.constraint(equalTo: viewForButton.bottomAnchor)
        ])
    }
}

// MARK: - Configure
extension CreateGoalVC {
    
    private func configureContents() {
        configureView()
        configureTitleView()
        configureBackButton()
        configureTitleLabel1()
        configureTitleLabel2()
        configurePlaceHolderLabel()
        configureGoalCountTextField()
        configureCompeleteButton()
        configureViewForButton()
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
    
    private func configurePlaceHolderLabel() {
        placeHolderLabel.text = "Hedefi tamamlamak için gereken miktar :"
        placeHolderLabel.font = UIFont(name: "TrebuchetMS", size: 17)
        placeHolderLabel.textColor = .darkGray
        placeHolderLabel.textAlignment = .center
    }
    
    private func configureGoalCountTextField() {
        goalCountTextField.font = UIFont(name: "TrebuchetMS-Bold", size: 52)
        goalCountTextField.placeholder = "0"
        goalCountTextField.textAlignment = .center
        goalCountTextField.textColor = .cyan
    }
    
    private func configureCompeleteButton() {
        compeleteButton.setTitle("HEDEFİNİ OLUŞTUR", for: .normal)
        compeleteButton.titleLabel?.font = UIFont(name: "TrebuchetMS-Bold", size: 22)
        compeleteButton.backgroundColor = .init(red: 51/255, green: 1, blue: 153/255, alpha: 1)
        compeleteButton.replaceWithKeyboard()
    }
    
    private func configureViewForButton() {
        viewForButton.backgroundColor = .white
    }
    
    private func configureTargets() {
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        compeleteButton.addTarget(self, action: #selector(compeleteButtonTapped), for: .touchUpInside)
    }
}

// MARK: - Actions
extension CreateGoalVC {
    
    @objc
    func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    func compeleteButtonTapped() {
        if goalCountTextField.text != "" {
            if Int(goalCountTextField.text!)! > 0 {
                self.saveData { (finale) in
                    if finale {
                        self.navigationController?.popToRootViewController(animated: true)
                    }
                }
            }
        }
    }
}

// MARK: - CoreData
extension CreateGoalVC {
    
    func saveData(completionHandler: (_ isFinished: Bool) -> Void) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        let goal = Goal(context: managedContext)
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionCount = Int32(goalCountTextField.text!)!
        goal.validGoalCount = Int32(0)
        
        do {
            try managedContext.save()
            completionHandler(true)
        } catch {
            debugPrint(error.localizedDescription)
            completionHandler(false)
        }
    }
}
