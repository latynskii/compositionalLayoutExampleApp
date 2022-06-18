//
//  SectionHeaderView.swift
//  SimpleCompositionalLayout
//
//  Created by EDUARD Latynsky on 17.06.2022.
//

import UIKit

class SectionHeaderView: UICollectionReusableView {
    static let reuseID = "sectionHeader"
    
    //MARK: - UI Properties
    let title: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIDevice.current.userInterfaceIdiom == .pad
        ? .systemFont(ofSize: 30, weight: .bold)
        : .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    private func setupConstrains() {
        self.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.topAnchor),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            title.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
