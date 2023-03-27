// Action Bar description file :FFT_Helper
run("Action Bar","/plugins/ActionBar/FFT_Helper_v3.ijm");
exit();

// Fix error if nothing is selected
// disable on top with tick box

<onTop>
<recordable>

<startupAction>
roiManager("reset");
roiManager("Show All with labels");
</startupAction>

///////////////Line 1
<line>
<button> 1 line 1
label=Forward_FFT
icon=noicon
arg=<macro>
	run("FFT");
	run("Tile");
</macro>


<button> 2 line 1
label=Reset_ROI_manager
icon=noicon
arg=<macro>
	roiManager("reset");
</macro>


<button> 3 line 1
label=Close_Everything
icon=noicon
arg=<macro>
	run("Fresh Start");
</macro>
</line>


///////////////Line 2
<line>
<button> 1 line 2
label=Flip_Horizontally
icon=noicon
arg=<macro>
if (selectionType() >= 0) {
	close("Mask");
	run("ROI Manager..."); //If not open it will not add the new selection
	setBatchMode(true);
	run("Create Mask");
	run("Select None");
	run("Flip Horizontally");
	run("Create Selection");
	roiManager("add");
	close("Mask");
	roiManager("Show All");
	setBatchMode(false);
	} else {
		Dialog.create("Info");
		Dialog.addMessage("Create or select a region first");
		Dialog.show();
		}	
</macro>


<button> 2 line 2
label=Flip_Vertically
icon=noicon
arg=<macro>
if (selectionType() >= 0) {
	close("Mask");
	run("ROI Manager..."); //If not open it will not add the new selection
	setBatchMode(true);
	run("Create Mask");
	run("Select None");
	run("Flip Vertically");
	run("Create Selection");
	roiManager("add");
	close("Mask");
	roiManager("Show All");
	setBatchMode(false);
	
		} else {
		Dialog.create("Info");
		Dialog.addMessage("Create or select a region first");
		Dialog.show();
		}
</macro>


<button> 3 line 2
label=Rotate_180
icon=noicon
arg=<macro>
if (selectionType() >= 0) {
	close("Mask");
	run("ROI Manager..."); //If not open it will not add the new selection
	run("Rotate...", "rotate angle=180");
	roiManager("add");
	roiManager("Show All");
	setBatchMode(false);
	
		} else {
		Dialog.create("Info");
		Dialog.addMessage("Create or select a region first");
		Dialog.show();
		}
</macro>
</line>




///////////////Line 3
<line>
<button> 1 line 3
label=Remove_last_Roi
icon=noicon
arg=<macro>
	n = roiManager("count");
	roiManager("Select", n-1);
	roiManager("Delete");
	roiManager("Show None"); //This will refresh the ROI display
	roiManager("Show All"); //This will refresh the ROI display
</macro>


<button> 2 line 3
label=Reset_FFT
icon=noicon
arg=<macro>
	run("Redisplay Power Spectrum");
</macro>


<button> 3 line 3
label=Reverse_FFT
icon=noicon
arg=<macro>
	setBatchMode(false);
	id = getImageID();
	
	//Combine ROIs
	roiManager("Deselect");
	roiManager("Combine");
	roiManager("Add");
	
	//Reverse FFT excluding selection
	selectImage(id);
	setBackgroundColor(0, 0, 0);
	run("Clear");
	run("FFT");
	rename("Inverste FFT excluding selection");
	
	//Reverse FFT selection only
	selectImage(id);
	run("Redisplay Power Spectrum");
	
	roiManager("select", roiManager("count") -1);
	run("Make Inverse");
	setBackgroundColor(0, 0, 0);
	run("Clear");
	run("FFT");
	run("Select None");
	rename("Inverste FFT of selection");
	
	selectImage(id);
	run("Redisplay Power Spectrum");
	
	// Delete the combined ROI
	roiManager("select", roiManager("count") -1);
	roiManager("Delete");
	
	run("Tile");

</macro>
</line>
// end of file
