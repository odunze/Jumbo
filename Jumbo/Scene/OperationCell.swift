//
//  OperationCell.swift
//  Jumbo
//
//  Created by Lotanna Igwe-Odunze on 1/31/20.
//  Copyright © 2020 Lotanna Odunze. All rights reserved.
//

import UIKit

class OperationCell: UITableViewCell {
    
    lazy var spacing: CGFloat = 10.0
    
    lazy var idLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    lazy var statusLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica-Bold", size: 20)
        label.textAlignment = .left
        return label
    }()
    
    lazy var progressBar: UIProgressView = {
        let bar = UIProgressView(progressViewStyle: .bar)
        bar.progressViewStyle = .default
        bar.progressTintColor = .orange
        return bar
    }()
    
    lazy var container: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        stack.addArrangedSubview(statusLabel)
        stack.addArrangedSubview(progressBar)
        stack.addArrangedSubview(idLabel)
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //Cell Appearance
        backgroundColor = .clear
        contentView.backgroundColor = .white
        
        layer.masksToBounds = false
        layer.shadowOpacity = 0.22
        layer.shadowRadius = 4
        layer.shadowColor = UIColor.black.cgColor
        contentView.layer.cornerRadius = 6.0
        
        contentView.addSubview(container)
        
        layoutSubviews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //Appearance
       contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing))
        
        //Label heights
        statusLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        idLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

        //Stack View Constraints
        container.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
}
