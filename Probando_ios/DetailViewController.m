//
//  DetailViewController.m
//  Probando_ios
//
//  Created by asun martinez on 13/11/16.
//  Copyright © 2016 asun martinez. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tfNombre;
@property (weak, nonatomic) IBOutlet UITextField *tfApellidos;
@property (weak, nonatomic) IBOutlet UITextField *tfPrueba;
@property (weak, nonatomic) IBOutlet UITextField *tfCategoria;

@property Atleta* atletaARecibir;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [_tfNombre setText:_atletaARecibir.nombre];
    [_tfApellidos setText:_atletaARecibir.apellidos];
    [_tfPrueba setText:_atletaARecibir.prueba];
    [_tfCategoria setText:_atletaARecibir.categoria];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)loadData:(Atleta*)atletaRecibido{
    _atletaARecibir=atletaRecibido;
}

- (IBAction)editarAtleta:(id)sender {
    
    int codigo = _atletaARecibir.codigo;
    NSString* nombre= _tfNombre.text;
    NSString* apellidos = _tfApellidos.text;
    NSString* prueba = _tfPrueba.text;
    NSString* categoria = _tfCategoria.text;
    
    Atleta* atletaEditado = [[Atleta alloc]initWithCodigo:codigo WithNombre:nombre WithApellidos:apellidos WithPrueba:prueba WithCategoria:categoria];
    
    DaoAtletas* daoAtleta = [DaoAtletas new];
    [daoAtleta editarAtleta:codigo conDatos:atletaEditado];
    
    [super.navigationController popViewControllerAnimated:YES];
}

//esto para comprobar que la vista se destruyen
- (void)dealloc{
    NSLog(@"destruyendo vista detail");
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
