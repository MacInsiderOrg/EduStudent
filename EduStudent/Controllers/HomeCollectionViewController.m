//
//  HomeCollectionViewController.m
//  EduStudent
//
//  Created by Andrew Kochulab on 01.02.16.
//  Copyright © 2016 Andrew Kochulab. All rights reserved.
//

#import "HomeCollectionViewController.h"
#import "HomeCollectionViewCell.h"

@interface HomeCollectionViewController ()

@property (strong, nonatomic) NSArray* categoryNames;
@property (strong, nonatomic) NSArray* categoryImages;
@property (strong, nonatomic) NSArray* categoryBackgrounds;

@end


@implementation HomeCollectionViewController

static NSString * const homeCellIdentifier = @"HomeCellIdentifier";
static NSString * const joinToClassSegueIdentifier = @"JoinToClassSegueIdentifier";
static NSString * const manageDocumentsSegueIdentifier = @"ManageDocumentsSegueIdentifier";

#pragma mark - UIViewController methods

- (void) viewDidLoad {
    [super viewDidLoad];
    [self setupCategories];
}

- (void) setupCategories {
    self.categoryNames = @[@"Join to class", @"Notes", @"Library", @"Additionally"];
    self.categoryImages = [NSArray arrayWithObjects:
                           [UIImage imageNamed: @"create_class"],
                           [UIImage imageNamed: @"notes"],
                           [UIImage imageNamed: @"library"],
                           [UIImage imageNamed: @"additional"],
                           nil];
    self.categoryBackgrounds = [NSArray arrayWithObjects:
                                [UIColor colorWithRed: 1.f green: .858f blue: .251f alpha: 1.f],
                                [UIColor colorWithRed: .380f green:.941f blue: .380f alpha: 1.f],
                                [UIColor colorWithRed: .368f green: .937f blue: 1.f alpha: 1.f],
                                [UIColor colorWithRed: 1.f green: .482f blue: .478f alpha: 1.f],
                                nil];
}

- (void) viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [self.collectionViewLayout invalidateLayout];
}

#pragma mark - UICollectionViewDataSource methods

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.categoryNames count];
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier: homeCellIdentifier forIndexPath: indexPath];
    cell.categoryTitle.text = [self.categoryNames objectAtIndex: indexPath.row];
    cell.categoryImageView.image = [self.categoryImages objectAtIndex: indexPath.row];
    cell.backgroundColor = [self.categoryBackgrounds objectAtIndex: indexPath.row];
    cell.tag = indexPath.row;
    
    return cell;
}

#pragma mark - UICollectionViewDelegate methods 

- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        [self performSegueWithIdentifier: joinToClassSegueIdentifier sender: indexPath];
    } else {
        [self performSegueWithIdentifier: manageDocumentsSegueIdentifier sender: indexPath];
    }
}

#pragma mark - UICollectionViewDelegateFlowLayout methods

- (CGSize) collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CGFloat width = CGRectGetWidth(collectionView.frame) / 2;
    CGFloat height = CGRectGetHeight(collectionView.frame) / 2;
    
    return CGSizeMake(width, height);
}

- (CGFloat) collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0.f;
}

- (CGFloat) collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0.f;
}

- (UIEdgeInsets) collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0.f, 0.f, 0.f, 0.f);
}

@end