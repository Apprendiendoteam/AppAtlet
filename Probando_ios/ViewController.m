//
//  ViewController.m
//  Probando_ios
//
//  Created by asun martinez on 13/11/16.
//  Copyright © 2016 asun martinez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tablaAtletas;

@property DataSourceAtleta* dsta;
@property NSMutableArray* arrayAtletaM;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}
/*
//Este método para seleccionar la fila y que muestre el detalle del atleta seleccionado
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    long posicion = indexPath.row;
    Atleta* atleta = [_dsta atletaAt:posicion];
    [self performSegueWithIdentifier:@"infoSegue" sender:atleta];
}*/

//este es el método para que pulsando el boton i (info) pase al detalle del atleta
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    long posicion = indexPath.row;
    Atleta* atleta = [_dsta atletaAt:posicion];
    [self performSegueWithIdentifier:@"infoSegue" sender:atleta];
}

-(void)prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"infoSegue"]){
        DetailViewController* viewcontroller = (DetailViewController*)[segue destinationViewController];
        
        [viewcontroller loadData:sender];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addNuevoAtleta:(id)sender {
    [self performSegueWithIdentifier:@"addSegue" sender:nil];
}

- (IBAction)deleteActiveAction:(id)sender {
    if (_tablaAtletas.editing == UITableViewCellEditingStyleDelete) {
        [_tablaAtletas setEditing:NO animated:YES];
        NSLog(@"Ha entrado en el editing style delete");
    }else{
        [_tablaAtletas setEditing:YES animated:YES];
        NSLog(@"Ha entrado en el editing style NO DELETE");

    }
    
}

-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"a ver si aparece por aqui en el WilAppear");
    DaoAtletas* daoAtleta = [DaoAtletas new];
    _arrayAtletaM = [daoAtleta crearListado];
    _dsta = [DataSourceAtleta new];
    _dsta.arrayAtletas = _arrayAtletaM;
    
    _tablaAtletas.dataSource = _dsta;
    _tablaAtletas.delegate = self;
    
    //para que no se puedan seleccionar variables celdas a la vez
    //self.tablaAtletas.allowsMultipleSelectionDuringEditing = NO;

}



-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"editingStyleForRowAtIndexPath entró");
    return UITableViewCellEditingStyleDelete;
}



@end
