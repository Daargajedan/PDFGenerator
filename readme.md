# PDF Generator

Titanium module to handle PDF generation on iOS using Quartz 2D for fast rendering and good quality.

# Installing

1. Download this project and open the .zip file in /build folder, then copy it's content to your project in the correct folder structure. The path will look like the following: `modules/iphone/br.com.grupow2abrasil.pdfgenerator/1.0.0`
2. Open Studio, and the `tiapp.xml` file for the project in question.
3. Switch to the `tiapp.xml` tab.
4. In the application's `tiapp.xml`, find the `<modules/>` node, and replace it with the new `<modules>` content. If you already have modules, just add a new node for the PDF Generator module. Note that the "version" and "platform" attributes are optional. When "version" is not specified, the latest version of the module will be used (as of Titanium SDK 2.0.0).
```xml
<modules>
	<module version="1.0.0" platform="iphone">br.com.grupow2abrasil.pdfgenerator</module>
</modules>
```
5. Use the require function to load the module in the app's code, for example:
```javascript
var PdfGenerator = require('br.com.grupow2abrasil.pdfgenerator');
```
6. The next time the app is launched or built, PDF Generator should be included with the application.

## Prerequisites

* Mac OS X
* Axway Appcelerator Titanium
* XCode

# API

First of all, load the module.

```javascript
var pdfGenerator = require('br.com.grupow2abrasil.pdfgenerator');
```

Then set the properties of your PDF and start drawing. To save call the savePDF function.

### Methods

All parameters with `*` are required.

```javascript
pdfGenerator.setProperties({
	pdfName: "pdfOutputName",
    title: "The title of the PDF",
    author: "The author of the PDF",
    subject: "A subject if you want",
    keywords: "Keyworkds of the PDF",
    creator: "PDF Creator"
});
```
Sets the properties of the PDF, *must* be called before everything if you want the properties to be setted.

```javascript
pdfGenerator.setTextColor(number*, number*, number*, number);
```
Sets the text color in RGBA notation where the first 3 parameters are Red, Green and Blue respectively and the last one is the Alpha.

```javascript
pdfGenerator.setDrawColor(number*, number*, number*, number);
```
Sets the draw color in RGBA notation where the first 3 parameters are Red, Green and Blue respectively and the last one is the Alpha.

```javascript
pdfGenerator.setFillColor(number*, number*, number*, number);
```
Sets the fill color in RGBA notation where the first 3 parameters are Red, Green and Blue respectively and the last one is the Alpha. This property applies only for shapes.

```javascript
pdfGenerator.setLineWidth(number*);
```
Changes de line with of drawLine and the borders of drawRect

```javascript
pdfGenerator.setFontName(string*);
```
Sets a font. For some reason, it's not working properly, I'll fix it later.

```javascript
pdfGenerator.setTextSize(number*);
```
Sets the text size of drawText

```javascript
pdfGenerator.setPdfName(string*);
```
Sets the file name of the generated PDF

```javascript
pdfGenerator.addNewPage();
```
Adds a new page to the PDF.

```javascript
pdfGenerator.drawText(string*, number*, number*, number*, number*);
```
Writes text to the PDF. The first parameter is the string to be write and the last 4 are coordinates in this order: x, y, width, height.

```javascript
pdfGenerator.drawLine(number*, number*, number*, number*);
```
Draws a line from one point to other. The first 2 parameters indicates start point and the last 2 the end point: start.x, start.y, end.x, end.y

```javascript
pdfGenerator.drawRect(number*, number*, number*, number*);
```
Draws a rectangle. The parameters are coordinates in this order: x, y, width, height.

```javascript
pdfGenerator.drawImage(string*, number*, number*, number*, number*);
```
Draws an image. The first parameter is the complete path location of the file and the last 4 are coordinates in this order: x, y, width, height.

```javascript
pdfGenerator.savePDF(string);
```
Saves the PDF file, calling event `pdfReady` when the file is ready. Accepts a string as parameter which sets the pdf name if it wasn't set with setProperties.

```javascript
pdfGenerator.getPdfName();
```
Returns string with the filename.

```javascript
pdfGenerator.getFontName();
```
Returns current font name.

```javascript
pdfGenerator.getPageCount();
```
Returns number of pages.

```javascript
pdfGenerator.getLineWidth();
```
Returns line width.

```javascript
pdfGenerator.getTextSize();
```
Returns current size of text.

```javascript
pdfGenerator.getPageWidth();
```
Returns page width that is 619.

```javascript
pdfGenerator.getPageHeight();
```
Returns page height that is 719.

```javascript
pdfGenerator.getPageNumbers();
```
The same as getPageCount() but returns 0 instead of null when there is no page at all.

### Events

```javascript
pdfGenerator.addEventListener("pdfReady", function(e){
	Ti.API.info("PDF Path -> " + e.url);
});
```
Event called when PDF is complete.

## Example

The follwing example illustrates the usage of PDF Generator.

```javascript
	var docViewer = Ti.UI.iOS.createDocumentViewer();
	var pdfGenerator = require("br.com.grupow2abrasil.pdfgenerator");
	
	pdfGenerator.addEventListener("pdfReady", function(e){
		Ti.API.info("url: " + e.url);
		docViewer.setUrl(e.url);
		docViewer.show();
	});
	
	// The PDF name doesn't need extension .pdf, only the name
	pdfGenerator.setProperties({
		pdfName: "pdfOutputName",
	    title: "The title of the PDF",
	    author: "The author of the PDF",
	    subject: "A subject if you want",
	    keywords: "Keyworkds of the PDF",
	    creator: "PDF Creator"
	});
	
	pdfGenerator.addNewPage();
	
	pdfGenerator.drawText("The fox jumps over the lazy fox.", 100, 40, 200, 40);
	pdfGenerator.drawLine(10, 10, 60, 60);
	
	pdfGenerator.drawRect(5, 520, 100, 20);
	
	// the image file must be in documents directory
	var file = Ti.Filesystem.getFile(Titanium.Filesystem.getApplicationDataDirectory(), "yourFileName.jpg");
	
	pdfGenerator.drawImage(file.nativePath, 500, 80, 16, 16);
	
	pdfGenerator.setTextSize(12);
	pdfGenerator.drawText("I'm a text with different font size", 10, 220, 300, 40);
	pdfGenerator.setTextColor(158, 67, 89);
	pdfGenerator.drawText("I'm a text with different color", 10, 120, 300, 40);
	
	pdfGenerator.setLineWidth(5.0);
	pdfGenerator.drawRect(50, 80, 25, 60);
	
	pdfGenerator.savePDF();
```

# Built With

* [Axway Appcelerator Titanium](https://www.appcelerator.com/) - Mobile Development Platform
* [XCode](https://developer.apple.com/xcode/) - iOS IDE
* [Quartz 2D](https://developer.apple.com/library/content/documentation/GraphicsImaging/Conceptual/drawingwithquartz2d/Introduction/Introduction.html) - iOS 2D Native Rendering Framework

Happy Coding!

# License

PDF Generator is licensed under MIT.

```
Copyright (c) 2018 Grupo W2ABrasil

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
```