//
//  ShadowImageView.swift
//  NewsApp
//
//  Created by abdalla mahmoud on 26/05/2022.
//

import UIKit

class ShadowImageView: UIView {
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 20
        iv.clipsToBounds = true
        return iv
    }()
    
    private lazy var baseView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 5, height: 5)
        view.layer.shadowOpacity = 0.7
        view.layer.shadowRadius = 10.0
        return view
    }()
    
    func setupView() {
        addSubview(baseView)
        baseView.addSubview(imageView)
        setupConstraints()
    }
    
    func setupConstraints() {
        [baseView, imageView].forEach { view in
            NSLayoutConstraint.activate([
                view.topAnchor.constraint(equalTo: topAnchor, constant: 16),
                view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
                view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
            ])
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        baseView.layer.shadowPath = UIBezierPath(roundedRect: baseView.bounds, cornerRadius: 10).cgPath
        baseView.layer.shouldRasterize = true
        baseView.layer.rasterizationScale = UIScreen.main.scale
    }
}
