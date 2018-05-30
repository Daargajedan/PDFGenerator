# PDF Generator Module

## Description

Titanium module to handle PDF generation/edition on iOS using Quartz 2D for fast rendering and good quality.

## Accessing the PDF Generator Module

To access this module from JavaScript, you would do the following:

```javascript
var pdfGenerator = require('br.com.grupow2abrasil.pdfgenerator');
```

The pdfGenerator variable is a reference to the Module object.

## Reference

* [Quartz 2d](https://developer.apple.com/library/content/documentation/GraphicsImaging/Conceptual/drawingwithquartz2d/Introduction/Introduction.html) - iOS 2d Rendering Framework

# API

First of all, load the module.

```javascript
var pdfGenerator = require('br.com.grupow2abrasil.pdfgenerator');
```

Then set the properties of your PDF and start drawing. To save call the savePDF function.

## Methods

All parameters with `*` are required.

###setProperties(obj`*`)
```javascript
pdfGenerator.setProperties({
	pdfName: "output",
    title: "",
    author: "",
    subject: "",
    keywords: "",
    creator: ""
});
```
Sets the properties of the PDF, *must* be called before everything if you want the properties to be setted properly.
| Name | Type | Description |
| --- |:---:| --- |
| obj | `Object` | property_name-to-property_value object structure |

###getProperties
```
var props = pdfGenerator.getProperties();
```
Returns `Object` - PDF properties.

###addNewPage()
```javascript
pdfGenerator.addNewPage();
```
Adds a new page to the PDF.

###deletePage(page`*`)
```javascript
pdfGenerator.deletePage(3);
```
Deletes a page from the PDF.
| Name | Type | Description |
| --- |:---:| --- |
| page | `Number` | Index of the page to be deleted, starts with 1 and must be an Integer |

###forEachPage(fnc`*`)
```javascript
pdfGenerator.forEachPage(function(pageIndex, total){
	// Drawing functions here, you can draw the header and footer, example:
	pdfGenerator.drawText("Page " + pageIndex + " of " + total, 20, 700, 572, 30);

	// More drawing function as you wish
});
```
Executes a function for each page of the PDF where you can draw into.
| Name | Type | Description |
| --- |:---:| --- |
| fnc | `Function` | Function which will be executed for each page receiving the parameters index and total, both `Number`s |

###setTextColor(R`*`, G`*`, B`*`, A)
```javascript
pdfGenerator.setTextColor(27, 27, 27, 1.0);
```
Sets the text color in RGBA notation or RGB if A is omitted.
| Name | Type | Description |
| --- |:---:| --- |
| R | `Number` | Color channel value, must be a value in the range from 0 (solid black) to 255 (white) |
| G | `Number` | Color channel value, must be a value in the range from 0 (solid black) to 255 (white) |
| B | `Number`| Color channel value, must be a value in the range from 0 (solid black) to 255 (white) |
| A | `Number` | Alpha channel value, must be a value in the range from 0.0 (transparent) to 1.0 (solid color) |

###setDrawColor(R`*`, G`*`, B`*`, A)
```javascript
pdfGenerator.setDrawColor(27, 27, 27, 1.0);
```
Sets the draw color in RGBA notation or RGB if A is omitted.
| Name | Type | Description |
| --- |:---:| --- |
| R | `Number` | Color channel value, must be a value in the range from 0 (solid black) to 255 (white) |
| G | `Number` | Color channel value, must be a value in the range from 0 (solid black) to 255 (white) |
| B | `Number`| Color channel value, must be a value in the range from 0 (solid black) to 255 (white) |
| A | `Number` | Alpha channel value, must be a value in the range from 0.0 (transparent) to 1.0 (solid color) |

###setFillColor(R`*`, G`*`, B`*`, A)
```javascript
pdfGenerator.setFillColor(255, 255, 255, 0.0);
```
Sets the fill color in RGBA notation or RGB if A is omitted. This property applies only for shapes.
| Name | Type | Description |
| --- |:---:| --- |
| R | `Number` | Color channel value, must be a value in the range from 0 (solid black) to 255 (white) |
| G | `Number` | Color channel value, must be a value in the range from 0 (solid black) to 255 (white) |
| B | `Number`| Color channel value, must be a value in the range from 0 (solid black) to 255 (white) |
| A | `Number` | Alpha channel value, must be a value in the range from 0.0 (transparent) to 1.0 (solid color) |

###setLineWidth(width`*`)
```javascript
pdfGenerator.setLineWidth(0.1);
```
Sets line width for upcoming lines and shapes.
| Name | Type | Description |
| --- |:---:| --- |
| width | `Number` | Line width, must be a float/double |

###getLineWidth()
```javascript
pdfGenerator.getLineWidth();
```
Returns `Number` - Line width.

###setFontName(fontName`*`)
```javascript
pdfGenerator.setFontName("Helvetica");
```
Sets text font for upcoming text elements.
| Name | Type | Description |
| --- |:---:| --- |
| fontName | `String` | Font name or family. Style or variant must be included in the fontName, example: `Helvetica-Bold` |

###getFontName()
```javascript
pdfGenerator.getFontName();
```
Returns `String` - Current font name.

###setTextSize(size`*`)
```javascript
pdfGenerator.setTextSize(14);
```
Sets text size for upcoming text elements.
| Name | Type | Description |
| --- |:---:| --- |
| size | `Number` | Font name or family. Style or variant must be included in the fontName, example: `Helvetica-Bold` |

###getTextSize()
```javascript
pdfGenerator.getTextSize();
```
Returns `Number` - Current size of text.

###setTextAlign(alignment`*`)
```javascript
pdfGenerator.setTextAlign("center");
```
Sets text horizontal alignment for upcoming text elements.
| Name | Type | Description |
| --- |:---:| --- |
| alignment | `String` | Horizontal text alignment, available values are `left`, `center`, `right`, `justified` |

###getTextAlign()
```javascript
pdfGenerator.getTextAlign();
```
Returns `String` - Current text horizontal alignment.

###setTextVerticalAlign(alignment`*`)
```javascript
pdfGenerator.setTextVerticalAlign("middle");
```
Sets text vertical alignment for upcoming text elements.
| Name | Type | Description |
| --- |:---:| --- |
| alignment | `String` | Vertical text alignment, available values are `top`, `middle`, `bottom` |

###getTextVerticalAlign()
```javascript
pdfGenerator.getTextVerticalAlign();
```
Returns `String` - Current text vertical alignment.

###setPdfName(pdfName`*`)
```javascript
pdfGenerator.setPdfName("my_awesome_pdf");
```
Sets the file name of the generated PDF.
| Name | Type | Description |
| --- |:---:| --- |
| pdfName | `String` | The name of the PDF without file extension |

###getPdfName()
```javascript
pdfGenerator.getPdfName();
```
Returns `String` - PDF filename.

###drawText(text`*`, x`*`, y`*`, width`*`, height`*`)
```javascript
pdfGenerator.drawText("The fox jumps over the lazy dog", 20, 20, 572, 30);
```
Writes text to the PDF.
| Name | Type | Description |
| --- |:---:| --- |
| text | `String` | The text to be drawn |
| x | `Number` | Top-down horizontal coordinate where 0 is the start point at top, must be an Integer |
| y | `Number` | Left-right vertical coordinate where 0 is the start point at left, must be an Integer |
| width | `Number` | Width of the rect where the text will be drawn, must be an Integer |
| height | `Number` | Height of the rect where the text will be drawn, must be an Integer |

###drawLine(startX`*`, startY`*`, endX`*`, endY`*`)
```javascript
pdfGenerator.drawLine(20, 20, 500, 500);
```
Draws a line from one point to other.
| Name | Type | Description |
| --- |:---:| --- |
| startX | `Number` | Top-down vertical coordinate for the start point, must be an Integer |
| startY | `Number` | Left-right horizontal coordinate for the start point, must be an Integer |
| endX | `Number` | Top-down vertical coordinate for the end point, must be an Integer |
| endY | `Number` | Left-right horizontal coordinate for the end point, must be an Integer |

###drawRect(x`*`, y`*`, width`*`, height`*`)
```javascript
pdfGenerator.drawRect(10, 10, 582, 35);
```
Draws a rectangle.
| Name | Type | Description |
| --- |:---:| --- |
| x | `Number` | Top-down horizontal coordinate where 0 is the start point at top, must be an Integer |
| y | `Number` | Left-right vertical coordinate where 0 is the start point at left, must be an Integer |
| width | `Number` | Width of the rectangle, must be an Integer |
| height | `Number` | Height of the rectangle, must be an Integer |

###drawImage(path`*`, x`*`, y`*`, width`*`, height`*`)
```javascript
pdfGenerator.drawImage("\mypath\to\my\awesome\image.jpg", 20, 80, 100, 100);
```
Draws an image.
| Name | Type | Description |
| --- |:---:| --- |
| path | `String` | Image path location |
| x | `Number` | Top-down horizontal coordinate where 0 is the start point at top, must be an Integer |
| y | `Number` | Left-right vertical coordinate where 0 is the start point at left, must be an Integer |
| width | `Number` | Width of the rectangle, must be an Integer |
| height | `Number` | Height of the rectangle, must be an Integer |

###drawEllipse(x`*`, y`*`, width`*`, height`*`)
```javascript
pdfGenerator.drawEllipse(10, 10, 90, 90);
```
Draws an ellipse.
| Name | Type | Description |
| --- |:---:| --- |
| x | `Number` | Top-down horizontal coordinate where 0 is the start point at top, must be an Integer |
| y | `Number` | Left-right vertical coordinate where 0 is the start point at left, must be an Integer |
| width | `Number` | Width of the ellipse, must be an Integer |
| height | `Number` | Height of the ellipse, must be an Integer |

###addURL(url`*`, x`*`, y`*`, width`*`, height`*`)
```javascript
pdfGenerator.addURL("http://grupow2abrasil.com.br/", 20, 620, 572, 30);
```
Adds a clickable area into a rectangle which opens a link on click.
| Name | Type | Description |
| --- |:---:| --- |
| url | `String` | The link |
| x | `Number` | Top-down horizontal coordinate where 0 is the start point at top, must be an Integer |
| y | `Number` | Left-right vertical coordinate where 0 is the start point at left, must be an Integer |
| width | `Number` | Width of the rectangle for the clickable area, must be an Integer |
| height | `Number` | Height of the rectangle for the clickable area, must be an Integer |

###cancelPDF()
```javascript
pdfGenerator.cancelPDF();
```
Cancels the PDF drawing.

###savePDF(callback`*`)
```javascript
pdfGenerator.savePDF(function(e){
	Ti.API.info("My Awesome PDF is located at: " + e.url);
});
```
Saves the PDF file, calling event `pdfReady` when the file is ready.
| Name | Type | Description |
| --- |:---:| --- |
| pdfName | `Function` | A callback function which will be called when PDF is ready returning a dictionary with the file url |

###setPageWidth(width`*`)
```javascript
pdfGenerator.setPageWidth(620);
```
Sets PDF page width.
| Name | Type | Description |
| --- |:---:| --- |
| width | `Number` | Width of the PDF page, must be an Integer |

###getPageWidth()
```javascript
pdfGenerator.getPageWidth();
```
Returns `Number` - Page width (default is 612).

###setPageHeight(height`*`)
```javascript
pdfGenerator.setPageHeight(800);
```
Sets PDF page height.
| Name | Type | Description |
| --- |:---:| --- |
| height | `Number` | Height of the PDF page, must be an Integer |

###getPageHeight()
```javascript
pdfGenerator.getPageHeight();
```
Returns `Number` - Page height (default is 792).

###getPageCount()
```javascript
pdfGenerator.getPageCount();
```
Returns `Number` - Number of pages.

## Example

The follwing example illustrates the usage of PDF Generator.

```javascript
var docViewer = Ti.UI.iOS.createDocumentViewer();
var pdfGenerator = require("br.com.grupow2abrasil.pdfgenerator");
	
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

pdfGenerator.savePDF(function(e){
	Ti.API.info("url: " + e.url);
	docViewer.setUrl(e.url);
	docViewer.show();
});
```

## Author

by Grupo W2ABrasil with :heart:

## License

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