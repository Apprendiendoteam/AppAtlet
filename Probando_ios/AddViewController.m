//
//  AddViewController.m
//  Probando_ios
//
//  Created by asun martinez on 13/11/16.
//  Copyright © 2016 asun martinez. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tfNombre;
@property (weak, nonatomic) IBOutlet UITextField *tfApellidos;
@property (weak, nonatomic) IBOutlet UITextField *tfPrueba;
@property (weak, nonatomic) IBOutlet UITextField *tfCategoria;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)saveAtleta:(id)sender {
    NSString* nombre = _tfNombre.text;
    NSString* apellidos = _tfApellidos.text;
    NSString* prueba = _tfPrueba.text;
    NSString* categoria = _tfCategoria.text;
    
    Atleta* atleta = [[Atleta alloc]initWithNombre:nombre WithApellidos:apellidos WithPrueba:prueba WithCategoria:categoria];
    
    DaoAtletas* daoAtleta = [DaoAtletas new];
    [daoAtleta guardarAtleta:atleta];
    
    [super.navigationController popViewControllerAnimated:YES];

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
