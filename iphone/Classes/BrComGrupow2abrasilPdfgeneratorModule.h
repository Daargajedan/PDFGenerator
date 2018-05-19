/**
 * PDF Generator
 *
 * Created by Grupo W2ABrasil
 * Copyright (c) 2018 Grupo W2ABrasil. All rights reserved.
 */

#import "TiModule.h"
#import <CoreText/CoreText.h>

@interface BrComGrupow2abrasilPdfgeneratorModule : TiModule
{
    CGContextRef _context;
    NSDictionary* _props;
    UIColor* _textColor;
    UIColor* _drawColor;
    UIColor* _fillColor;
}

@property(copy) NSString* pdfName;
@property(copy) NSString* fontName;
@property(copy) NSNumber* pageCount;
@property(copy) NSNumber* lineWidth;
@property(copy) NSNumber* textSize;

-(void)setTextColor:(id)args;
-(void)setDrawColor:(id)args;
-(void)setFillColor:(id)args;
-(void)addNewPage:(id)args;
-(void)drawText:(id)args;
-(void)drawLine:(id)args;
-(void)drawRect:(id)args;
-(void)drawImage:(id)args;
-(void)setProperties:(id)args;
-(NSNumber *)getPageWidth:(id)args;
-(NSNumber *)getPageHeight:(id)args;
-(NSNumber *)getPageNumbers:(id)args;
-(void)savePDF:(id)args;

@end
