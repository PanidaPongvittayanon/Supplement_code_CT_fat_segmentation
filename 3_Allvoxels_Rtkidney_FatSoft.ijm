// Code for making a histogram for a specific part, e.g., Abdomen, on a single slice
// Get the directory of the currently opened image

dir = getDirectory("image");
fileName = getTitle();
patientID = getInfo("0010,0020");

ima_dir = getInfo("image.directory");
ima_name = getInfo("image.filename");

print("Directory: " + dir);
print("Filename:" + fileName);
print("Working on the histogram");

requires("1.34m");
Dialog.create("Histogram Lister");
Dialog.addNumber("Number of Bins:", 256);
Dialog.addNumber("Histogram Min:", -250);
Dialog.addNumber("Histogram Max:", 200);
Dialog.show();
nBins = Dialog.getNumber();
hMin = Dialog.getNumber();
hMax = Dialog.getNumber();
row = 0;
run("Clear Results");

slice = 240 ; // Specify the slice number
if (bitDepth == 32) {
    if (nSlices > 1) run("Set Slice...", "slice=" + slice);
    getHistogram(values, counts, nBins, hMin, hMax);
    for (i = 0; i < nBins; i++) {
        setResult("Slice", row, slice);
        setResult("Value", row, values[i]);
        setResult("Count", row, counts[i]);
        row++;
    }
} else {
    setBatchMode(true);
    stack = getImageID();
    selectImage(stack);
    if (nSlices > 1) run("Set Slice...", "slice=" + slice);
    run("Duplicate...", "title=temp");
    run("32-bit");
    getHistogram(values, counts, nBins, hMin, hMax);
    close();
    for (i = 0; i < nBins; i++) {
        setResult("Slice", row, slice);
        setResult("Value", row, values[i]);
        setResult("Count", row, counts[i]);
        row++;
    }
}
updateResults();
saveAs("Results", dir + patientID + "_RtKidney_fatsoft_" + slice + ".csv");
print("Completed");
