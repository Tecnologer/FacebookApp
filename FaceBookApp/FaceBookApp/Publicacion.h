//
//  Publicacion.h
//  FaceBookApp
//
//  Created by CCDM23 on 06/09/14.
//  Copyright (c) 2014 CCDM23. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface Publicacion : NSManagedObject

@property (strong, nonatomic) NSString *mensaje;
@property (strong, nonatomic) NSString *autor;
@property (strong, nonatomic) NSString *latitud;
@property (strong, nonatomic) NSString *longitud;

@end
