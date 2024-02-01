//
//  JournalPresenter.swift
//  FitnessApp
//
//  Created by user on 28.01.2024.
//  
//

import Foundation

final class JournalPresenter {
    weak var view: JournalViewInput?
    weak var moduleOutput: JournalModuleOutput?
    
    private let router: JournalRouterInput
    private let interactor: JournalInteractorInput
    
    private var day: [Today] = []
    
    init(router: JournalRouterInput, interactor: JournalInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension JournalPresenter: JournalModuleInput {
}

extension JournalPresenter: JournalViewOutput {
    
    func openTraining(with number: Int) {
        router.openTraining(with: day[number])
    }
    
    func didLoadView() {
//        view?.showLoading()
        interactor.loadDay()
    }
}

extension JournalPresenter: JournalInteractorOutput {
    
    func didLoadDay(with day: [Today]) {
//        view?.hideLoading()
//        view?.hideError()
        
        self.day = day
        
        view?.updateForToday(today: self.day)

//        let viewModel = ProfileViewModel(profile: profile)
//        view?.configure(with: viewModel)
    }

    func didRecieveError(with error: CustomError) {
        print(error.rawValue)
//        view?.hideLoading()
//        view?.showError(with: error.rawValue)
    }
}
