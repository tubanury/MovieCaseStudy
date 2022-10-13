//
//  StartSearchView.swift
//  MovieCaseStudy
//
//  Created by Tuba N. Yıldız on 13.10.2022.
//

import UIKit

class StartSearchView: UIView {
    
    private lazy var containerView: UIView = {
       let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.clipsToBounds = true
        temp.backgroundColor = .white
        return temp
    }() //boş container, padding vs verirken yönetim kolaylığı sağlar
    
    private lazy var mainStackView: UIStackView = {
    
        let temp = UIStackView(arrangedSubviews: [searchImage, searchLabel])
        searchImage.widthAnchor.constraint(equalToConstant: 250).isActive = true
        searchImage.heightAnchor.constraint(equalToConstant: 250).isActive = true
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.alignment = .center
        temp.distribution = .fill
        temp.axis = .vertical
        temp.spacing = 0
        return temp
        
        
    }()
 
    private lazy var searchImage: UIImageView = {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints =  false
        temp.contentMode = .scaleAspectFit
        temp.image = UIImage(named: "startSearch")
        
        return temp
        
    }()
    
    private lazy var searchLabel: UILabel = {
        let temp =  UILabel()
        temp.text = "Waiting to search!"
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addUserComponents()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addUserComponents(){
        addSubview(containerView)
        containerView.addSubview(searchImage)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            searchImage.topAnchor.constraint(equalTo: containerView.topAnchor),
            searchImage.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -60),
            searchImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 60),
            searchImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -60),
         
        ])
 
    }
    private func setupContainerViewLayers(){
        containerView.layer.cornerRadius = 10
        containerView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
}
