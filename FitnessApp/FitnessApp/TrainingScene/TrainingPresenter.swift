//
//  TrainingPresenter.swift
//  FitnessApp
//
//  Created by user on 29.01.2024.
//  
//

import Foundation

final class TrainingPresenter {
    weak var view: TrainingViewInput?
    weak var moduleOutput: TrainingModuleOutput?
    
    private let router: TrainingRouterInput
    private let interactor: TrainingInteractorInput
    
    private var day: Today
    
    init(router: TrainingRouterInput, interactor: TrainingInteractorInput, day: Today) {
        self.router = router
        self.interactor = interactor
        self.day = day
    }
}

extension TrainingPresenter: TrainingModuleInput {
}

extension TrainingPresenter: TrainingViewOutput {
    func didLoadView() {
//        view?.showLoading()        
        view?.updateForToday(today: self.day)
    }
}

extension TrainingPresenter: TrainingInteractorOutput {
}
