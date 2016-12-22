//
//  Atleta.h
//  Probando_ios
//
//  Created by asun martinez on 13/11/16.
//  Copyright © 2016 asun martinez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Atleta : NSObject

@property (readonly) int codigo;
@property NSString* nombre;
@property NSString* apellidos;
@property NSString* prueba;
@property NSString* categoria;

-(id)initWithNombre:(NSString*)nombre WithApellidos:(NSString*)apellidos WithPrueba:(NSString*)prueba WithCategoria:(NSString*)categoria;

-(id)initWithCodigo:(int)codigo WithNombre:(NSString *)nombre WithApellidos:(NSString *)apellidos WithPrueba:(NSString *)prueba WithCategoria:(NSString *)categoria;

@end
