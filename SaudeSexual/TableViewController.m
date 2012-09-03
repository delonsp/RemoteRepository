//
//  DETextView2.m
//  ImpotenciaSexual
//
//  Created by Alain Machado da Silva Dutra on 08/04/12.
//  Copyright (c) 2012 DrSolution. All rights reserved.
//


#import "OHAttributedLabel.h"
#import "NSAttributedString+Attributes.h"

#define FONT_SIZE 14.0f
#define CELL_CONTENT_WIDTH 320.0f
#define CELL_CONTENT_MARGIN 10.0f


@implementation DETextView2
@synthesize itensRaiz, item, myArray, arrayOfTags, picturesDictionary, picturesArray;


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray *array = [[NSArray alloc] init];
    if (itensRaiz == nil) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"textos" ofType:@"plist"];
        NSDictionary *dict = [[NSDictionary alloc]
                          initWithContentsOfFile:path];
        self.itensRaiz = dict;
    }
    
    if (self.picturesArray == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"picturesDictionary" ofType:@"plist"];
        NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
        self.picturesDictionary = dict;
    }
    
    if (self.item != nil) {
        array = [self.itensRaiz objectForKey:self.item];
        self.myArray = array;
        array = [self.picturesDictionary objectForKey:self.item];
        self.picturesArray = array;
    }
    
    if (self.arrayOfTags == nil) {
        
        self.arrayOfTags = [[NSMutableArray alloc] initWithCapacity:self.picturesArray.count];
        
        for (int i=1; i<=self.picturesArray.count; i++) {
            NSString *str = [NSString stringWithFormat:@"FIGURA %i", i];
            [self.arrayOfTags addObject:str];
        }

    }
    
         
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.myArray = nil;
    self.arrayOfTags = nil;
    self.picturesArray = nil;
    self.picturesDictionary = nil;
    self.item = nil;
    self.itensRaiz = nil;
}



#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.myArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int row = [indexPath row];
    self.item = [self.myArray objectAtIndex:row];
    static NSString *CellIdentifier = @"CellIdentifier";
    DETableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[DETableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
        
    cell.label.lineBreakMode = UILineBreakModeWordWrap;
    cell.label.minimumFontSize = FONT_SIZE;
    cell.label.font = [UIFont systemFontOfSize:FONT_SIZE];
    CGSize constraint = CGSizeMake(CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), 20000.0f);
    CGSize size = [item sizeWithFont:[UIFont systemFontOfSize:FONT_SIZE] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
    NSMutableAttributedString* attrItem = [NSMutableAttributedString attributedStringWithStringModifiedByTokens:item];
    cell.label.attributedText = attrItem;
    cell.label.frame = CGRectMake(CELL_CONTENT_MARGIN, CELL_CONTENT_MARGIN, CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), MAX(size.height, 44.0f));
    return cell;
      
}

- (void)tableView: (UITableView*)tableView  willDisplayCell: (UITableViewCell*)cell forRowAtIndexPath: (NSIndexPath*)indexPath {
    // customizar aparência da célula de acordo com a linha (row)
    
}


-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
           
    /* //Código que ajusta a altura da célula de acordo com o seu conteúdo de palavras
    CGSize constraint = CGSizeMake(CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), 20000.0f);
    CGSize size = [self.item sizeWithFont:[UIFont systemFontOfSize:FONT_SIZE] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
    CGFloat height = MAX(size.height, 44.0f);
    return height + (CELL_CONTENT_MARGIN * 2);*/
     
}



#pragma mark - Table view delegate

-(NSIndexPath *) tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // retornar nil se não se deseja que as células sejam selecionáveis, retornar indexPath para as células selecionáveis

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /* // Fazer alguma coisa com o resultado da seleção da célula. Se não estiver usando StoryBoard, pode se inicar uma ViewController
    // de forma programática
    UIViewController* someViewController = [[UIViewController alloc] initWithNibName:@"some nib" bundle:nil];
    // define parâmetros, normalmente atributos da viewcontroller que foi criada.
    [self.navigationController pushViewController:vc animated:YES]; */
    
}


@end
