//
//  DetallePublicacionTableViewController.h
//  FaceBookApp
//
//  Created by CCDM02 on 16/08/14.
//  Copyright (c) 2014 CCDM02. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetallePublicacionTableViewController : UITableViewController

@property (strong, nonatomic) NSMutableDictionary *publicacion;

//weak se usa en IBOutlet, nuestra variable no sera dueña de la referencia a strong, al desaparecer la vista desaparece tambien las referencias weak.
@property (weak, nonatomic) IBOutlet UILabel *lblAutor;
@property (weak, nonatomic) IBOutlet UITextView *textMensaje;

//Regresa una acción a la vista
//Recibe un elemento que lo acciona.
- (IBAction)cerrar:(UIBarButtonItem *)sender;



@end
