//
//  Section.swift
//  SimpleCompositionalLayout
//
//  Created by EDUARD Latynsky on 17.06.2022.
//

import Foundation

enum Section: Int, CaseIterable {
    
     case eatingPsychology, fastingBasics, healthyEating, explained
    
    func description() -> String {
        switch self {
        case .eatingPsychology:
            return "Eating psychology"
        case .fastingBasics:
            return "Fasting basics"
        case .healthyEating:
            return "Healthy eating"
        case .explained:
            return "Explained"
        }
    }
}
