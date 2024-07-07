// This macro transform complex LIF files in mutiple TIFF series.
// A folder fill be created for each .lif file listed inn the source folder
// If the targeted folder contains sub folders or .lifext files they will be ignored
// A z projection is possible (uncomment line59)

roiManager("Reset");
run("Close All");	
run("Clear Results");
print("\\Clear");

macro 'convert LIF tiff' 
{
run("Bio-Formats Macro Extensions");
dir = getDirectory("Choose folder with lif files ");
list = getFileList(dir);

setBatchMode(true);
 
for (i=0; i<list.length; i++)
	{
	showProgress(i+1, list.length);
	//Open all the files except the sub folders and the .lifext files
	if (!endsWith(list[i],"/")&&!endsWith(list[i],"lifext"))
		{
		print("processing ... "+i+1+"/"+list.length+"\n         "+list[i]);
		path=dir+list[i];

		// create folders for the tifs
		lifname=list[i];
		n = indexOf(lifname, ".lif");
		lifname = substring(lifname, 0, n);
		dirName = File.getName(dir);
		dirOut = dir+File.separator+lifname+"_tif";
		if (File.exists(dirOut)==false)
			{
			File.makeDirectory(dirOut);
			}

		//how many series in this lif file?
		Ext.setId(path);//-- Initializes the given path (filename).
		Ext.getSeriesCount(seriesCount); //-- Gets the number of image series in the active dataset.
		
		//
		for (j=1; j<=seriesCount; j++) 
			{
			run("Bio-Formats", "open=path autoscale color_mode=Default view=Hyperstack stack_order=XYCZT series_"+j);
			name=File.nameWithoutExtension;
			
			//retrieve name of the series from metadata
			text=getMetadata("Info");
			n1=indexOf(text," Name = ")+8; // the Line in the Metadata reads "Series 0 Name = ". Complete line cannot be taken, because the number changes of course. But at least in the current version of Metadata this line is the only occurence of " Name ="
			n2=indexOf(text,"SizeC = "); // this is the next line in the Metadata
			seriesname=substring(text, n1, n2-2);
			
			//Ignore files containing "Region"
//			if (indexOf(seriesname,"Region")== -1)
//				{
/*				// If a Z stack is present it is possible to do a Max intensity Z projection
				Stack.getDimensions(width, height, channels, slices, frames);
				if (slices > 1)
					{
					run("Z Project...", "projection=[Max Intensity]");
					}
*/			
				//Save the extracted image as tif
				outpath = dirOut+File.separator+seriesname+"_"+j+".tif";
				if (indexOf(seriesname,"/Region")!= -1){outpath = replace(outpath,"/Region","_Region");}
				if (indexOf(seriesname,"/Position")!= -1){outpath = replace(outpath,"/Position","_Position");}
				print(outpath);
				saveAs("Tiff", outpath);
				print(j+"/"+seriesCount+" Files saved !");
//				}
			run("Close All");
			}
		}
	run("Close All");
	}
setBatchMode(false);
showMessage("Successful File Convertion!");	
}