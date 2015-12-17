//
//  main.m
//  ChicagoEmployeeSalariesConsoleVersion
//
//  Created by Bradley Golden on 12/17/15.
//  Copyright © 2015 Bradley Golden. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONManager.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        /********* GUI SIMULATION *********/
        
        // simulate first and last name from user input
        NSString *name = @"joe";
        
        // simulate department specifier
        NSString *department = @"POLICE";
        
        /********* MIDDLE TIER SIMULATION *********/
        
        // parse name
        NSString *firstName = [name componentsSeparatedByString:@" "][0];
        NSString *lastName;
        NSString *fullName;
        
        // uppercase first name
        firstName = [firstName uppercaseString];
        
        // attempt to read last name
        @try {
            lastName = [name componentsSeparatedByString:@" "][1];
            
            // uppercase last name
            lastName = [lastName uppercaseString];
            
            // concatenate first and last name
            fullName = [NSString stringWithFormat:@"%@,  %@", lastName, firstName];
        }
        // last name not inputted, only use single name provided
        @catch (NSException *exception) {
            lastName = nil;
            
            // concatenate first and last name
            fullName = firstName;
        }
        
        // init base url
        NSString *baseUrl = @"https://data.cityofchicago.org/resource/tt4n-kn4t.json?";
        
        // init json manager with base url for json database
        JSONManager *dt = [[JSONManager alloc]initWithBaseUrl:baseUrl];
        
        // build query - simulates a query request
        //NSString *query = [NSString stringWithFormat:@"$q=%@", fullName];
        NSString *query = [NSString stringWithFormat:@"$where=name like '%%%@%%'&department=%@", fullName, department];
        
        NSLog(@"%@", query);
        
        // build array of dictionary objects
        NSArray *jsonResponse = [dt executeQuery:query];
        
        // print results from jsonResponse
        NSLog(@"%@", jsonResponse);
    }
    return 0;
}
