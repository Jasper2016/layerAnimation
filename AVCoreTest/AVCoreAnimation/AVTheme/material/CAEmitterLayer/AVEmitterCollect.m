//
//  AVEmitterCollect.m
//  TestVideoPreViewing
//
//  Created by mac on 15/4/10.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVEmitterCollect.h"

@implementation AVEmitterCollect

-(CAEmitterLayer *)petalEmitter:(CGRect)frame cellImagePathList:(NSArray *)cellImagePathList
{
    CAEmitterLayer *snowEmitter = [CAEmitterLayer layer];
    snowEmitter.emitterPosition = CGPointMake(CGRectGetMidX(frame), -5);
    snowEmitter.emitterSize		= CGSizeMake(CGRectGetWidth(frame)*2.5, 0);;
    
    // Spawn points for the flakes are within on the outline of the line
    snowEmitter.emitterMode		= kCAEmitterLayerOutline;
    snowEmitter.emitterShape	= kCAEmitterLayerLine;
    
    NSInteger imageCnt = [cellImagePathList count];
    
    NSMutableArray *cellList = [[NSMutableArray alloc] init];
    
    for (NSInteger index = 0; index < imageCnt; index++) {
        
        NSString *imageName = [cellImagePathList objectAtIndex:index];
     
        // Configure the snowflake emitter cell
        CAEmitterCell *emitterCell = [CAEmitterCell emitterCell];
        
        emitterCell.birthRate		= 10;
        emitterCell.lifetime		= 70.0;
        
        emitterCell.scale           = 0.4;
        
        emitterCell.spin            = 0.4;
        
        emitterCell.scaleRange        =0.3;
        
        emitterCell.velocity		= -10;				// falling down slowly
        emitterCell.velocityRange = 8;
        emitterCell.yAcceleration = 2;
        emitterCell.emissionRange = 0.5 * M_PI;		// some variation in angle
        emitterCell.spinRange		=  M_PI;		// slow spin
        
        emitterCell.contents		= (id) [[UIImage imageNamed:imageName] CGImage];
        emitterCell.color			= [[UIColor colorWithRed:0.600 green:0.658 blue:0.743 alpha:1.000] CGColor];
        
        [cellList addObject: emitterCell];
        
    }
    
    // Make the flakes seem inset in the background
    snowEmitter.shadowOpacity = 1.0;
    snowEmitter.shadowRadius  = 0.0;
    snowEmitter.shadowOffset  = CGSizeMake(0.0, 1.0);
    snowEmitter.shadowColor   = [[UIColor whiteColor] CGColor];
    
    // Add everything to our backing layer below the UIContol defined in the storyboard
    snowEmitter.emitterCells = cellList;
    
    return snowEmitter;
    
}

-(CAEmitterLayer *)petalEmitter:(CGRect)frame cellContents:(NSString *)contents
{
    CAEmitterLayer *snowEmitter = [CAEmitterLayer layer];
    snowEmitter.emitterPosition = CGPointMake(CGRectGetMidX(frame), -30);
    snowEmitter.emitterSize		= CGSizeMake(CGRectGetWidth(frame)*2, 0);;
    
    // Spawn points for the flakes are within on the outline of the line
    snowEmitter.emitterMode		= kCAEmitterLayerOutline;
    snowEmitter.emitterShape	= kCAEmitterLayerLine;
    
    // Configure the snowflake emitter cell
    CAEmitterCell *snowflake = [CAEmitterCell emitterCell];
    
    snowflake.birthRate		= 10.0;
    snowflake.lifetime		= 120.0;
    
    snowflake.velocity		= -10;				// falling down slowly
    snowflake.velocityRange = 10;
    snowflake.yAcceleration = 2;
    snowflake.emissionRange = 0.5 * M_PI;		// some variation in angle
    snowflake.spinRange		= 0.25 * M_PI;		// slow spin
    
    snowflake.contents		= (id) [[UIImage imageNamed:contents] CGImage];
    snowflake.color			= [[UIColor colorWithRed:0.600 green:0.658 blue:0.743 alpha:1.000] CGColor];
    
    // Make the flakes seem inset in the background
    snowEmitter.shadowOpacity = 1.0;
    snowEmitter.shadowRadius  = 0.0;
    snowEmitter.shadowOffset  = CGSizeMake(0.0, 1.0);
    snowEmitter.shadowColor   = [[UIColor whiteColor] CGColor];
    
    // Add everything to our backing layer below the UIContol defined in the storyboard
    snowEmitter.emitterCells = [NSArray arrayWithObject:snowflake];
    
    return snowEmitter;

}

@end
