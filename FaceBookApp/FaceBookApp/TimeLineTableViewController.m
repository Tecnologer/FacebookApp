//
//  TimeLineTableViewController.m
//  FaceBookApp
//
//  Created by CCDM02 on 16/08/14.
//  Copyright (c) 2014 CCDM02. All rights reserved.
//

#import "TimeLineTableViewController.h"
#import "DetallePublicacionTableViewController.h"
#import "ObjectDataMaper.h"

@interface TimeLineTableViewController ()

@end

@implementation TimeLineTableViewController{
    
    //Variable de instancia.
    NSMutableArray *publicaciones;
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

//Carga todas las configuraciones antes de visualizar la pantalla.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    publicaciones = [[NSMutableArray alloc] init];
    
    /*
     Mensaje:
     Autor:
     Similar en JSON:
     {
        mensaje:"Y andale...atrapan al chapo",
        autor: "EL DEBATE"
     }
     */
    
    //Objeto publicacion
    NSMutableDictionary *publicacion = [[NSMutableDictionary alloc] init];
    
    
    //Primera publicacion
    /*[publicacion setValue:@"Y andale...Atraparon al chapo!!!" forKey:@"mensaje"];
    [publicacion setValue:@"EL DEBATE" forKey:@"autor"];
    
    [publicaciones addObject:publicacion];
    
    
    //Segunda publicacion
    publicacion = [[NSMutableDictionary alloc] init];
    [publicacion setValue:@"Segunda publicacion!!!" forKey:@"mensaje"];
    [publicacion setValue:@"EL DEBATE" forKey:@"autor"];
    
    [publicaciones addObject:publicacion];
    
    
    //Tercer publicacion
    publicacion = [[NSMutableDictionary alloc] init];
    [publicacion setValue:@"Tercer publicacion!!!" forKey:@"mensaje"];
    [publicacion setValue:@"EL DEBATE" forKey:@"autor"];
    
    [publicaciones addObject:publicacion];
    
    NSLog(@"%@", publicaciones);*/
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    odm=[[ObjectDataMaper alloc] init];
}

//Agregado Manual.
//Se ejecuta despues de que se mostro la pantalla y se cargaron las configuraciones.
- (void) viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    NSUserDefaults *ud=[NSUserDefaults standardUserDefaults];
    
    NSLog(@"%@",[ud objectForKey:@"publicaciones"]);
    
    if([ud objectForKey:@"publicaciones"]!=nil){
        publicaciones=[ud objectForKey:@"publicaciones"];
        [self.tableView reloadData];
    }

}

//Agregado Manual.
//Antes de que se muestre la pantalla, y se cargaron las configuraciones.
/*- (void) viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];

}*/

- (void) viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    publicaciones=[odm obtenerPublicaciones];
    [self.tableView reloadData];
    
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if( section == 0 )
    {
        return [publicaciones count];
    
    }
    else
        return 0;
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    //return 0;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(editingStyle==UITableViewCellEditingStyleDelete){
        
        //obtenemos la publicacion usando el numero de celda que estamos eliminando
        NSDictionary *pub=[publicaciones objectAtIndex:[[self.tableView indexPathForSelectedRow] row]];
        
        NSManagedObjectID *objectID=[pub objectForKey:@"id"];
        
        //ejecutamos eliminar publicacion, si no se elimina de la base de datos, manda un alert
        if(![odm eliminarPublicacion:(NSManagedObjectID *) objectID]){
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Error" message:@"Error al eliminar publicacion" delegate: nil cancelButtonTitle: @"OK" otherButtonTitles:nil,nil];
            [alert show];

        }
        else{
            [publicaciones removeObjectAtIndex:indexPath.row];
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [self.tableView reloadData];
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"timeLineCell" forIndexPath:indexPath];
    
    
    NSMutableDictionary *obj = [publicaciones objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [obj objectForKey:@"mensaje"];
    cell.detailTextLabel.text = [obj objectForKey:@"autor"];
    
    
    
    
    
    // Configure the cell...
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}


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

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ( [[segue identifier] isEqualToString:@"detallePublicacionSegue"]  )
    {
        DetallePublicacionTableViewController *dpvc = [segue destinationViewController];
        NSIndexPath *index = [self.tableView indexPathForSelectedRow];
        dpvc.publicacion = [publicaciones objectAtIndex:index.row];
        
        NSLog(@"%@", dpvc.publicacion);
    }
    
}


@end
