//
//  Atleta.m
//  Probando_ios
//
//  Created by asun martinez on 13/11/16.
//  Copyright © 2016 asun martinez. All rights reserved.
//

#import "Atleta.h"

@implementation Atleta

-(id)initWithNombre:(NSString *)nombre WithApellidos:(NSString *)apellidos WithPrueba:(NSString *)prueba WithCategoria:(NSString *)categoria{
    if(self ==[super init]){
        _nombre = nombre;
        _apellidos = apellidos;
        _prueba = prueba;
        _categoria = categoria;
    }return self;
}
-(id)initWithCodigo:(int)codigo WithNombre:(NSString *)nombre WithApellidos:(NSString *)apellidos WithPrueba:(NSString *)prueba WithCategoria:(NSString *)categoria{
    if(self ==[super init]){
        _codigo = codigo;
        _nombre = nombre;
        _apellidos = apellidos;
        _prueba = prueba;
        _categoria = categoria;
    }return self;
}
@end
