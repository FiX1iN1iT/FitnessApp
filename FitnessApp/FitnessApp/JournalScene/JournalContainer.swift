//
//  JournalContainer.swift
//  FitnessApp
//
//  Created by user on 28.01.2024.
//  
//

import UIKit

final class JournalContainer {
    let input: JournalModuleInput
    let viewController: UIViewController
    private(set) weak var router: JournalRouterInput!
    
    class func assemble(with context: JournalContext) -> JournalContainer {
        let router = JournalRouter()
        let interactor = JournalInteractor()
        let presenter = JournalPresenter(router: router, interactor: interactor)
        let viewController = JournalViewController(output: presenter)
        
        presenter.view = viewController
        presenter.moduleOutput = context.moduleOutput
        
        interactor.output = presenter
        
        router.viewController = viewController
        
        return JournalContainer(view: viewController, input: presenter, router: router)
    }
    
    private init(view: UIViewController, input: JournalModuleInput, router: JournalRouterInput) {
        self.viewController = view
        self.input = input
        self.router = router
    }
}

struct JournalContext {
    weak var moduleOutput: JournalModuleOutput?
}
