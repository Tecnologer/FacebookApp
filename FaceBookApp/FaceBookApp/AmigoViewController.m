//
//  AmigoViewController.m
//  FaceBookApp
//
//  Created by CCDM23 on 30/08/14.
//  Copyright (c) 2014 CCDM23. All rights reserved.
//

#import "AmigoViewController.h"

@interface AmigoViewController ()

@end

@implementation AmigoViewController{
    NSMutableArray *items;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    items=[[NSMutableArray alloc] init];
    
    for(int i=0;i<15;i++){
        NSMutableDictionary *item=[[NSMutableDictionary alloc] init];
        
        [item setValue:@"off" forKey:@"check"];
        [item setValue:@"Tecnologer" forKey:@"name"];
        
        [items addObject:item];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark-Collection View Controller

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 100;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
