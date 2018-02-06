//
//  TableViewExt.swift
//  MyTrax
//
//  Created by Mugurel Moscaliuc on 27/10/2017.
//  Copyright © 2017 yakis. All rights reserved.
//

import UIKit

extension UITableView {
    
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView, T: NibLoadable {
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    
    func dequeueReusableCell<T: UITableViewCell> (forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {fatalError("Could not dequeue cell for identifier \(T.reuseIdentifier)")}
        return cell
    }
}
