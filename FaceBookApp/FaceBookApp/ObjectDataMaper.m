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
    pub.latitud=[publicacion  objectForKey:@"latitud"];
    pub.longitud=[publicacion  objectForKey:@"longitud"];
    pub.objectId=[self obtenerNextId];
    
    [self.context save:&error];
    
    if(error !=nil)
        return NO;
    
    return YES;
}

-(int)obtenerNextId{
    NSError *error;
    
    self.request=[[NSFetchRequest alloc] init];
    self.appDelegate=[[UIApplication sharedApplication] delegate];
    self.context=[self.appDelegate managedObjectContext];
    
    [self.request setEntity:[NSEntityDescription entityForName:@"Publicaciones" inManagedObjectContext:self.context]];
    
    NSMutableArray *result=[[NSMutableArray alloc] init];
    NSArray *pubs=[self.context executeFetchRequest:self.request error:&error];
    
    if(error!=nil)
        return 0;
    
    return [pubs count]+1;
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
                @"id":[NSString stringWithFormat:@"%d",pub.objectId],
                @"mensaje":pub.mensaje,
                @"autor":pub.autor,
                @"latitud":pub.latitud,
                @"longitud":pub.longitud
                };
        
        [result addObject:obj];
    }
    
    return result;
}

-(BOOL)eliminarPublicacion:(int *)objectID{
    NSError *error;
    self.request=[[NSFetchRequest alloc] init];
    self.appDelegate=[[UIApplication sharedApplication] delegate];
    self.context=[self.appDelegate managedObjectContext];
    
    [self.request setEntity:[NSEntityDescription entityForName:@"Publicaciones" inManagedObjectContext:self.context]];
    
    //predicsdo para hacer consulta al core data, es equivalente al WHERE de SQL
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF == %@", objectID];
    [self.request setPredicate:predicate];
    
    
    [self.context deleteObject:[[self.context executeFetchRequest:self.request error:&error] lastObject]];
    
    [self.context save:&error];
    
    if(error!=nil)
        return NO;
    
    return YES;
}

-(BOOL)editarPublicacion:(NSDictionary *)publicacion{
    NSError *error;
    self.request=[[NSFetchRequest alloc] init];
    self.appDelegate=[[UIApplication sharedApplication] delegate];
    self.context=[self.appDelegate managedObjectContext];
    
    [self.request setEntity:[NSEntityDescription entityForName:@"Publicaciones" inManagedObjectContext:self.context]];
    //predicado para hacer consulta al core data, es equivalente al WHERE de SQL
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"objectId ==", [publicacion objectForKey:@"objectId"]];
    [self.request setPredicate:predicate];
    
    Publicacion *pub=[[self.context executeFetchRequest:self.request error:&error] firstObject];
    
    pub.autor=[publicacion objectForKey:@"autor"];
    pub.mensaje=[publicacion objectForKey:@"mensaje"];
    pub.latitud=[publicacion objectForKey:@"latitud"];
    pub.longitud=[publicacion objectForKey:@"longitud"];
    
    [self.context save:&error];
    
    if(error!=nil)
        return NO;
    
    return YES;
}

@end
