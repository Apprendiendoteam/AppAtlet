//
//  DetailViewController.h
//  Probando_ios
//
//  Created by asun martinez on 13/11/16.
//  Copyright © 2016 asun martinez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Atleta.h"
#import "DaoAtletas.h"

@interface DetailViewController : UIViewController


-(void)loadData:(Atleta*)atletaRecibido;
-(void)limpiar;

@end
