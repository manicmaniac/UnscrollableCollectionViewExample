import UIKit

final class MyViewController: UIViewController {
    private let cellReuseIdentifier = "Cell"
    private weak var collectionView: UICollectionView!

    override func loadView() {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemBackground
        view = scrollView

        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .systemGray6
        view.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            // containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])

        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 150, height: 150)
        let collectionView = UnscrollableCollectionView(frame: .zero, collectionViewLayout: layout)
        self.collectionView = collectionView
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemGray5
        // collectionView.isScrollEnabled = false
        collectionView.register(TextCollectionViewCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
        collectionView.dataSource = self
        containerView.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: containerView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            collectionView.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            // collectionView.heightAnchor.constraint(equalTo: containerView.heightAnchor),
        ])

        var configuration = UIButton.Configuration.bordered()
        configuration.title = "Button"
        let button = UIButton(configuration: configuration)
        button.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(button)
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 256),
            button.heightAnchor.constraint(equalToConstant: 48),
            button.topAnchor.constraint(equalToSystemSpacingBelow: collectionView.bottomAnchor, multiplier: 1),
            button.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
        ])
    }
}

extension MyViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int { 1 }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { 5 }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! TextCollectionViewCell
        cell.text = String(describing: indexPath)
        return cell
    }
}

#Preview {
    MyViewController()
}
