//
//  DaoAtletas.h
//  Probando_ios
//
//  Created by asun martinez on 13/11/16.
//  Copyright © 2016 asun martinez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Atleta.h"
#import "ConnectBBDD.h"

@interface DaoAtletas : NSObject

-(void)guardarAtleta:(Atleta*)atleta;
-(NSMutableArray*)crearListado;
-(NSMutableArray*)buscarPorPrueba:(NSString*)prueba;
-(NSMutableArray*)buscarPorCategoria:(NSString*)categoria;
-(void)borrarAtleta:(int)codigo;
-(void)editarAtleta:(int)idAtletaAEditar conDatos:(Atleta*)atleta;


@end
