//
//  ObjectDataMaper.m
//  FaceBookApp
//
//  Created by CCDM23 on 06/09/14.
//  Copyright (c) 2014 CCDM23. All rights reserved.
//

#import "ObjectDataMaper.h"
#import "Publicacion.h"

@implementation ObjectDataMaper


-(BOOL)guardarPublicacion:(NSDictionary *)publicacion{
    NSError *error;
    
    self.appDelegate=[[UIApplication sharedApplication] delegate];
    self.context=[self.appDelegate managedObjectContext];
    
    Publicacion *pub;
    pub=[NSEntityDescription  insertNewObjectForEntityForName:@"Publicaciones" inManagedObjectContext:self.context];
    
    pub.mensaje=[publicacion  objectForKey:@"mensaje"];
    pub.autor=[publicacion  objectForKey:@"autor"];
    pub.latitud=[[publicacion  objectForKey:@"latitud"] doubleValue];
    pub.longitud=[[publicacion  objectForKey:@"longitud"] doubleValue];
    
    [self.context save:&error];
    
    if(error !=nil)
        return NO;
    
    return YES;
}

-(NSMutableArray *)obtenerPublicaciones{
    NSError *error;
    
    self.request=[[NSFetchRequest alloc] init];
    self.appDelegate=[[UIApplication sharedApplication] delegate];
    self.context=[self.appDelegate managedObjectContext];
    
    [self.request setEntity:[NSEntityDescription entityForName:@"Publicaciones" inManagedObjectContext:self.context]];
    
    NSMutableArray *result=[[NSMutableArray alloc] init];
    NSArray *pubs=[self.context executeFetchRequest:self.request error:&error];
    
    if(error!=nil)
        return result;
    
    
    NSDictionary *obj;
    for (Publicacion *pub in pubs) {
        obj=@{
                @"mensaje":pub.mensaje,
                @"autor":pub.autor,
                @"latitud":[NSString stringWithFormat:@"%f", pub.latitud],
                @"longitud":[NSString stringWithFormat:@"%f", pub.longitud]
                };
        
        [result addObject:obj];
    }
    
    return result;
}

@end
