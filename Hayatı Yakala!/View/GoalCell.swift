//
//  GoalCell.swift
//  Hayatı Yakala!
//
//  Created by Kemal Güler on 18.06.2023.
//

import UIKit

class GoalCell: UITableViewCell {
    
    private let goalDescriptionTitleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let goalDescriptionLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let goalDescriptionStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.spacing = 4
        return stack
    }()
    
    private let goalTypeTitleLabel : UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let goalTypeLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let goalTypeStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.spacing = 4
        return stack
    }()
    
    private let titleStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 7
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let goalCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let compeleteView: UIView = {
        let view = UIView()
        view.backgroundColor = .init(red: 1, green: 1, blue: 51/255, alpha: 0.8)
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let compeleteLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "goalCell")
        addSubViews()
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: UILayout
extension GoalCell {
    
    private func addSubViews() {
        addGoalCountLabel()
        addTitleStackView()
        addCompeleteView()
    }
    
    private func addTitleStackView() {
        contentView.addSubview(titleStackView)
        goalDescriptionStackView.addArrangedSubview(goalDescriptionTitleLabel)
        goalDescriptionStackView.addArrangedSubview(goalDescriptionLabel)
        goalTypeStackView.addArrangedSubview(goalTypeTitleLabel)
        goalTypeStackView.addArrangedSubview(goalTypeLabel)
        titleStackView.addArrangedSubview(goalDescriptionStackView)
        titleStackView.addArrangedSubview(goalTypeStackView)
        NSLayoutConstraint.activate([
            goalDescriptionTitleLabel.widthAnchor.constraint(equalToConstant: 90),
            goalTypeTitleLabel.widthAnchor.constraint(equalToConstant: 130),
            titleStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            titleStackView.trailingAnchor.constraint(equalTo: goalCountLabel.leadingAnchor, constant: -8)
        ])
    }
    
    private func addGoalCountLabel() {
        contentView.addSubview(goalCountLabel)
        NSLayoutConstraint.activate([
            goalCountLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            goalCountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            goalCountLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            goalCountLabel.widthAnchor.constraint(equalToConstant: 32)
        ])
    }
    
    private func addCompeleteView() {
        contentView.addSubview(compeleteView)
        compeleteView.addSubview(compeleteLabel)
        NSLayoutConstraint.activate([
            compeleteView.topAnchor.constraint(equalTo: contentView.topAnchor),
            compeleteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            compeleteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            compeleteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            compeleteLabel.centerXAnchor.constraint(equalTo: compeleteView.centerXAnchor),
            compeleteLabel.centerYAnchor.constraint(equalTo: compeleteView.centerYAnchor)
        ])
    }
}

// MARK: - Configure
extension GoalCell {
    
    private func configureContents() {
        selectionStyle = .none
        configureGoalDescriptionTitleLabel()
        configureGoalDescriptionLabel()
        configureGoalTypeTitleLabel()
        configureGoalTypeLabel()
        configureGoalCountLabel()
        configureCompeleteView()
        configureCompeleteLabel()
    }
    
    private func configureGoalDescriptionTitleLabel() {
        goalDescriptionTitleLabel.text = "Hedefiniz : "
        goalDescriptionTitleLabel.font = UIFont(name: "AvenirNext-DemiBold", size: 18)
        goalDescriptionTitleLabel.textColor = .black
    }
    
    private func configureGoalDescriptionLabel() {
        goalDescriptionLabel.text = "Haftada 4 kez yüzme."
        goalDescriptionLabel.font = UIFont(name: "AvenirNext-DemiBold", size: 18)
        goalDescriptionLabel.textAlignment = .left
        goalDescriptionLabel.textColor = .black
    }
    
    private func configureGoalTypeTitleLabel() {
        goalTypeTitleLabel.text = "Hedefinizin Tipi : "
        goalTypeTitleLabel.font = UIFont(name: "AvenirNext-Regular", size: 14)
        goalTypeTitleLabel.textColor = .darkGray
    }
    
    private func configureGoalTypeLabel() {
        goalTypeLabel.text = "Kısa Vadeli"
        goalTypeLabel.font = UIFont(name: "AvenirNext-Regular", size: 14)
        goalTypeLabel.textAlignment = .left
        goalTypeLabel.textColor = .darkGray
    }
    
    private func configureGoalCountLabel() {
        goalCountLabel.font = UIFont(name: "AvenirNext-Bold", size: 30)
        goalCountLabel.minimumScaleFactor = 15
        goalCountLabel.textColor = .init(red: 15/255, green: 184/255, blue: 246/255, alpha: 1)
        goalCountLabel.textAlignment = .center
    }
    
    private func configureCompeleteView() {
        compeleteView.backgroundColor = .init(red: 127/255, green: 0, blue: 1, alpha: 0.8)
    }
    
    private func configureCompeleteLabel() {
        compeleteLabel.text = "HEDEFİ TAMAMLADIN!"
        compeleteLabel.font = UIFont(name: "TrebuchetMS-Bold", size: 27)
        compeleteLabel.textColor = .white
    }
}

// MARK: - Setup
extension GoalCell {
    
    func setupView(goal: Goal) {
        goalDescriptionLabel.text = goal.goalDescription
        goalTypeLabel.text = goal.goalType
        goalCountLabel.text = String(goal.validGoalCount)
        
        if goal.validGoalCount == goal.goalCompletionCount {
            compeleteView.isHidden = false
        } else {
            compeleteView.isHidden = true
        }
    }
}
