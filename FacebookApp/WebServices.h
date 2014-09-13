//
//  WebServices.h
//  FacebookApp
//
//  Created by CCDM23 on 13/09/14.
//  Copyright (c) 2014 Jesus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebServices : NSObject

+(NSDictionary *)sendPublication:(NSDictionary *)publicacion;
+(NSDictionary *)getPublication;
+(NSDictionary *)editPublication:(NSDictionary *)publicacion;
@end
