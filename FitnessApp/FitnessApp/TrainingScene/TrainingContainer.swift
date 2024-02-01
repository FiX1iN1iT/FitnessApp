//
//  TrainingContainer.swift
//  FitnessApp
//
//  Created by user on 29.01.2024.
//  
//

import UIKit

final class TrainingContainer {
    let input: TrainingModuleInput
    let viewController: UIViewController
    private(set) weak var router: TrainingRouterInput!
    
    class func assemble(with context: TrainingContext) -> TrainingContainer {
        let router = TrainingRouter()
        let interactor = TrainingInteractor()
        let presenter = TrainingPresenter(router: router, interactor: interactor, day: context.today)
        let viewController = TrainingViewController(output: presenter)
        
        presenter.view = viewController
        presenter.moduleOutput = context.moduleOutput
        
        interactor.output = presenter
        
        return TrainingContainer(view: viewController, input: presenter, router: router)
    }
    
    private init(view: UIViewController, input: TrainingModuleInput, router: TrainingRouterInput) {
        self.viewController = view
        self.input = input
        self.router = router
    }
}

struct TrainingContext {
    weak var moduleOutput: TrainingModuleOutput?
    let today: Today
}
