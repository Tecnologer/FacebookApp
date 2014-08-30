//
//  AmigoViewController.m
//  FaceBookApp
//
//  Created by CCDM23 on 30/08/14.
//  Copyright (c) 2014 CCDM23. All rights reserved.
//

#import "AmigoViewController.h"
#import "amigoUICollectionViewCell.h"

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

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [items count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    amigoUICollectionViewCell *amigo=[collectionView dequeueReusableCellWithReuseIdentifier:@"amigoCell" forIndexPath:indexPath];
    
    NSMutableDictionary *obj=[items objectAtIndex:indexPath.row];
    
    amigo.name.text=[obj objectForKey:@"name"];
    amigo.check.image=([[obj objectForKey: @"check"] isEqualToString:@"off"])?[UIImage imageNamed:@"checkOff.png"]:[UIImage imageNamed:@"check.png"];
    amigo.photo.image=[UIImage imageNamed:@"face.png"];
    return amigo;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSMutableDictionary *amigo=[items objectAtIndex:indexPath.row];
    
    if([[amigo objectForKey:@"check"] isEqualToString:@"off"]){
        [amigo setValue:@"on" forKey:@"check"];
    }
    else{
        [amigo setValue:@"off" forKey:@"check"];
    }
    
    [collectionView reloadData];
                                
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
