//
//  UIView+Stylable.swift
//  Tablet
//
//  Created by 정준영 on 11/30/23.
//

import UIKit
import SwiftUI

public protocol Stylable {}

extension UIView: Stylable {
    @frozen public enum Alignment {
        case center
        case leading
        case trailing
        case top
        case bottom
        case fill
        case edges
        case firstBaseline
        case lastBaseline
    }
}

public extension Stylable where Self: UIView {
    
    init(
        alignment: Alignment = .center,
        distribution: UIStackView.Distribution = .fill,
        @UIViewBuilder _ content: () -> [UIView] = { [] }
    ) {
        self.init(frame: .zero)
        addVStackView(
            alignment: alignment,
            distribution: distribution,
            content
        )
    }
    
    @discardableResult
    func body(topSafeArea: Bool = false, _ view: UIView) -> Self {
        self.subviews.forEach { $0.removeFromSuperview() }
        self.addSubview(view)
        view.snp.makeConstraints { make in
            if topSafeArea {
                make.top.equalTo(safeAreaLayoutGuide)
            } else {
                make.top.equalToSuperview()
            }
            make.horizontalEdges.bottom.equalToSuperview()
        }
        return self
    }
    
    @discardableResult
    func body(
        alignment: Alignment = .center,
        distribution: UIStackView.Distribution = .fill,
        @UIViewBuilder _ content: () -> [UIView] = { [] }
    ) -> Self {
        self.subviews.forEach { $0.removeFromSuperview() }
        addVStackView(
            alignment: alignment,
            distribution: distribution,
            content
        )
        return self
    }
    
    @available(iOS 13.0, *)
    @discardableResult
    func body(
        alignment: Alignment = .center,
        distribution: UIStackView.Distribution = .fill,
        @ViewBuilder _ content: () -> some View
    ) -> Self {
        self.subviews.forEach { $0.removeFromSuperview() }
        if let hostView = UIHostingController(rootView: content()).view {
            addVStackView(alignment: alignment, distribution: distribution) {
                hostView
            }
        }
        return self
    }
    
    fileprivate func addVStackView(
        alignment: Alignment = .center,
        distribution: UIStackView.Distribution = .fill,
        @UIViewBuilder _ content: () -> [UIView]
    ) {
        let vStackView = VStackView(distribution: distribution, content)
        self.addSubview(vStackView)
        vStackView.snp.makeConstraints { make in
            switch alignment {
                case .center:
                    make.center.equalToSuperview()
                case .fill:
                    make.horizontalEdges.equalToSuperview()
                    make.centerY.equalToSuperview()
                case .edges:
                    make.edges.equalToSuperview()
                case .leading:
                    make.leading.equalToSuperview()
                    make.centerY.equalToSuperview()
                case .trailing:
                    make.trailing.equalToSuperview()
                    make.centerY.equalToSuperview()
                case .top:
                    make.top.equalToSuperview()
                    make.centerX.equalToSuperview()
                case .bottom:
                    make.bottom.equalToSuperview()
                    make.centerX.equalToSuperview()
                case .firstBaseline:
                    make.firstBaseline.equalToSuperview()
                    make.centerX.equalToSuperview()
                case .lastBaseline:
                    make.lastBaseline.equalToSuperview()
                    make.centerX.equalToSuperview()
            }
        }
    }
    
    @discardableResult
    func frame(width: CGFloat? = nil, height: CGFloat? = nil) -> Self {
        self.snp.makeConstraints { make in
            if let width {
                make.width.equalTo(width)
            }
            if let height {
                make.height.equalTo(height)
            }
        }
        return self
    }
    
    
    @discardableResult
    func padding(_ insets: UIEdgeInsets) -> Self {
        self.subviews.first?.snp.remakeConstraints { make in
            make.edges.equalToSuperview().inset(insets)
        }
        return self
    }
    
    @discardableResult
    func padding(_ edges: Edges) -> Self {
        self.subviews.first?.snp.remakeConstraints { make in
            make.edges.equalToSuperview().inset(edges.insets)
        }
        return self
    }
    
    @discardableResult
    func padding(_ length: CGFloat) -> Self {
        self.subviews.first?.snp.remakeConstraints { make in
            make.edges.equalToSuperview().inset(length)
        }
        return self
    }
}

extension Stylable where Self: UIView {
    
    @discardableResult
    func cornerRadius(_ radius: CGFloat) -> Self {
        self.layer.cornerRadius = radius
        return self
    }
    
    @discardableResult
    func isUserInteractionEnabled(_ bool: Bool) -> Self {
        self.isUserInteractionEnabled = bool
        return self
    }
    
    @discardableResult
    func backgroundColor(_ color: UIColor) -> Self {
        self.backgroundColor = color
        return self
    }
    
    @discardableResult
    func clipsToBounds(_ bool: Bool) -> Self {
        self.clipsToBounds = bool
        return self
    }
    
    @discardableResult
    func contentMode(_ contentMode: UIView.ContentMode) -> Self {
        self.contentMode = contentMode
        return self
    }
    
    @discardableResult
    func isHidden(_ bool: Bool) -> Self {
        self.isHidden = bool
        return self
    }
    
    @discardableResult
    func addSubView(_ view: UIView) -> Self {
        self.addSubview(view)
        return self
    }
    
    @discardableResult
    func setBorder(color: UIColor, width: CGFloat) -> Self {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
        return self
    }
    
    @discardableResult
    func setBorderRadius(_ radius: CGFloat) -> Self {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        return self
    }
    
    @discardableResult
    func alpha(_ alpha: CGFloat) -> Self {
        self.alpha = alpha
        return self
    }
}

