//
//  DataSourceAtleta.h
//  Probando_ios
//
//  Created by asun martinez on 13/11/16.
//  Copyright © 2016 asun martinez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIkit.h"
#import "Atleta.h"

@interface DataSourceAtleta : NSObject <UITableViewDataSource>

@property NSMutableArray* arrayAtletas;

-(Atleta*)atletaAt:(long)posicion;


@end
