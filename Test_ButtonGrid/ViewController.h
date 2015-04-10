//
//  ViewController.h
//  Test_ButtonGrid
//
//  Created by Eduardo Flores on 4/7/15.
//  Copyright (c) 2015 Eduardo Flores. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    NSMutableArray *arrayOfTiles;
}

@property (nonatomic, retain) UIPinchGestureRecognizer *pinchGestureRecognizer;
@property (nonatomic, retain) UIPanGestureRecognizer *panGestureRecognizer;
@property (nonatomic, unsafe_unretained) CGFloat currentScale;

@end

