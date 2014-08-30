//
//  PublicacionTableViewController.h
//  FaceBookApp
//
//  Created by CCDM02 on 23/08/14.
//  Copyright (c) 2014 CCDM02. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PublicacionTableViewController : UITableViewController <
    UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtEstado;
@property (weak, nonatomic) IBOutlet UILabel *caracteres;

-(IBAction)publicar:(UIButton *)sender;

@end
