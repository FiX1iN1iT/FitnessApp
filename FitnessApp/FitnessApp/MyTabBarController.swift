//
//  MyTabBarController.swift
//  FitnessApp
//
//  Created by user on 28.01.2024.
//

import UIKit

final class MyTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = [createJournalNC()]
    }
    
    func createJournalNC() -> UINavigationController {
        let journalContainer = JournalContainer.assemble(with: .init())
        let journalVC = journalContainer.viewController
        journalVC.tabBarItem.image = UIImage(systemName: "list.bullet")
        return UINavigationController(rootViewController: journalVC)
    }
}
