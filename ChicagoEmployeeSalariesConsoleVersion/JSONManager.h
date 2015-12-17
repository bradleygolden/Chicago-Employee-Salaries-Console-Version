//
//  JSONManager.h
//  ChicagoEmployeeSalariesConsoleVersion
//
//  Created by Bradley Golden on 12/17/15.
//  Copyright © 2015 Bradley Golden. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONManager : NSObject

@property NSString *baseUrl;
@property NSArray *jsonArr;

- (instancetype)initWithBaseUrl:(NSString*)url;

-(NSArray*)executeQuery:(NSString*)url;
-(NSArray*)parseData:(NSData *)responseData;
-(NSString*)queryToURL:(NSString*)query;
-(NSArray*)searchByFirstName:(NSString*)firstName;

@end
