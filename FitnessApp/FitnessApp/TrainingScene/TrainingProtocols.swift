//
//  TrainingProtocols.swift
//  FitnessApp
//
//  Created by user on 29.01.2024.
//  
//

import Foundation

protocol TrainingModuleInput {
    var moduleOutput: TrainingModuleOutput? { get }
}

protocol TrainingModuleOutput: AnyObject {
}

protocol TrainingViewInput: AnyObject {
    func updateForToday(today: Today)
}

protocol TrainingViewOutput: AnyObject {
    func didLoadView()
}

protocol TrainingInteractorInput: AnyObject {
}

protocol TrainingInteractorOutput: AnyObject {
}

protocol TrainingRouterInput: AnyObject {
}
