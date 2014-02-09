//
//  MyScene.m
//  SKSpriteNodeConTextures
//
//  Created by Sergio on 09/02/14.
//  Copyright (c) 2014 Sergio. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene
@synthesize sprite;

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        myLabel.text = @"Hello, Sonic!";
        myLabel.fontSize = 30;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame)*0.5);
        
        [self addChild:myLabel];
        
        SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"Vegeta"];
        NSMutableArray *sonic = [NSMutableArray arrayWithCapacity:9];
        for(int i = 1;i<=9;i++)
        {
            NSString *fileName = [NSString stringWithFormat:@"vegeta%d.png", i];
            SKTexture *texture = [atlas textureNamed:fileName];
            NSLog(@"%f origen x %f origen y %f width %f heigth",
                  texture.textureRect.origin.x,
                  texture.textureRect.origin.y,
                  texture.textureRect.size.width,
                  texture.textureRect.size.height);
            [sonic addObject:texture];
        }
        
        sprite = [SKSpriteNode spriteNodeWithImageNamed:@"vegeta1.png"];
        SKAction *animacion = [SKAction repeatActionForever:[SKAction animateWithTextures:sonic timePerFrame:0.1]];
        sprite.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame));
        sprite.xScale =1.5;
        sprite.yScale = 1.5;
        
        SKLabelNode * button = [[SKLabelNode alloc] init];
        [button setText:@"Sergio"];
        [button setPosition:CGPointMake(150, 350)];
        button.color = [UIColor redColor];
        button.colorBlendFactor = 1;
        button.name = @"botonSergio";
        
        
        
        [sprite runAction:animacion];
        
        
        [self addChild:button];
        [self addChild:sprite];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    for(UITouch * touch in touches){
        CGPoint location = [touch locationInNode:self];
        SKNode * touchOverNode = [self nodeAtPoint:location];
        if([touchOverNode.name isEqualToString:@"botonSergio"]){
            sprite.colorBlendFactor = 0.0;
            
            
        }
        
        
    }
    
}

-(void)didMoveToView:(SKView *)view{//Execute this method when view is loaded∫
    UIButton * boton = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 70, 70)];
    [boton setTitle:@"boton2" forState:UIControlStateNormal];
    [boton addTarget:self action:@selector(changeBlendColor:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:boton];
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

-(void)changeBlendColor:(id)sender{
    //
    sprite.color = [UIColor redColor];
    sprite.colorBlendFactor = 1.0;
    
    
    
}

@end
