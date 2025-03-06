import UIKit

/**
 * A collection view subclass that calculates size of itself but cannot be scroll.
 *
 * Make sure set width or height constraint to enable self-sizing feature.
 */
class UnscrollableCollectionView: UICollectionView {
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        super.isScrollEnabled = false
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        super.isScrollEnabled = false
    }

    override var intrinsicContentSize: CGSize { contentSize }

    @available(*, unavailable)
    override var isScrollEnabled: Bool {
        get { super.isScrollEnabled }
        set { assert(!newValue) }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        invalidateIntrinsicContentSize()
    }
}
