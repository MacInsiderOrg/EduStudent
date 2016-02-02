//
//  ManageDocumentsCollectionViewController.m
//  EduStudent
//
//  Created by Andrew Kochulab on 02.02.16.
//  Copyright © 2016 Andrew Kochulab. All rights reserved.
//

#import "ManageDocumentsCollectionViewController.h"
#import "ManageDocumentsCollectionViewCell.h"

@interface ManageDocumentsCollectionViewController ()

@property (strong, nonatomic) NSArray* categoryNames;
@property (strong, nonatomic) NSMutableArray* categoryImages;
@property (strong, nonatomic) NSArray* categoryBackgrounds;

@end

@implementation ManageDocumentsCollectionViewController

static NSString * const manageDocumentsCellIdentifier = @"ManageDocumentsCellIdentifier";

#pragma mark - UIViewController methods

- (void) viewDidLoad {
    [super viewDidLoad];
    [self setupCategories];
}

- (void) setupCategories {
    self.categoryNames = @[@"Files", @"Notes", @"Sessions", @"Assessments", @"Homeworks"];
    self.categoryImages = [NSMutableArray array];
    for (NSString* categoryName in self.categoryNames) {
        [self.categoryImages addObject: [UIImage imageNamed: [categoryName lowercaseString]]];
    }
    self.categoryBackgrounds = [NSArray arrayWithObjects:
                                [UIColor colorWithRed: .992f green: .682f blue: .157f alpha: 1.f],
                                [UIColor colorWithRed: .537f green: .773f blue: .035f alpha: 1.f],
                                [UIColor colorWithRed: .173f green: .647f blue: .871f alpha: 1.f],
                                [UIColor colorWithRed: .984f green: .165f blue: .208f alpha: 1.f],
                                [UIColor colorWithRed: .176f green: .647f blue: .871f alpha: 1.f],
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
    ManageDocumentsCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier: manageDocumentsCellIdentifier forIndexPath: indexPath];
    cell.categoryTitle.text = [self.categoryNames objectAtIndex: indexPath.row];
    cell.categoryImageView.image = [self.categoryImages objectAtIndex: indexPath.row];
    cell.backgroundColor = [self.categoryBackgrounds objectAtIndex: indexPath.row];
    cell.categoryImageView.contentScaleFactor = 1.4f;
    
    return cell;
}

#pragma mark - UICollectionViewDelegate methods

- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //NSArray* segueIdentifiers = @[@"FilesSegueIdentifier", @"NotesSegueIdentifier", @"SessionsSegueIdentifier", @"AssessmentsSegueIdentifier", @"HomerworksSegueIdentifier"];
    //[self performSegueWithIdentifier: [segueIdentifiers objectAtIndex: indexPath.row]  sender: indexPath];
}

#pragma mark - UICollectionViewDelegateFlowLayout methods

- (CGSize) collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CGFloat width = CGRectGetWidth(collectionView.frame) / 2;
    CGFloat height = CGRectGetHeight(collectionView.frame) / 2;
    
    if (indexPath.row >= 2) {
        width = (indexPath.row % 2 == 0) ? (CGRectGetWidth(collectionView.frame) / 4) : (CGRectGetWidth(collectionView.frame) / 2);
    }
    
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