//
//  ViewController.m
//  Test_ButtonGrid
//
//  Created by Eduardo Flores on 4/7/15.
//  Copyright (c) 2015 Eduardo Flores. All rights reserved.
//

#import "ViewController.h"
#import "Tile.h"

#define kButtonColumns 26
#define kButtonRows 36

@interface ViewController ()
{
    UIButton *buttons[kButtonColumns][kButtonRows];
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    arrayOfTiles = [[NSMutableArray alloc]init];
    [self placeTiles];
    
    // pan gesture related
    self.panGestureRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)];
    [self.view addGestureRecognizer:self.panGestureRecognizer];
    
    // pinch gesture related
    self.pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinches:)];
    [self.view addGestureRecognizer:self.pinchGestureRecognizer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) handlePinches:(UIPinchGestureRecognizer *)paramSender
{
    if (paramSender.state == UIGestureRecognizerStateEnded)
    {
        self.currentScale = paramSender.scale;
    }
    else if (paramSender.state == UIGestureRecognizerStateBegan && self.currentScale != 0.0f)
    {
        paramSender.scale = self.currentScale;
    }
    if (paramSender.scale != NAN && paramSender.scale != 0.0)
    {
        paramSender.view.transform = CGAffineTransformMakeScale(paramSender.scale, paramSender.scale);
    }
}

// for Pan Gesture
- (void) handlePan:(UIPanGestureRecognizer *)paramSender
{
    if (paramSender.state != UIGestureRecognizerStateEnded &&
        paramSender.state != UIGestureRecognizerStateFailed)
    {
        CGPoint location = [paramSender locationInView:paramSender.view.superview];
        paramSender.view.center = location;
    }
}

- (void)placeTiles
{
    NSInteger intTagNumber  = 0;
    NSInteger intXTile;
    NSInteger intYTile;
    
    float tileWidth = self.view.bounds.size.width / kButtonColumns;
    float tileHeight = self.view.bounds.size.height / (kButtonRows + 1);

    char char_x = 'A';

    for (char x = 'A'; x < kButtonColumns; x++)
    {
        for (int y = 1; y <= (kButtonRows + 1); y++)
        {
            intXTile  = x * tileWidth;
            intYTile = y * tileHeight;
            
            // create a value button, text, or image
            buttons[x][y] = [[UIButton alloc] initWithFrame:CGRectMake(intXTile, intYTile, tileWidth, tileHeight)];
            [buttons[x][y] setBackgroundImage:[UIImage imageNamed:@"square_black"] forState:UIControlStateNormal];
            [buttons[x][y] addTarget:self action:@selector(actionPick:) forControlEvents:UIControlEventTouchDown];
            [buttons[x][y] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            buttons[x][y].adjustsImageWhenHighlighted = NO;
            buttons[x][y].adjustsImageWhenDisabled = NO;
            buttons[x][y].tag = intTagNumber;
            [self.view addSubview:buttons[x][y]];
            //[buttons[x][y] sizeToFit];

            Tile *tile = [[Tile alloc]init];
            tile.coordinate_x = [NSString stringWithFormat:@"%c", char_x];
            tile.coordinate_y = [NSNumber numberWithInt:y];
            tile.tile_tag = [NSNumber numberWithInt:intTagNumber];
            [arrayOfTiles addObject:tile];
            
            intTagNumber++;
            NSLog(@"(%d, %d)", x, y);
        }
        
        NSLog(@"char = %c", char_x);
        char_x ++;
    }
}

- (IBAction)actionPick:(id)sender
{
    UIButton *button = (UIButton *)sender;
    NSLog(@"Button tag: %i", button.tag);
    
    for (Tile *tile in arrayOfTiles)
    {
        if ([tile.tile_tag isEqualToNumber:[NSNumber numberWithInt:button.tag]])
        {
            NSLog(@"button coordinates = %@%@", tile.coordinate_x, tile.coordinate_y);
        }
    }
    
    [button setBackgroundImage:[UIImage imageNamed:@"square_red"] forState:UIControlStateNormal];
}
@end



















































