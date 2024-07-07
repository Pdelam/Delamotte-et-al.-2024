source_dir = getDirectory("Source Directory");
target_dir = getDirectory("Target Directory");

if (File.exists(source_dir) && File.exists(target_dir)) {
    setBatchMode(true);
    list = getFileList(source_dir);
    for (i = 0; i < list.length; i++) {
        if (endsWith(list[i], ".tif")) {
            open(source_dir + "/" + list[i]);

            // Ici je recupere le nom de l'image ouverte et j'extrait les Ch1 et Ch2
            OriImage = getTitle();
        	run("32-bit");
			run("Duplicate...", "title=Img_CH3 duplicate channels=3");
			selectWindow(OriImage);
			close(OriImage);
        
            // Process channel 1
            selectWindow("Img_CH3");
            if (nSlices() > 1) {
                run("Z Project...", "projection=[Sum Slices]");
                close(OriImage);
                setAutoThreshold("Default dark");
			    run("NaN Background");
            } else {
                selectWindow("Img_CH3");
                setAutoThreshold("Default dark");
			    run("NaN Background");

            }
          
            // Save the result
            saveAs("Tiff", target_dir + File.separator + "Result_" + list[i]);
            run("Close All");
            showProgress(i, list.length);
        }
    }
}

showMessage("Ratio Images Creation", "All files processed successfully !");