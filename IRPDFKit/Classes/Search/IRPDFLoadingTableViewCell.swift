//
//  Created by Aleksey Mikhailov on 19/10/16.
//  Copyright © 2016 IceRock Development. All rights reserved.
//

import Foundation

class IRPDFLoadingTableViewCell: UITableViewCell {
  let activityIndicator: UIActivityIndicatorView
  
  init(reuseIdentifier identifier: String?) {
    activityIndicator = UIActivityIndicatorView()
    activityIndicator.hidesWhenStopped = false
    activityIndicator.hidden = false
    activityIndicator.color = UIColor.blackColor()
    
    super.init(style: .Default, reuseIdentifier: identifier)
    
    contentView.addSubview(activityIndicator)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    let rect = contentView.bounds
    let itemSize = activityIndicator.bounds.size
    let halfItemSize = CGSizeMake(itemSize.width / 2.0, itemSize.height / 2.0)
    
    activityIndicator.frame = CGRectMake(rect.width / 2.0 - halfItemSize.width,
                                         rect.height / 2.0 - halfItemSize.height,
                                         itemSize.width,
                                         itemSize.height)
  }
  
  override func didMoveToSuperview() {
    if let _ = superview {
      activityIndicator.startAnimating()
    } else {
      activityIndicator.stopAnimating()
    }
  }
}
