//This is an ImageJ macro file.  
//For extract the slice number of the amatomical landmark used for locate the body region to body fat measurement.
//Require CT images (.dcm)
//Click RUN after images are opened.

fileName = getTitle(); //needed to read in the name of the current image
patientID=getInfo("0010,0020");
pixel_spacing=getInfo("0028,0030");
slice_thickness=getInfo("0018,0050");
rescale_slope=getInfo("0028,1053");
rescale_intercept=getInfo("0028,1052");
ima_dir=getInfo("image.directory");
ima_namre=getInfo("image.filename");
run("32-bit");
run("Clear Results");


roiManager("Deselect");
run("Set Measurements...", "display area mean standard min median stack redirect=None decimal=3");


counter=0;
setTool("point");
waitForUser("User input needed", "click the most cranial part of the fore limb"); //wait for user action
cranial_extremity = getSliceNumber();
roiManager("add");
roiManager("Select", counter);
roiManager("Rename", "cranial_extremetity");
run("Measure");
setResult("patientID", counter, patientID);
setResult("pixel_spacing",counter, pixel_spacing);
setResult("slice_thickness",counter, slice_thickness);
setResult("rescale_slope", counter, rescale_slope);
setResult("rescale_intercept",counter, rescale_intercept);
//setResult("Cranial_extremity", counter, cranial_extremity);
roiManager("Deselect");


counter=1;
setTool("point");
waitForUser("User input needed", "click the right renal pelvis"); //wait for user action
right_renal_pelvis = getSliceNumber();
roiManager("add");
roiManager("Select", counter);
roiManager("Rename", "right_renal_pelvis");
run("Measure");
setResult("patientID", counter, patientID);
setResult("pixel_spacing",counter, pixel_spacing);
setResult("slice_thickness",counter, slice_thickness);
setResult("rescale_slope", counter, rescale_slope);
setResult("rescale_intercept",counter, rescale_intercept);
//setResult("right_renal_pelvis", counter, right_renal_pelvis);
roiManager("Deselect");


counter=2;
setTool("point");
waitForUser("User input needed", "click the left renal pelvis"); //wait for user action
left_renal_pelvis = getSliceNumber();
roiManager("add");
roiManager("Select", counter);
roiManager("Rename", "left_renal_pelvis");
run("Measure");
setResult("patientID", counter, patientID);
setResult("pixel_spacing",counter, pixel_spacing);
setResult("slice_thickness",counter, slice_thickness);
setResult("rescale_slope", counter, rescale_slope);
setResult("rescale_intercept",counter, rescale_intercept);
//setResult("left_renal_pelvis", counter, left_renal_pelvis);
roiManager("Deselect");


counter=3;
setTool("point");
waitForUser("User input needed", "click the middle point of femoral head"); //wait for user action
mid_hipjoint = getSliceNumber();
roiManager("add");
roiManager("Select", counter);
roiManager("Rename", "mid_hipjoint");
run("Measure");
setResult("patientID", counter, patientID);
setResult("pixel_spacing",counter, pixel_spacing);
setResult("slice_thickness",counter, slice_thickness);
setResult("rescale_slope", counter, rescale_slope);
setResult("rescale_intercept",counter, rescale_intercept);
//setResult("mid_hipjoint", counter, mid_hipjoint);
roiManager("Deselect");


counter=4;
setTool("point");
waitForUser("User input needed", "click the most caudal part of the hind limb"); //wait for user action
caudal_extremity = getSliceNumber();
roiManager("add");
roiManager("Select", counter);
roiManager("Rename", "caudal_extremity");
run("Measure");
setResult("patientID", counter, patientID);
setResult("pixel_spacing",counter, pixel_spacing);
setResult("slice_thickness",counter, slice_thickness);
setResult("rescale_slope", counter, rescale_slope);
setResult("rescale_intercept",counter, rescale_intercept);
//setResult("caudal_extremity", counter, caudal_extremity);
roiManager("Deselect");


counter=5;
setTool("point");
waitForUser("User input needed", "select -- liver"); //wait for user action
liver_slice = getSliceNumber();
roiManager("add");
roiManager("Select", counter);
roiManager("Rename", "liver");
run("Measure");
setResult("patientID", counter, patientID);
setResult("pixel_spacing",counter, pixel_spacing);
setResult("slice_thickness",counter, slice_thickness);
setResult("rescale_slope", counter, rescale_slope);
setResult("rescale_intercept",counter, rescale_intercept);
//setResult("liver_slice", counter, liver_slice);
roiManager("Deselect");

//SAVE FILE
ima_dir=getInfo("image.directory");
ima_name=getInfo("image.filename");
patientID=getInfo("0010,0020");

selectWindow("Results");
saveAs("Results", ima_dir+ima_name+patientID+"_results.csv");



