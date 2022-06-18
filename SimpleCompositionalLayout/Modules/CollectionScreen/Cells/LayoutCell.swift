//
//  LayoutCell.swift
//  SimpleCompositionalLayout
//
//  Created by EDUARD Latynsky on 17.06.2022.
//

import UIKit
import Kingfisher

class LayoutCell: UICollectionViewCell {
    static let reuseID = "layoutCell"
    
    //MARK: - UI Properties
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "Loskov1")
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private let blurView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
        
    //MARK: - Properties
    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.layer.borderColor = UIColor.getSelectColorCell().cgColor
                self.layer.borderWidth = 3
            } else {
                self.layer.borderColor = UIColor.orange.cgColor
                self.layer.borderWidth = 0
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstrains()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    func configure(_ titleText: String, _ imageStr: String) {
        titleLabel.text = titleText
        guard let url = URL(string: imageStr) else { return }
        imageView.kf.setImage(with: url)
    }
    
    private func setupUI() {
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = blurView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurView.addSubview(blurEffectView)
        
        self.layer.cornerRadius = 17
        self.clipsToBounds = true
    }
    
    private func setupConstrains() {
        self.addSubview(imageView)
        self.addSubview(blurView)
        self.addSubview(titleLabel)
        
        blurView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            blurView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
            blurView.heightAnchor.constraint(equalToConstant: self.frame.height * 0.3),
            blurView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: blurView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: blurView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8)
        ])
    }
}

