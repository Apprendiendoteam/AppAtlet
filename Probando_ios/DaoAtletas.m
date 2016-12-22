//
//  DaoAtletas.m
//  Probando_ios
//
//  Created by asun martinez on 13/11/16.
//  Copyright © 2016 asun martinez. All rights reserved.
//

#import "DaoAtletas.h"

@implementation DaoAtletas

-(void)guardarAtleta:(Atleta*)atleta{
    ConnectBBDD* atConnect = [[ConnectBBDD alloc]init];
    
    sqlite3 *bbdd = atConnect.bbdd;
    NSString* sQuery = @"insert into ATLETAS (nombre, apellidos, prueba, categoria) values (?,?,?,?);";
    
    sqlite3_stmt *query = nil;
    sqlite3_prepare_v2(bbdd, [sQuery UTF8String], -1, &query, nil);
    
    sqlite3_bind_text(query, 1, [atleta.nombre UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(query, 2, [atleta.apellidos UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(query, 3, [atleta.prueba UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(query, 4, [atleta.categoria UTF8String], -1, SQLITE_TRANSIENT);
    
    sqlite3_step(query);
    sqlite3_reset(query);
  
}
-(NSMutableArray*)crearListado{
    NSMutableArray* atletasArray = [[NSMutableArray alloc]init];
    ConnectBBDD* atConnect = [[ConnectBBDD alloc]init];
    
    sqlite3 *bbdd = atConnect.bbdd;
    
    NSString *sQuery = @"select * from ATLETAS order by nombre;";
    
    sqlite3_stmt* query = nil;
    sqlite3_prepare_v2(bbdd, [sQuery UTF8String], -1, &query, nil);
    
    Atleta* atleta = nil;
    
    while(sqlite3_step(query)==SQLITE_ROW){
        int codigo = sqlite3_column_int(query, 0);
        NSString* nombre = [NSString stringWithUTF8String:(const char*)sqlite3_column_text(query, 1)];
        NSString* apellidos = [NSString stringWithUTF8String:(const char*)sqlite3_column_text(query, 2)];
        NSString* prueba = [NSString stringWithUTF8String:(const char*)sqlite3_column_text(query, 3)];
        NSString* categoria = [NSString stringWithUTF8String:(const char*)sqlite3_column_text(query, 4)];
        
        atleta = [[Atleta alloc]initWithCodigo:codigo WithNombre:nombre WithApellidos:apellidos WithPrueba:prueba WithCategoria:categoria];
        
        [atletasArray addObject:atleta];
    }
    sqlite3_reset(query);
    return atletasArray;
}

-(NSMutableArray*)buscarPorPrueba:(NSString*)prueba{
    NSMutableArray* atletasArrayPorPruebas = [[NSMutableArray alloc]init];
    ConnectBBDD* atConnect = [[ConnectBBDD alloc]init];
    
    sqlite3 *bbdd = atConnect.bbdd;
    
    NSString *sQuery = @"select * from ATLETAS where prueba=?;";
    
    sqlite3_stmt* query = nil;
    sqlite3_prepare_v2(bbdd, [sQuery UTF8String], -1, &query, nil);
    sqlite3_bind_text(query, 3, [prueba UTF8String], -1, SQLITE_STATIC);
    
    Atleta* atleta = nil;
    
    while(sqlite3_step(query)==SQLITE_ROW){
        NSString* nombre = [NSString stringWithUTF8String:(const char*)sqlite3_column_text(query, 1)];
        NSString* apellidos = [NSString stringWithUTF8String:(const char*)sqlite3_column_text(query, 2)];
        NSString* prueba = [NSString stringWithUTF8String:(const char*)sqlite3_column_text(query, 3)];
        NSString* categoria = [NSString stringWithUTF8String:(const char*)sqlite3_column_text(query, 4)];
        
        atleta = [[Atleta alloc]initWithNombre:nombre WithApellidos:apellidos WithPrueba:prueba WithCategoria:categoria];
        
        [atletasArrayPorPruebas addObject:atleta];
    }
    sqlite3_reset(query);
    return atletasArrayPorPruebas;

}
-(NSMutableArray*)buscarPorCategoria:(NSString*)categoria{
    NSMutableArray* atletasArrayPorCategoria = [[NSMutableArray alloc]init];
    ConnectBBDD* atConnect = [[ConnectBBDD alloc]init];
    
    sqlite3 *bbdd = atConnect.bbdd;
    
    NSString *sQuery = @"select * from ATLETAS where categoria=?;";
    
    sqlite3_stmt* query = nil;
    sqlite3_prepare_v2(bbdd, [sQuery UTF8String], -1, &query, nil);
    sqlite3_bind_text(query, 4, [categoria UTF8String], -1, SQLITE_STATIC);
    
    Atleta* atleta = nil;
    
    while(sqlite3_step(query)==SQLITE_ROW){
        NSString* nombre = [NSString stringWithUTF8String:(const char*)sqlite3_column_text(query, 1)];
        NSString* apellidos = [NSString stringWithUTF8String:(const char*)sqlite3_column_text(query, 2)];
        NSString* prueba = [NSString stringWithUTF8String:(const char*)sqlite3_column_text(query, 3)];
        NSString* categoria = [NSString stringWithUTF8String:(const char*)sqlite3_column_text(query, 4)];
        
        atleta = [[Atleta alloc]initWithNombre:nombre WithApellidos:apellidos WithPrueba:prueba WithCategoria:categoria];
        
        [atletasArrayPorCategoria addObject:atleta];
    }
    sqlite3_reset(query);
    
    return atletasArrayPorCategoria;

}
-(void)borrarAtleta:(int)codigo{
    ConnectBBDD* atConnect = [[ConnectBBDD alloc]init];
    sqlite3 *bbdd = atConnect.bbdd;
    NSString *sQuery = @"delete from ATLETAS where id=?;";
    
    sqlite3_stmt* query=nil;
    
    sqlite3_prepare_v2(bbdd, [sQuery UTF8String], -1, &query, nil);
    sqlite3_bind_int(query, 1, codigo);
    
    sqlite3_step(query);
    sqlite3_reset(query);
}

-(void)editarAtleta:(int)idAtletaAEditar conDatos:(Atleta*)atleta{
    ConnectBBDD* atConnect = [[ConnectBBDD alloc]init];
    sqlite3 *bbdd = atConnect.bbdd;
    
     NSString *sQuery = @"update ATLETAS set nombre = ?, apellidos = ?, prueba = ?, categoria = ? where id = ?;";
    sqlite3_stmt* query=nil;

    
    sqlite3_prepare_v2(bbdd, [sQuery UTF8String], -1, &query, nil);
    
    sqlite3_bind_int(query, 5, idAtletaAEditar);
    sqlite3_bind_text(query, 1, [atleta.nombre UTF8String], -1, SQLITE_STATIC);
    sqlite3_bind_text(query, 2, [atleta.apellidos UTF8String], -1, SQLITE_STATIC);
    sqlite3_bind_text(query, 3, [atleta.prueba UTF8String], -1, SQLITE_STATIC);
    sqlite3_bind_text(query, 4, [atleta.categoria UTF8String], -1, SQLITE_STATIC);
    
    sqlite3_step(query);
    
    sqlite3_reset(query);
}



@end
