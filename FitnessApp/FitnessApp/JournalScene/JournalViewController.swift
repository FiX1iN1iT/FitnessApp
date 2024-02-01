//
//  JournalViewController.swift
//  FitnessApp
//
//  Created by user on 28.01.2024.
//  
//

import UIKit

final class JournalViewController: UIViewController {
    private let output: JournalViewOutput
    
    private let tableView = UITableView()
    
    private var day: [Today] = []

    init(output: JournalViewOutput) {
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

private extension JournalViewController {
    
    func setup() {
        configureTableView()
        setupAppearence()
    }

    func setupAppearence() {
        view.backgroundColor = .systemMint

        let calendarButton = UIBarButtonItem(title: "Calendar", image: UIImage(systemName: "calendar"), target: self, action: #selector(calendarButtonTapped))
        
        let testButton = UIBarButtonItem(title: "Test", image: UIImage(systemName: "paperplane"), target: self, action: #selector(testButtonTapped))
        
        navigationItem.rightBarButtonItems = [calendarButton, testButton]
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: dateLabel())
    }
    
    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(JournalTableViewCell.self, forCellReuseIdentifier: JournalTableViewCell.reuseID)
        
        view.addSubview(tableView)
        tableView.pinToEdges(of: view)
    }
    
    func dateLabel() -> UILabel {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        
        let currentDate = dateFormatter.string(from: Date())
        
        let dateLabel = UILabel()
        dateLabel.text = currentDate.capitalized
        
        return dateLabel
    }
    
    @objc
    func calendarButtonTapped() {
        
    }
    
    @objc
    func testButtonTapped() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        
        let currentDate = dateFormatter.string(from: Date())
        print(currentDate)
    }
}

extension JournalViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output.openTraining(with: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        day.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: JournalTableViewCell.reuseID, for: indexPath) as? JournalTableViewCell else {
            return UITableViewCell()
        }
        
        cell.textLabel?.text = day[indexPath.row].dayOfProgram.0.title
        
        return cell
    }
}

extension JournalViewController: UITableViewDelegate {
    
}

extension JournalViewController: JournalViewInput {
    
    func updateForToday(today: [Today]) {
        self.day = today
        
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
