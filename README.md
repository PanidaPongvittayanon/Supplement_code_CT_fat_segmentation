Instructions:
- These supplement codes are used to extract the  Fat voxel numbers and Fat+Soft tissue voxel numbers. 
- The first step is for extraction of the slice number of anatomical landmark of the body regions, and also extraction of the rescaling parameters and voxel sizes.
- The Second is for counting Fat tissue voxels
- The third step is for counting Fat+Soft tissue voxels  -- Used for calculation of Fat%-CT

*****************************

Step1: slice_selection

Code name: 1_sliceselection.ijm

Program: ImageJ/

Details: 
1. Open ImageJ program, open the macro file, and import image sequence in ImageJ program and click “Run”
2. This macro code provides interactive selection of the slice number of the anatomical landmark (the most cranial part of the fore limb, left renal pelvic, right renal pelvic, the middle point of femoral head, the most caudal part of the hind limb, liver) by prompting the user to click on the image.
3. Finally, the .csv file will be automatically saved into the same folder of CT image.
1. Beside from slice numbers, the voxel size and rescaling parameter are also extracted and saved.
*****************************

Step 2: Counting fat voxels

Aim: For counting the fat voxels by using three counting techniques  (1D, 2D, and 3D) in 

Code: 2_FatSegmentation_HUrange1_allcounting.Rmd / 2_FatSegmentation_HUrange2_allcounting.Rmd

Program: RStudio (R 4.4.2)

Details: 
1. Open the code in Rstudio program, then fill in the slice numbers of anatomical slice used for set the body regions. Click “Run”
2. The fat voxels count were automatically run though all body areas and all counting technique
*****************************

Step 3: Counting Fat + Soft tissue voxels 

Aim: For counting all fat+soft tissue voxels in individual body regions (using range of -250 to 200 HU for segmentation) — use for calculate Fat%-CT 

Code: 3_Allvoxels_Abdomen_FatSoft.ijm / 3_Allvoxels_Ltkidney_FatSoft.ijm / 3_Allvoxels_Rtkidney_FatSoft.ijm / 3_Allvoxels_Wholebody_FatSoft.ijm

Program: ImageJ

Details: 
1. Open ImageJ program, open the macro file, and import image sequence in ImageJ program and click “Run”. The result will be saved as .csv file
*****************************
