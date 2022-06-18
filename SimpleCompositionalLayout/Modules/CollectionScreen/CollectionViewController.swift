//
//  ViewController.swift
//  SimpleCompositionalLayout
//
//  Created by EDUARD Latynsky on 16.06.2022.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate {
    
    //MARK: - Properties
    private var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Section, Itemm>?
    var presener: CollectionViewPresenterProtocol?
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presener?.fetchData(completion: { error in
            if let error = error {
                switch error {
                case .urlError:
                    self.showAlert("Error", "Something wrong with url address")
                case .dataTaskError:
                    self.showAlert("Error", "Something wrong with connection")
                case .decodeError:
                    self.showAlert("Error", "Something wrong with decode")
                case .dataError:
                    self.showAlert("Error", "Something wrong with data")
                }
            }
            DispatchQueue.main.async {
                self.reloadData()
            }
        })
        setupCollectionView()
        setupDataSource()
        
        view.backgroundColor = UIColor(displayP3Red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        collectionView.backgroundColor = UIColor(displayP3Red: 0.9, green: 0.9, blue: 0.9, alpha: 1)

    }
        
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: makeCompositionalLayout())
        view.addSubview(collectionView)
        collectionView.register(LayoutCell.self, forCellWithReuseIdentifier: LayoutCell.reuseID)
        collectionView.register(SectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeaderView.reuseID)
        collectionView.delegate = self
    }
    
    private func makeCompositionalLayout() -> UICollectionViewLayout{
        let layout = UICollectionViewCompositionalLayout { [unowned self] sectionIndex, layoutEnvironment -> NSCollectionLayoutSection in
            return makeSection()
        }
        
        let configure = UICollectionViewCompositionalLayoutConfiguration()
        configure.interSectionSpacing = 40
        layout.configuration = configure
        return layout
    }
    
    private func makeSection() -> NSCollectionLayoutSection {
        let estimatedSize = CGSize(width: view.frame.width * 0.45,
                                   height: view.frame.height * 0.25)
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(estimatedSize.width),
                                              heightDimension: .absolute(estimatedSize.height))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(estimatedSize.width),
                                               heightDimension: .absolute(estimatedSize.height))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 10,
                                                        leading: 20,
                                                        bottom: 0,
                                                        trailing: 20)
        let sectionHeader = createHeaders()
        
        section.boundarySupplementaryItems = [sectionHeader]
        section.interGroupSpacing = 20
        section.contentInsets = NSDirectionalEdgeInsets(top: 10,
                                                        leading: 20,
                                                        bottom: 0,
                                                        trailing: 20)

        return section
    }
    
    //MARK: - Make Data source
    private func setupDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Itemm>(collectionView: collectionView) { (collectionView, indexPath, model) -> UICollectionViewCell in
            guard let section = Section(rawValue: indexPath.section) else {
                fatalError("")
            }
            switch section {
            case .eatingPsychology:
                return self.configure(indexPath, title: model.title, model.image.x2)
            case .fastingBasics:
                return self.configure(indexPath, title: model.title, model.image.x2)
            case .healthyEating:
                return self.configure(indexPath, title: model.title, model.image.x2)
            case .explained:
                return self.configure(indexPath, title: model.title, model.image.x2)
            }
        }
        
        dataSource?.supplementaryViewProvider = { collectionView, kind, indexPath in
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeaderView.reuseID, for: indexPath) as? SectionHeaderView else { fatalError() }
            guard let section = Section.init(rawValue: indexPath.section) else { fatalError() }
            sectionHeader.title.text = section.description()
            return sectionHeader
        }
    }
    
    private func createHeaders() ->NSCollectionLayoutBoundarySupplementaryItem {
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(1))
        
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .topLeading)
        
        return sectionHeader
    }
    
    private func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Itemm>()
        DispatchQueue.main.async {
            guard let sections = self.presener?.sections?.sections else { return }
            
            snapshot.appendSections([.eatingPsychology, .fastingBasics, .healthyEating, .explained])
            snapshot.appendItems(sections[0].items, toSection: .eatingPsychology)
            snapshot.appendItems(sections[1].items, toSection: .fastingBasics)
            snapshot.appendItems(sections[2].items, toSection: .healthyEating)
            snapshot.appendItems(sections[3].items, toSection: .explained)
            self.dataSource?.apply(snapshot)
        }
    }
    
    private func configure(_ indexPath: IndexPath, title: String, _ imageStr: String) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LayoutCell.reuseID, for: indexPath) as? LayoutCell else { fatalError("Not found cell ID") }
        cell.titleLabel.text = title
        cell.configure(title, imageStr)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
    }
}

extension CollectionViewController: CollectionViewProtocol {

}

