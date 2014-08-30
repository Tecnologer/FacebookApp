//
//  UbicacionViewController.m
//  FaceBookApp
//
//  Created by CCDM23 on 30/08/14.
//  Copyright (c) 2014 CCDM23. All rights reserved.
//

#import "UbicacionViewController.h"

@interface UbicacionViewController ()

@end

@implementation UbicacionViewController{
    GMSMapView *map;
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
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:24.7862507
                                                            longitude:-107.3995696
                                                                 zoom:16];
    //CGRectZero: crea un frame del tamaño de la pantalla
    //se asigna la camara al frame
    map = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    //que la ubicacion este activada
    map.myLocationEnabled = YES;
    //asigno el mapa al view controler
    
    GMSMarker *marker=[[GMSMarker alloc] init];
    marker.position=CLLocationCoordinate2DMake(24.7889949,-107.3986286);
    marker.title=@"Instito Tecnologico de Culichican";
    marker.snippet=@"Aqui en el tec en el curso de iOS";
    
    marker.map=map;
    self.view = map;
}

-(IBAction)cambiarVista:(id)sender{
    if([map mapType] == kGMSTypeHybrid){
        self.navigationItem.rightBarButtonItem.title=@"Vista Satélite";
        map.mapType=kGMSTypeNormal;
    }
    else{
        self.navigationItem.rightBarButtonItem.title=@"Vista normal";
        map.mapType=kGMSTypeHybrid;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
