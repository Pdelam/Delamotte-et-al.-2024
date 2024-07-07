// Open all files from a source directory
// and save them in a target directory in TIFF format
// Albert Cardona 2007
//
source_dir = getDirectory("Source Directory");
target_dir = getDirectory("Target Directory");

if (File.exists(source_dir) && File.exists(target_dir)) 
	{
    setBatchMode(true);
    list = getFileList(source_dir);
    for (i=0; i<list.length; i++) 
    	{
        if (endsWith(list[i], ".tif")) 
        	{
            open(source_dir + "/" + list[i]);
        
        	// Ici je recupere le nom de l'image ouverte et j'extrait les Ch1 et Ch2
        	OriImage = getTitle();
        	run("32-bit");
			run("Duplicate...", "title=Img_CH1 duplicate channels=1");
			selectWindow(OriImage);
			run("Duplicate...", "title=Img_CH2 duplicate channels=2");
			close(OriImage);
		
			// Seuillage CH1
			selectWindow("Img_CH1");
			setAutoThreshold("Default dark");
			run("NaN Background");
		
			//Seuillage CH2
			selectWindow("Img_CH2");
			setAutoThreshold("Default dark");
			run("NaN Background");

			//Calcul du Ratio
			imageCalculator("Divide create 32-bit", "Img_CH1","Img_CH2");
			run("Enhance Contrast", "saturated=0.35");
			run("5 ramps");
			run("Calibration Bar...", "location=[Upper Right] fill=Black label=White number=5 decimal=1 font=20 zoom=2 overlay");
			
			saveAs("tiff", target_dir +File.separator+ list[i] + ".tif");
	    	run("Close All");
	    	showProgress(i, list.length);
        	}
    	}
	}
showMessage("Ratio Images Creation", "All files processed successfully !");

