//
//  PublicacionTableViewController.m
//  FaceBookApp
//
//  Created by CCDM02 on 23/08/14.
//  Copyright (c) 2014 CCDM02. All rights reserved.
//

#import "PublicacionTableViewController.h"
#import "ObjectDataMaper.h"

#define CARACTERES 250


@interface PublicacionTableViewController ()

@end

@implementation PublicacionTableViewController{
    //UITabGestureRecognizer *tap;
    ObjectDataMaper *odm;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UITapGestureRecognizer *tab;
    tab = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cerrarTeclado)];
    
    //[self.view addGestureRecognizer:tab];
    
    self.caracteres.text=[NSString stringWithFormat:@"%d",CARACTERES];
    //Con esta linea de codigo nuestro componente grafico ya esta siendo reconocido por una clase.
    self.txtEstado.delegate = self;
    
    odm=[[ObjectDataMaper alloc] init];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    if ( section == 0)
    {
        return 1;
    }
    else if ( section == 1)
    {
        return 2;
    }
    return 0;
}

#pragma mark-TextField Ddelegate
-(void)cerrarTeclado{
    [self.txtEstado resignFirstResponder];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    return [ textField resignFirstResponder ];
}

#pragma mark- IBAction

-(IBAction)publicar:(id)sender{
    NSDictionary *obj=@{
                        @"autor": @"Tecnologer",
                        @"mensaje": self.txtEstado.text,
                        @"latitud": @"24.7862507",
                        @"longitud": @"-107.3995696"
                        };
    
    //guardar en CoreData
    if(![odm guardarPublicacion:obj]){
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Error" message:@"Aqui fue donde la puerca torcio el rabo." delegate: nil cancelButtonTitle: @"OK" otherButtonTitles:nil,nil];
        [alert show];
    }
    
    self.txtEstado.text=@"";
    self.caracteres.text=[NSString stringWithFormat:@"%d",CARACTERES];

}

-(IBAction)publicarDos:(UIButton *)sender{
    NSUserDefaults *ud;
    ud=[NSUserDefaults standardUserDefaults];
    
    NSDictionary *obj=@{
                        @"autor": @"Tecnologer",
                        @"mensaje": self.txtEstado.text
                       };
    
    NSMutableArray *publicaciones = [[NSMutableArray alloc] init]; //[ud objectForKey:@"publicaciones"];
    [publicaciones addObject:obj];    
    
    if([ud objectForKey:@"publicaciones"] !=nil)
        [publicaciones addObjectsFromArray:[ud objectForKey:@"publicaciones"]];
    
    [ud setValue:publicaciones forKeyPath:@"publicaciones"];
    
    [ud synchronize];
    
    self.txtEstado.text=@"";
    self.caracteres.text=[NSString stringWithFormat:@"%d",CARACTERES];
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    NSString *text=[textField.text stringByReplacingCharactersInRange:range withString:string];
    
    
    
    if([text length]>CARACTERES){
        self.caracteres.textColor=[UIColor redColor];
        return NO;
    }
    else{
        self.caracteres.text=[NSString stringWithFormat:@"%d",CARACTERES-[text length]];
        self.caracteres.textColor=[UIColor colorWithRed:53/255.0 green:156/255.0 blue:255/255.0 alpha:0.5];
    }
    
    return YES;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
