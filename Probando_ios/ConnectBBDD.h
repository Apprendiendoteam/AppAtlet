//
//  ConnectBBDD.h
//  Probando_ios
//
//  Created by asun martinez on 13/11/16.
//  Copyright © 2016 asun martinez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"

@interface ConnectBBDD : NSObject

@property (readonly) sqlite3* bbdd;

-(void)crearTabla;

@end
