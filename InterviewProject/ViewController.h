//
//  ViewController.h
//  InterviewProject
//
//  Created by ankur on 21/07/16.
//  Copyright © 2016 ankur. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionViewCell.h"
#import "customlayout.h"
@interface ViewController : UIViewController <UICollectionViewDelegate , UICollectionViewDataSource>

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) IBOutlet UITextField *TextField;
@property (strong, nonatomic) IBOutlet UIButton *Submit;
@property (strong, nonatomic) IBOutlet UIButton *Even;
@property (strong, nonatomic) IBOutlet UIButton *Odd;
@property (strong, nonatomic) IBOutlet UIButton *Prime;
@property (strong, nonatomic) IBOutlet UIButton *Sort;


- (IBAction)ResetBtn:(id)sender;

- (IBAction)SubmitBtn:(id)sender;
- (IBAction)EvenBtn:(id)sender;
- (IBAction)OddBtn:(id)sender;
- (IBAction)PrimeBtn:(id)sender;
- (IBAction)SortBtn:(id)sender;

@end

