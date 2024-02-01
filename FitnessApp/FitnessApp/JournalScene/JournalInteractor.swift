//
//  JournalInteractor.swift
//  FitnessApp
//
//  Created by user on 28.01.2024.
//  
//

import Foundation

final class JournalInteractor {
    weak var output: JournalInteractorOutput?
    private let dayManager: DayManagerDescription

    init(dayManager: DayManagerDescription = DayManager.shared) {
        self.dayManager = dayManager
    }
}

extension JournalInteractor: JournalInteractorInput {
    
    func loadDay() {
        dayManager.getDay { [weak self] result in
            guard let self else {
                return
            }

            switch result {
            case .success(let day):
                self.output?.didLoadDay(with: day)
            case .failure(let error):
                self.output?.didRecieveError(with: error)
            }
        }
    }
}
