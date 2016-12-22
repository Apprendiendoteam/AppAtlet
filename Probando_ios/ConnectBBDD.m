//
//  ConnectBBDD.m
//  Probando_ios
//
//  Created by asun martinez on 13/11/16.
//  Copyright © 2016 asun martinez. All rights reserved.
//

#import "ConnectBBDD.h"
#import "sqlite3.h"

@implementation ConnectBBDD

-(id)init{
    if(self ==[super init]){
        
        NSArray* rutas = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        
        NSString* rutaDirectory = [rutas objectAtIndex:0];
        
        NSString* rutaBBDD = [rutaDirectory stringByAppendingString:@"pruebaNav.sqlite"];
        
        sqlite3_open_v2([rutaBBDD UTF8String], &_bbdd, SQLITE_OPEN_READWRITE|SQLITE_OPEN_CREATE, nil);
        
    }
    return self;
}


-(void)crearTabla{
    char* error;
    const char *crearTabla = "create table if not exists ATLETAS (id integer primary key autoincrement, nombre text, apellidos text, prueba text, categoria text)";
    
    sqlite3_exec(_bbdd, crearTabla, nil, nil, &error);
    if(error){
        NSLog(@"Error al crear la tabla %s",error);
    }
}

-(void)dealloc{
    sqlite3_close(_bbdd);
}

@end
