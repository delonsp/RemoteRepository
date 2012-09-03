//
//  DETextView2.h
//  ImpotenciaSexual
//
//  Created by Alain Machado da Silva Dutra on 08/04/12.
//  Copyright (c) 2012 DrSolution. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DETextView2 : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) NSDictionary *itensRaiz;
@property (strong, nonatomic) NSDictionary *picturesDictionary;
@property (strong, nonatomic) NSArray *picturesArray;
@property (copy, nonatomic) NSMutableString *item;
@property (strong, nonatomic) NSArray *myArray;
@property (strong, nonatomic) NSMutableArray *arrayOfTags;


@end
