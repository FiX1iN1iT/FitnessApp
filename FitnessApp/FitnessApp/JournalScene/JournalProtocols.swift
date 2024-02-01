//
//  JournalProtocols.swift
//  FitnessApp
//
//  Created by user on 28.01.2024.
//  
//

import Foundation

protocol JournalModuleInput {
    var moduleOutput: JournalModuleOutput? { get }
}

protocol JournalModuleOutput: AnyObject {
}

protocol JournalViewInput: AnyObject {
    func updateForToday(today: [Today])
}

protocol JournalViewOutput: AnyObject {
    func didLoadView()
    func openTraining(with number: Int)
}

protocol JournalInteractorInput: AnyObject {
    func loadDay()
}

protocol JournalInteractorOutput: AnyObject {
    func didLoadDay(with day: [Today])
    func didRecieveError(with error: CustomError)
}

protocol JournalRouterInput: AnyObject {
    func openTraining(with today: Today)
}
