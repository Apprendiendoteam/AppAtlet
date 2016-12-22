//
//  DataSourceAtleta.m
//  Probando_ios
//
//  Created by asun martinez on 13/11/16.
//  Copyright © 2016 asun martinez. All rights reserved.
//

#import "DataSourceAtleta.h"
#import "UIKit/UIkit.h"
#import "Atleta.h"
#import "DaoAtletas.h"


@implementation DataSourceAtleta

-(UITableViewCell*) tableView:(UITableView*)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    static NSString* idCelda = @"celda";
    UITableViewCell* celda = nil;
    
    celda = [tableView dequeueReusableCellWithIdentifier:idCelda];
    if(celda==nil){
        celda = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:idCelda];
        
    }
    NSInteger posicion = [indexPath row];
    
    Atleta* atleta = [_arrayAtletas objectAtIndex:posicion];
    celda.textLabel.text = [NSString stringWithFormat:@"%@ %@",atleta.nombre,atleta.apellidos];
    celda.detailTextLabel.text = [NSString stringWithFormat:@"%@",atleta.categoria];
    
    
    if(posicion%2==0){
        celda.tintColor = [UIColor blackColor];
        celda.detailTextLabel.textColor =[UIColor whiteColor];
        celda.backgroundColor = [UIColor grayColor];
        celda.textLabel.textColor = [UIColor whiteColor];
    }else{
        celda.tintColor = [UIColor blackColor];
        celda.textLabel.textColor = [UIColor grayColor];
        celda.backgroundColor = [UIColor whiteColor];
        celda.detailTextLabel.textColor = [UIColor grayColor];
    }
    return celda;
}

-(NSInteger)tableView:(UITableView*) tableView numberOfRowsInSection:(NSInteger)section{
    return _arrayAtletas.count;
}

-(Atleta*)atletaAt:(long)posicion{
    Atleta* atleta = _arrayAtletas[posicion];
    return atleta;
}


//esto es para el delete que aparezca cuando pulsas boton delete de arriba izq
-(void)tableView:(UITableView*) tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    //le indicamos el id del atleta que vamos a querrer borrar
    
    NSLog(@"a puntico de entrar en el if");
    if(editingStyle==UITableViewCellEditingStyleDelete){
        
        NSLog(@"Ha entrado en el if");
        DaoAtletas* dao = [DaoAtletas new];
        
        Atleta* atletaABorrar = [self.arrayAtletas objectAtIndex:indexPath.row];
        
        int codigoAletaBorrar = atletaABorrar.codigo;
        
        [dao borrarAtleta:codigoAletaBorrar];
        
        [_arrayAtletas removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:[NSMutableArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        

        [tableView setEditing:NO animated:YES];
        NSLog(@"%d",indexPath.row);
    }
    
}



/*
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}*/

@end
