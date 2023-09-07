//
//  GoalDetailsVC.swift
//  Hayatı Yakala!
//
//  Created by Kemal Güler on 26.07.2023.
//

import UIKit
import CoreData


class GoalDetailsVC: UIViewController {
    
    var goal: Goal?
    var changes: Bool = false
    
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
    
    lazy var descriptionTextView: UITextView = {
        let text = UITextView()
        text.delegate = self
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton()
        button.isEnabled = true
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
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
extension GoalDetailsVC {
    
    private func addSubViews() {
        addTitleView()
        addTitleStackView()
        addBackButton()
        addDescriptionTextView()
        addSaveButton()
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
    
    private func addDescriptionTextView() {
        view.addSubview(descriptionTextView)
        NSLayoutConstraint.activate([
            descriptionTextView.topAnchor.constraint(equalTo: titleStackView.bottomAnchor, constant: 32),
            descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            descriptionTextView.heightAnchor.constraint(equalToConstant: 270)
        ])
    }
    
    private func addSaveButton() {
        view.addSubview(saveButton)
        NSLayoutConstraint.activate([
            saveButton.heightAnchor.constraint(equalToConstant: 50),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            saveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32)
        ])
    }
    
}

// MARK: - Configure
extension GoalDetailsVC {
    
    private func configureContents() {
        configureView()
        configureTitleView()
        configureBackButton()
        configureTitleLabel1()
        configureTitleLabel2()
        configureDescriptionTextView()
        configureSaveButton()
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
    
    private func configureDescriptionTextView() {
        if let goalContent = goal?.goalcontent {
            changes = true
            descriptionTextView.text = goalContent.content
        } else {
            descriptionTextView.text = "Hedefinizi detaylıca açıklayabilir, dilerseniz hedefinizle alakalı notlar alabilirsiniz."
        }
        descriptionTextView.font = UIFont(name: "TrebuchetMS", size: 16)
    }
    
    private func configureSaveButton() {
        saveButton.replaceWithKeyboard()
        saveButton.setTitle("KAYDET", for: .normal)
        saveButton.titleLabel?.font = UIFont(name: "TrebuchetMS-Bold", size: 22)
        saveButton.backgroundColor = .init(red: 51/255, green: 1, blue: 153/255, alpha: 1)
    }
    
    private func configureTargets() {
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
}

// MARK: - Actions
extension GoalDetailsVC {
    
    @objc
    func backButtonTapped() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc
    func saveButtonTapped() {
        saveGoalContent()
    }
}

// MARK: - UITextViewDelegate
extension GoalDetailsVC: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if changes {
            return
        } else {
            descriptionTextView.text = ""
            descriptionTextView.textColor = .black
        }
    }
}

// MARK: - CoreData
extension GoalDetailsVC {
    
    private func saveGoalContent() {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        if descriptionTextView.text == "" && descriptionTextView.text == "Hedefinizi detaylıca açıklayabilir, dilerseniz hedefinizle alakalı notlar alabilirsiniz." {
            saveButton.isEnabled = false
        } else {
            let goalContent = GoalContent(context: managedContext)
            goalContent.content = descriptionTextView.text
            goal?.goalcontent = goalContent
            
            do {
                try managedContext.save()
                navigationController?.popToRootViewController(animated: true)
            } catch {
                debugPrint(error.localizedDescription)
            }
            saveButton.isEnabled = true
        }
    }
}
