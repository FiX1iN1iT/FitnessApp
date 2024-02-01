//
//  TrainingViewController.swift
//  FitnessApp
//
//  Created by user on 29.01.2024.
//  
//

import UIKit

final class TrainingViewController: UIViewController {
    private let output: TrainingViewOutput
    
    private let label = UILabel()
    private let tableView = UITableView()
    
    private var exercises: [Exercise] = []

    init(output: TrainingViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        output.didLoadView()
    }
}

private extension TrainingViewController {
    
    func setup() {
//        configureLabel()
        configureTableView()
        setupAppearence()
    }

    func setupAppearence() {
        view.backgroundColor = .systemYellow
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TrainingTableViewCell.self, forCellReuseIdentifier: TrainingTableViewCell.reuseID)
        
        view.addSubview(tableView)
        tableView.pinToEdges(of: view)
    }
    
    func configureLabel() {
        label.text = "Training..."
        
        view?.addSubview(label)
        label.pinToEdges(of: view)
    }
}

extension TrainingViewController: UITableViewDelegate {
    
}

extension TrainingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        exercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TrainingTableViewCell.reuseID, for: indexPath) as? TrainingTableViewCell else {
            return UITableViewCell()
        }
        
        cell.textLabel?.text = exercises[indexPath.row].name
        
        return cell
    }
}

extension TrainingViewController: TrainingViewInput {
    func updateForToday(today: Today) {
        self.exercises = today.dayOfProgram.0.days[today.dayOfProgram.1].sets[0].0.exercises
        
        reloadData()
    }
    
    func reloadData() {
        DispatchQueue.main.async { [weak self] in
            guard let self else {
                return
            }
            
            self.tableView.reloadData()
        }
    }
}
