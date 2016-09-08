//
//  ViewController.m
//  InterviewProject
//
//  Created by ankur on 21/07/16.
//  Copyright © 2016 ankur. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSMutableArray *array;
    bool evenbutton;
    bool oddbutton;
    bool primebutton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.Submit.layer.cornerRadius = 2;
    self.Even.layer.cornerRadius = 2;
    self.Odd.layer.cornerRadius = 2;
    self.Prime.layer.cornerRadius = 2;
    self.Sort.layer.cornerRadius = 2;
    
    self.Submit.layer.borderWidth = 1;
    self.Even.layer.borderWidth = 1;
    self.Odd.layer.borderWidth = 1;
    self.Prime.layer.borderWidth = 1;
    self.Sort.layer.borderWidth = 1;
    
    // Do any additional setup after loading the view, typically from a nib.
    self.collectionView.collectionViewLayout = [[customlayout alloc] init];
    UINib *cellNIb = [UINib nibWithNibName:@"CollectionViewCell" bundle:nil];
    [self.collectionView registerNib:cellNIb forCellWithReuseIdentifier:@"Cell" ];
    
    [self generateRandomUniqueNumber:3];

}

-(void)generateRandomUniqueNumber:(int )number
{
 
    array=[[NSMutableArray alloc] init];
    int randNum = arc4random() % (500);
    int counter=0;
    int boxes=number*number;
    
    while (counter<boxes)
    {
        if (![array containsObject:[NSNumber numberWithInt:randNum]])
        {
            [array addObject:[NSNumber numberWithInt:randNum]];
            counter++;
        } else{
            randNum = arc4random() % (boxes);
                 }
    }
    NSLog(@" ARRAY %@",array);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [array count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    //NSInteger value= [[unqArray objectAtIndex:indexPath.row ]integerValue];
    NSInteger value= [[array objectAtIndex:indexPath.row]integerValue];
    
    if (evenbutton)
    {
        
        if (value %2==0) {
            cell.numberLBL.text = [NSString stringWithFormat:@"%@",[array objectAtIndex:indexPath.row]];
        } else {
                cell.numberLBL.text = @"";
        }
        
    }
   else if (oddbutton)
    {
        if (!(value%2 == 0 ))
        {
            cell.numberLBL.text = [NSString stringWithFormat:@"%@",[array objectAtIndex:indexPath.row]];
        } else {
            cell.numberLBL.text = @"";
        }
    }
    else if (primebutton)
    {
        int a;
        BOOL isprime = YES;
        for (a = 2; a < value; a++)
        {
            if (value%a==0)
            {
                isprime = false;
            }
            if (isprime == YES) {
                cell.numberLBL.text = [NSString stringWithFormat:@"%@",[array objectAtIndex:indexPath.row]];
                
            } else {
                cell.numberLBL.text = @"";
            }
        }
    }
    else
    {
        cell.numberLBL.text=[NSString stringWithFormat:@"%@",[array objectAtIndex:indexPath.row ]];
      
    }
    return cell;
}

-(void )sortarray
{
    NSSortDescriptor* sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    array = [array sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
}


- (IBAction)ResetBtn:(id)sender {
    
      [self generateRandomUniqueNumber:3];
      [self.collectionView reloadData];}

- (IBAction)SubmitBtn:(id)sender {
    
    NSString *value=self.TextField.text;
    
    NSUserDefaults *userdefaults=[NSUserDefaults standardUserDefaults];
    [userdefaults setObject:value forKey:@"userno"];
    [userdefaults synchronize];
    [self generateRandomUniqueNumber:[value intValue]];
    [self.collectionView reloadData];

}

- (IBAction)EvenBtn:(id)sender {
    
    evenbutton = YES;
  //  [self sortarray];
    [self.collectionView reloadData];

}

- (IBAction)OddBtn:(id)sender {
    oddbutton = YES;
   // [self sortarray];
    [self.collectionView reloadData];

}

- (IBAction)PrimeBtn:(id)sender {
    
    primebutton = YES;
    //[self sortarray];
    [self.collectionView reloadData];

}

- (IBAction)SortBtn:(id)sender {
    [self sortarray];
    [self.collectionView reloadData];

    
}

@end
