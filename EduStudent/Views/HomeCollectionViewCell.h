//
//  HomeCollectionViewCell.h
//  EduStudent
//
//  Created by Andrew Kochulab on 01.02.16.
//  Copyright © 2016 Andrew Kochulab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel* categoryTitle;
@property (weak, nonatomic) IBOutlet UIImageView* categoryImageView;

@end