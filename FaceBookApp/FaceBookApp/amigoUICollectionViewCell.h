//
//  amigoUICollectionViewCell.h
//  FaceBookApp
//
//  Created by CCDM23 on 30/08/14.
//  Copyright (c) 2014 CCDM23. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface amigoUICollectionViewCell : UICollectionViewCell

@property (weak,nonatomic) IBOutlet UILabel *name;
@property (weak,nonatomic) IBOutlet UIImageView *photo;
@property (weak,nonatomic) IBOutlet UIImageView *check;

@end
