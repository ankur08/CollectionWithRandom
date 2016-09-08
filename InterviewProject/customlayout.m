

#import "customlayout.h"

@implementation customlayout

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.minimumLineSpacing = 1.0;
        self.minimumInteritemSpacing = 1.0;
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    return self;
}

- (CGSize)itemSize
{
    
    NSUserDefaults *userdefaults=[NSUserDefaults standardUserDefaults];
    NSString *colno=[userdefaults objectForKey:@"userno"];
    if (colno==nil) {
        colno=@"3";
    }
    NSInteger numberOfColumns = [colno intValue];
    
CGFloat itemWidth = (CGRectGetWidth(self.collectionView.frame) - (numberOfColumns)) / numberOfColumns;
    return CGSizeMake(itemWidth, itemWidth);
}

@end
