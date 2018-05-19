// open a single window
var win = Ti.UI.createWindow({
	backgroundColor:'white'
});
var label = Ti.UI.createLabel({
	text: "PDF Generator example"
});
win.add(label);
win.open();

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