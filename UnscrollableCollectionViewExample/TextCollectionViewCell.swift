import UIKit

final class TextCollectionViewCell: UICollectionViewCell {
    var text: String? {
        get { label.text }
        set { label.text = newValue }
    }

    private weak var label: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureSubviews()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
    }

    private func configureSubviews() {
        backgroundColor = .systemGray4

        let label = UILabel()
        self.label = label
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}

