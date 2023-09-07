//
//  GoalsListVC.swift
//  Hayatı Yakala!
//
//  Created by Kemal Güler on 16.06.2023.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class GoalsListVC: UIViewController {
    
    var arrayGoals: [Goal] = [Goal]()
    
    private let titleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.isEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let greetingLabel1: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let greetingLabel2: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let greetingStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.rowHeight = 70
        table.register(GoalCell.self, forCellReuseIdentifier: "goalCell")
        table.isHidden = false
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.uploadData()
    }
}

// MARK: UILayout
extension GoalsListVC {
    
    private func addSubViews() {
        addTitleView()
        addTitleStackView()
        addAddButton()
        addGreetingStackView()
        addTableView()
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
    
    private func addAddButton() {
        titleView.addSubview(addButton)
        NSLayoutConstraint.activate([
            addButton.centerYAnchor.constraint(equalTo: titleStackView.centerYAnchor),
            addButton.trailingAnchor.constraint(equalTo: titleView.trailingAnchor, constant: -16)
        ])
    }
    
    private func addGreetingStackView() {
        view.addSubview(greetingStackView)
        greetingStackView.addArrangedSubview(greetingLabel1)
        greetingStackView.addArrangedSubview(greetingLabel2)
        NSLayoutConstraint.activate([
            greetingStackView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 80),
            greetingStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func addTableView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: titleView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

// MARK: - Configure
extension GoalsListVC {
    
    private func configureContents() {
        configureNavBar()
        configureView()
        configureTitleView()
        configureTitleLabel1()
        configureTitleLabel2()
        configureAddButton()
        configureGreetingLabel1()
        configureGreetingLabel2()
        configureTargets()
    }
    
    
    private func configureNavBar() {
        navigationController?.isNavigationBarHidden = true
    }
    
    private func configureView() {
        view.backgroundColor = .white
    }
    
    private func configureTitleView() {
        titleView.backgroundColor = .init(red: 15/255, green: 184/255, blue: 246/255, alpha: 1)
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
    
    private func configureAddButton() {
        addButton.setTitle("Ekle", for: .normal)
        addButton.tintColor = .white
        addButton.titleLabel?.font = UIFont(name: "TrebuchetMS-Bold", size: 17)
    }
    
    private func configureGreetingLabel1() {
        greetingLabel1.text = "Uygulamaya Hoşgeldiniz!"
        greetingLabel1.font = UIFont(name: "MarkerFelt-Wide", size: 22)
        greetingLabel1.textColor = .darkGray
        greetingLabel1.textAlignment = .center
    }
    
    private func configureGreetingLabel2() {
        greetingLabel2.text = "Hedefinizi Belirleyin."
        greetingLabel2.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        greetingLabel2.textColor = .darkGray
        greetingLabel2.textAlignment = .center
    }
    
    private func configureTargets() {
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    
}

// MARK: - Actions
extension GoalsListVC {
    
    @objc
    private func addButtonTapped() {
        let vc = AddGoalVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - UITableViewDelegate
extension GoalsListVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Hedefi Sil") { (_, _, completion) in
            self.deleteData(indexPath: indexPath)
            self.uploadData()
        }
        
        let increaseAction = UIContextualAction(style: .normal, title: "+1") { (_, _, completion) in
            self.increaseGoalCount(indexPath: indexPath)
            self.tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        increaseAction.backgroundColor = .init(red: 15/255, green: 184/255, blue: 246/255, alpha: 1)
        
        let actions = [deleteAction, increaseAction]
        
        return UISwipeActionsConfiguration(actions: actions)
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let resetAction = UIContextualAction(style: .normal, title: "Sıfırla") { (_, _, completion) in
            self.resetData(index: indexPath.row)
        }
        resetAction.backgroundColor = .darkGray
        
        return UISwipeActionsConfiguration(actions: [resetAction])
    }
}

// MARK: - UITableViewDataSource
extension GoalsListVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = GoalDetailsVC()
        let goal = arrayGoals[indexPath.row]
        vc.goal = goal
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayGoals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else {
            return UITableViewCell()
        }
        
        let willDisplayedGoal = arrayGoals[indexPath.row]
        cell.setupView(goal: willDisplayedGoal)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}

// MARK: - CoreData
extension GoalsListVC {
    
    private func increaseGoalCount(indexPath: IndexPath) {
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let selectedGoal = arrayGoals[indexPath.row]
        
        if selectedGoal.validGoalCount < selectedGoal.goalCompletionCount {
            selectedGoal.validGoalCount += 1
        } else {
            return
        }
        
        do {
            try managedContext.save()
        } catch {
            debugPrint("Hedef gelişimi güncellerken hata gelişti. \(error.localizedDescription)")
        }
    }
        
    private func deleteData(indexPath: IndexPath) {
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        managedContext.delete(arrayGoals[indexPath.row])
            
        do {
            try managedContext.save()
            self.arrayGoals.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        } catch {
            debugPrint("Veri silinirken hata gelişti. \(error.localizedDescription)")
        }
    }
        
    private func getDatas(completionHandler: (_ compelete: Bool) -> ()) {
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
            
        do {
            arrayGoals = try managedContext.fetch(fetchRequest)
            completionHandler(true)
        } catch {
            debugPrint(error.localizedDescription)
            completionHandler(false)
        }
    }
        
    private func uploadData() {
        self.getDatas { compelete in
            if compelete {
                if arrayGoals.count >= 1 {
                    tableView.isHidden = false
                } else {
                    tableView.isHidden = true
                }
            }
        }
        tableView.reloadData()
    }
    
    private func resetData(index: Int) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        arrayGoals[index].validGoalCount = Int32(0)
        
        do {
            try managedContext.save()
        } catch {
            debugPrint(error.localizedDescription)
        }
        tableView.reloadData()
    }
}
