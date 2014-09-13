//
//  WebServices.m
//  FacebookApp
//
//  Created by CCDM23 on 13/09/14.
//  Copyright (c) 2014 Jesus. All rights reserved.
//

#import "WebServices.h"
#define BASE_URL @"http://api-experimentos.rhcloud.com"
@implementation WebServices

+(NSDictionary *)sendPublication:(NSDictionary *)publicacion{
    NSError *error;
    
    NSURLResponse *response;
    NSData *jsonData=[NSJSONSerialization  dataWithJSONObject:publicacion options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString *url=[NSString stringWithFormat:@"%@/sendPublication",BASE_URL];
    url=[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableURLRequest *request=[[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"POST"];//tipo de peticion
    [request setHTTPBody:jsonData];//informacion en forma de json
    [request setTimeoutInterval:20];//10 segundos de espera
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];//tipo de dato que se envia
    
    NSData *returnData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if(error)
        return @{@"success": @"0", @"message": @"Ocurrio un error en el servidor"};
    
    return [NSJSONSerialization JSONObjectWithData:returnData options:NSJSONReadingMutableContainers error:&error];
}

+(NSDictionary *)getPublication{
    NSError *error;
    
    NSURLResponse *response;
    
    NSString *url=[NSString stringWithFormat:@"%@/getPublications",BASE_URL];
    url=[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableURLRequest *request=[[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"GET"];//tipo de peticion
    [request setTimeoutInterval:10];//10 segundos de espera
    
    NSData *returnData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if(error)
        return @{@"success": @"0", @"message": @"Ocurrio un error en el servidor"};
    
    return [NSJSONSerialization JSONObjectWithData:returnData options:NSJSONReadingMutableContainers error:&error];
}

+(NSDictionary *)editPublication:(NSDictionary *)publicacion{
    
    NSError *error;
    
    NSURLResponse *response;
    NSData *jsonData=[NSJSONSerialization  dataWithJSONObject:publicacion options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString *url=[NSString stringWithFormat:@"%@/editPublication/%@",BASE_URL,[publicacion objectForKey:@"_id"]];
    url=[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableURLRequest *request=[[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"PUT"];//tipo de peticion
    [request setHTTPBody:jsonData];//informacion en forma de json
    [request setTimeoutInterval:20];//10 segundos de espera
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];//tipo de dato que se envia
    
    NSData *returnData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if(error)
        return @{@"success": @"0", @"message": @"Ocurrio un error en el servidor"};
    
    return [NSJSONSerialization JSONObjectWithData:returnData options:NSJSONReadingMutableContainers error:&error];
}
@end
