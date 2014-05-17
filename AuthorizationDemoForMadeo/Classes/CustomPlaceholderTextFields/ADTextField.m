//
//  ADTextField.m
//
//  Created by Rostyslav Stepanyak on 5/17/14.
//  Copyright (c) 2013 Treeline Interactive. All rights reserved.
//

#import "ADTextField.h"

#define VERTICAL_OFFSET  2
#define BASE_COLOR    [UIColor colorWithRed: 215./255. green: 223./255. blue: 227./255. alpha: 1.0]

@implementation ADTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initialSetup];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        [self initialSetup];
    }
    
    return self;
}

-(void)initialSetup
{
    self.textColor = BASE_COLOR;
}

/*arranging custom plceholder text appearance as we cant modify it from Interface Builder*/
- (void)drawPlaceholderInRect:(CGRect)rect
{
    //lets display the placeholder with the same font as the actual text of  the textfield
	float palceholderFontSize = self.font.pointSize;
    UIFont *palceholderFont = self.font;
    
    
    // placeholder appearc a slightly lower than the real text appearing after input (cause of the 2px border of the bg image view)
    // to avoid dummy jumping effect lets adjust it a bit (move it 2 pixels)
    int height = rect.size.height;
    int y = (height - palceholderFontSize) / 2;
    y -= VERTICAL_OFFSET;

  
    //get the frame of the place holder text text
	CGRect placeholderRect = CGRectMake(rect.origin.x, y, rect.size.width, palceholderFontSize);
    
    
    //a bunch of attributes for placeholder text appearance
    NSDictionary *attributes = @{NSForegroundColorAttributeName: [UIColor darkGrayColor],
                                 NSFontAttributeName: palceholderFont};
	[[self placeholder] drawInRect: placeholderRect withAttributes:attributes];
}

@end
