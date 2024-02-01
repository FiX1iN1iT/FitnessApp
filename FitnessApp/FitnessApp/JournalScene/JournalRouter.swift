//
//  JournalRouter.swift
//  FitnessApp
//
//  Created by user on 28.01.2024.
//  
//

import UIKit

final class JournalRouter {
    weak var viewController: JournalViewController?
}

extension JournalRouter: JournalRouterInput {
    func openTraining(with today: Today) {
        let trainingContext = TrainingContext(today: today)
        let trainingContainer = TrainingContainer.assemble(with: trainingContext)
        viewController?.navigationController?.pushViewController(trainingContainer.viewController, animated: true)
    }
}
