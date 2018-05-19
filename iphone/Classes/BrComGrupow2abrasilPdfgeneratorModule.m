/**
 * PDF Generator
 *
 * Created by Grupo W2ABrasil
 * Copyright (c) 2018 Grupo W2ABrasil. All rights reserved.
 */

#import "BrComGrupow2abrasilPdfgeneratorModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

@implementation BrComGrupow2abrasilPdfgeneratorModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"759fef8e-d557-4282-8ba8-628cba858ebc";
}

// this is generated for your module, please nonatomic, do not change it
-(NSString*)moduleId
{
	return @"br.com.grupow2abrasil.pdfgenerator";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
    
    // default values
    _lineWidth = [NSNumber numberWithDouble:0.1];
    _textSize = [NSNumber numberWithInt:14];
    _textColor = [UIColor darkGrayColor];
    _drawColor = [UIColor darkGrayColor];
    _fillColor = [UIColor clearColor];
    
	NSLog(@"[DEBUG] %@ Módulo PDFGenerator Loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	// you *must* call the superclass
    CGContextRelease(_context);
    
	[super shutdown:sender];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"pdfReady"])
	{
		// the first (of potentially many) listener is being added
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"pdfReady"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs

-(void)setTextColor:(id)args
{
    if([args count] == 3) {
        NSNumber* red = [args objectAtIndex:0];
        NSNumber* green = [args objectAtIndex:1];
        NSNumber* blue = [args objectAtIndex:2];
        
        _textColor = [UIColor colorWithRed:(red.intValue/255.0) green:(green.intValue/255.0) blue:(blue.intValue/255.0) alpha:1.0];
        
    }
    else if([args count] == 4) {
        NSNumber* red = [args objectAtIndex:0];
        NSNumber* green = [args objectAtIndex:1];
        NSNumber* blue = [args objectAtIndex:2];
        NSNumber* alpha = [args objectAtIndex:3];
        
        _textColor = [UIColor colorWithRed:(red.intValue/255.0) green:(green.intValue/255.0) blue:(blue.intValue/255.0) alpha:alpha.doubleValue];
        
    }
    else {
        NSLog(@"[ERROR] Quantidade incorreta de argumentos para o método setTextColor.");
    }
}
-(void)setDrawColor:(id)args
{
    if([args count] == 3) {
        NSNumber* red = [args objectAtIndex:0];
        NSNumber* green = [args objectAtIndex:1];
        NSNumber* blue = [args objectAtIndex:2];
        
        _drawColor = [UIColor colorWithRed:(red.intValue/255.0) green:(green.intValue/255.0) blue:(blue.intValue/255.0) alpha:1.0];
        
    }
    else if([args count] == 4) {
        NSNumber* red = [args objectAtIndex:0];
        NSNumber* green = [args objectAtIndex:1];
        NSNumber* blue = [args objectAtIndex:2];
        NSNumber* alpha = [args objectAtIndex:3];
        
        _drawColor = [UIColor colorWithRed:(red.intValue/255.0) green:(green.intValue/255.0) blue:(blue.intValue/255.0) alpha:alpha.doubleValue];
        
    }
    else {
        NSLog(@"[ERROR] Quantidade incorreta de argumentos para o método setDrawColor.");
    }
}
-(void)setFillColor:(id)args
{
    if([args count] == 3) {
        NSNumber* red = [args objectAtIndex:0];
        NSNumber* green = [args objectAtIndex:1];
        NSNumber* blue = [args objectAtIndex:2];
        
        _fillColor = [UIColor colorWithRed:(red.intValue/255.0) green:(green.intValue/255.0) blue:(blue.intValue/255.0) alpha:1.0];
    }
    else if([args count] == 4) {
        NSNumber* red = [args objectAtIndex:0];
        NSNumber* green = [args objectAtIndex:1];
        NSNumber* blue = [args objectAtIndex:2];
        NSNumber* alpha = [args objectAtIndex:3];
        
        _fillColor = [UIColor colorWithRed:(red.intValue/255.0) green:(green.intValue/255.0) blue:(blue.intValue/255.0) alpha:alpha.doubleValue];
        
    }
    else {
        NSLog(@"[ERROR] Quantidade incorreta de argumentos para o método setFillColor.");
    }
}

-(void)addNewPage:(id)args
{
    if(_context != NULL) {
        
        // Mark the beginning of a new page.
        UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, 612, 792), nil);
        
        _pageCount = [NSNumber numberWithInt:[_pageCount intValue] + 1];
        
    } else {
        if( _pdfName == nil || [_pdfName isEqualToString:@""] ) {
            _pdfName = @"output";
        }
        
        _pdfName = [_pdfName stringByAppendingString:@".pdf"];
        
        NSArray *arrayPaths =
        NSSearchPathForDirectoriesInDomains(
                                            NSDocumentDirectory,
                                            NSUserDomainMask,
                                            YES);
        NSString *path = [arrayPaths objectAtIndex:0];
        NSString* pdfFileName = [path stringByAppendingPathComponent:_pdfName];
        
        // Create the PDF context using the default page size of 612 x 792.
        UIGraphicsBeginPDFContextToFile(pdfFileName, CGRectZero, _props);
        
        // Mark the beginning of a new page.
        UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, 612, 792), nil);
        
        _pageCount = [NSNumber numberWithInt:[_pageCount intValue] + 1];
        
        _context = UIGraphicsGetCurrentContext();
    }
}

-(void)drawText:(id)args
{
    if([args count] == 5) {
        NSString* textToDraw = [args objectAtIndex:0];
        ENSURE_STRING_OR_NIL(textToDraw);
        
        NSNumber* xArg = [args objectAtIndex:1];
        NSNumber* yArg = [args objectAtIndex:2];
        NSNumber* widthArg = [args objectAtIndex:3];
        NSNumber* heightArg = [args objectAtIndex:4];
        
        // add new page if needed
        if(_context == NULL) {
            [self addNewPage:NULL];
        }
        
        //CFStringRef stringRef = (__bridge CFStringRef)textToDraw;
        
        // Prepare the text using a Core Text Framesetter
        CTFontRef fontRef = CTFontCreateWithName((CFStringRef)_fontName, [_textSize intValue], NULL);
        NSDictionary *attDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                       (__bridge_transfer id)fontRef, (NSString *)kCTFontAttributeName,
                                       (id)[_textColor CGColor], (NSString *)kCTForegroundColorAttributeName,
                                       nil];
        
        NSAttributedString *attString = [[NSAttributedString alloc] initWithString:textToDraw attributes:attDictionary];
        
        CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((__bridge_retained CFAttributedStringRef)attString);
        
        CGRect frameRect = CGRectMake(xArg.intValue, yArg.intValue, widthArg.intValue, heightArg.intValue);
        CGMutablePathRef framePath = CGPathCreateMutable();
        CGPathAddRect(framePath, NULL, frameRect);
        
        // Get the frame that will do the rendering.
        CFRange currentRange = CFRangeMake(0, 0);
        CTFrameRef frameRef = CTFramesetterCreateFrame(framesetter, currentRange, framePath, NULL);
        CGPathRelease(framePath);
        
        // Put the text matrix into a known state. This ensures
        // that no old scaling factors are left in place.
        CGContextSetTextMatrix(_context, CGAffineTransformIdentity);
        
        // Core Text draws from the bottom-left corner up, so flip
        // the current transform prior to drawing.
        CGContextTranslateCTM(_context, 0, frameRect.origin.y*2);
        CGContextScaleCTM(_context, 1.0, -1.0);
        
        // Draw the frame.
        CTFrameDraw(frameRef, _context);
        
        // Return context to it's default matrix transform
        CGContextScaleCTM(_context, 1.0, -1.0);
        CGContextTranslateCTM(_context, 0, (-1)*frameRect.origin.y*2);
        
        CFRelease(frameRef);
        CFRelease(framesetter);
        
    } else {
        NSLog(@"[ERROR] Quantidade incorreta de argumentos para o método drawText.");
    }
}

-(void)drawLine:(id)args
{
    if([args count] == 4) {
        NSNumber* xStart = [args objectAtIndex:0];
        NSNumber* yStart = [args objectAtIndex:1];
        NSNumber* xEnd = [args objectAtIndex:2];
        NSNumber* yEnd = [args objectAtIndex:3];
        
        // add new page if needed
        if(_context == NULL) {
            [self addNewPage:NULL];
        }
        
        CGPoint from = CGPointMake(xStart.intValue, yStart.intValue);
        CGPoint to = CGPointMake(xEnd.intValue, yEnd.intValue);
        
        CGContextSetLineWidth(_context, _lineWidth.doubleValue);
        
        CGContextSetStrokeColorWithColor(_context, [_drawColor CGColor]);
        
        CGContextMoveToPoint(_context, from.x, from.y);
        CGContextAddLineToPoint(_context, to.x, to.y);
        
        CGContextStrokePath(_context);
        
    } else {
        NSLog(@"[ERROR] Quantidade incorreta de argumentos para o método drawLine.");
    }
}

-(void)drawRect:(id)args
{
    if([args count] == 4) {
        NSNumber* xArg = [args objectAtIndex:0];
        NSNumber* yArg = [args objectAtIndex:1];
        NSNumber* widthArg = [args objectAtIndex:2];
        NSNumber* heightArg = [args objectAtIndex:3];
        
        // add new page if needed
        if(_context == NULL) {
            [self addNewPage:NULL];
        }
        CGRect rectangle = CGRectMake(xArg.intValue, yArg.intValue, widthArg.intValue, heightArg.intValue);
        
        CGContextSetLineWidth(_context, _lineWidth.doubleValue);
        CGContextSetStrokeColorWithColor(_context, [_drawColor CGColor]);
        CGContextAddRect(_context, rectangle);
        CGContextStrokePath(_context);
        
        CGContextSetFillColorWithColor(_context, [_fillColor CGColor]);
        CGContextFillRect(_context, rectangle);
        
    } else {
        NSLog(@"[ERROR] Quantidade incorreta de argumentos para o método drawRect.");
    }
}

-(void)drawImage:(id)args
{
    if([args count] == 5) {
        NSString* caminhoImg = [args objectAtIndex:0];
        ENSURE_STRING_OR_NIL(caminhoImg);
        
        NSNumber* xArg = [args objectAtIndex:1];
        NSNumber* yArg = [args objectAtIndex:2];
        NSNumber* widthArg = [args objectAtIndex:3];
        NSNumber* heightArg = [args objectAtIndex:4];
        
        // add new page if needed
        if(_context == NULL) {
            [self addNewPage:NULL];
        }
        
        if(caminhoImg != nil) {
            // remove "file://" from path if exists, Titanium add it by default on Ti.Filesystem.File property nativePath
            caminhoImg = [caminhoImg stringByReplacingOccurrencesOfString:@"file://" withString:@""];
        }
        
        UIImage *image = [UIImage imageWithContentsOfFile:caminhoImg];
        CGRect rect = CGRectMake(xArg.intValue, yArg.intValue, widthArg.intValue, heightArg.intValue);
        
        [image drawInRect:rect];
        
    } else {
        NSLog(@"[ERROR] Quantidade incorreta de argumentos para o método drawImage.");
    }
}

-(void)setProperties:(id)args
{
    ENSURE_SINGLE_ARG(args, NSDictionary);
    
    NSString *pdfName;
    NSString *title;
    NSString *author;
    NSString *subject;
    NSString *keywords;
    NSString *creator;
    
    ENSURE_ARG_FOR_KEY(pdfName, args, @"pdfName", NSString);
    ENSURE_ARG_FOR_KEY(title, args, @"title", NSString);
    ENSURE_ARG_FOR_KEY(author, args, @"author", NSString);
    ENSURE_ARG_FOR_KEY(subject, args, @"subject", NSString);
    ENSURE_ARG_FOR_KEY(keywords, args, @"keywords", NSString);
    ENSURE_ARG_FOR_KEY(creator, args, @"creator", NSString);
    
    _props = @{
      (NSString *)kCGPDFContextAuthor:author,
      (NSString *)kCGPDFContextTitle:title,
      (NSString *)kCGPDFContextSubject:subject,
      (NSString *)kCGPDFContextKeywords:keywords,
      (NSString *)kCGPDFContextCreator:creator};
    
    _pdfName = pdfName;
}

-(NSNumber *)getPageWidth:(id)args
{
    return [NSNumber numberWithInt:612];
}
-(NSNumber *)getPageHeight:(id)args
{
    return [NSNumber numberWithInt:792];
}

-(NSNumber *)getPageNumbers:(id)args
{
    return _context == NULL ? [NSNumber numberWithInt:0] : _pageCount;
}

-(void)savePDF:(id)args
{
    NSString *pdfName = NULL;
    NSString *pdfFileName;
    
    if([args count] > 0) {
        ENSURE_SINGLE_ARG(args, NSDictionary);
        
        pdfName = [args objectForKey:@"pdfName"];
        ENSURE_STRING_OR_NIL(pdfName);
        
        if(pdfName != nil) {
            pdfName = [pdfName stringByAppendingString:@".pdf"];
        }
    }
    
    // Create the PDF context using the default page size of 612 x 792.
    if(_context == NULL) {
        
        if( pdfName != NULL && (_pdfName == NULL || [_pdfName isEqualToString:@""]) ) {
            _pdfName = pdfName;
        }
        else if( _pdfName == NULL || [_pdfName isEqualToString:@""] ) {
            _pdfName = @"output";
        }
        
        _pdfName = [_pdfName stringByAppendingString:@".pdf"];
        
        [self addNewPage:NULL];
    }
    
    // Close the PDF context and write the contents out.
    UIGraphicsEndPDFContext();
    
    // if pdf name is null or is set a new pdf name
    if( pdfName != NULL && ![_pdfName isEqualToString:pdfName] ) {
        // rename pdf file
        NSArray *arrayPaths =
        NSSearchPathForDirectoriesInDomains(
                                            NSDocumentDirectory,
                                            NSUserDomainMask,
                                            YES);
        
        NSString *path = [arrayPaths objectAtIndex:0];
        
        NSString *oldPath = [path stringByAppendingPathComponent:_pdfName];
        NSString *newPath = [path stringByAppendingPathComponent:pdfName];
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSError *error = nil;
        
        if([fileManager fileExistsAtPath:newPath]) {
            [fileManager removeItemAtPath:newPath error: &error];
        }
        if([fileManager moveItemAtPath:oldPath toPath:newPath error: &error]) {
            pdfFileName = newPath;
        }
    }
    
    // fire event to JS
    if([self _hasListeners:@"pdfReady"]) {
        [self fireEvent:@"pdfReady" withObject:@{@"url":pdfFileName}];
    }
}

@end
