//
//  ManageDocumentsCollectionViewCell.h
//  EduStudent
//
//  Created by Andrew Kochulab on 02.02.16.
//  Copyright © 2016 Andrew Kochulab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ManageDocumentsCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView* categoryImageView;
@property (weak, nonatomic) IBOutlet UILabel* categoryTitle;

@end