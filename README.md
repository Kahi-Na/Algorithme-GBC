# GBC Algorithm 

# Graph Based Clustering Method ( GBC ) 
  This project consists on creating a new package for R, it implements a new clustering method called " GBC " for " Graph Based Clustering " method. 

  The GBC method has been proposed in 2009 by the respective both IT Professors and researchers, Fabrice MUHLENBACH, Lecturer in Computer Science, Research Professor at the Hubert Curien laboratory, UMR CNRS 5516, at Jean Monnet University of Saint-Étienne, France; and Stéphane LALLICH, Emeritus Professor at Lyon 2 University, Research Professor at the ERIC Laboratory (EA 3083), at University Lumière Lyon 2, France.

  This method (GBC) detects automatically the optimal number of “K” clusters of a dataset and performs the appropriate clustering without requiring any other clustering parameter, by using the properties of a neighborhood graph (particularly the "Relative Neighborhood Graph - RNG"(Toussaint, 1980 )). It comes as a solution to the problem encountered in most of the Machine Learning Clustering methods (such as K-means, DBSCAN, Ward’s Hierarchical algorithm, etc.) in which is very often necessary to define a certain number of parameters beforehand to determine the ideal number of clusters K to perform the final clustering, which is not always an easy task; as it is the case for example with the K-means method, the user have to determine the number of clusters K in advanced to the algorithm, which can be not efficient, because in certain cases of datasets we cannot define the appropriate number of its clusters easily.

### Instructions how to Manage the project

####	Requirements :
1. R Installation :
* Download R interpreter version 3.0.1+ ( RStudio requires R version 3.0.1+) from the R project website (https://cran.r-project.org/) , and install it.
* Download Rtools version R 3.3.x and later (Creating or using an R package requires the Rtools to be installed).
* Download the R IDE “RStudio” (version 1.1.453+) for windows 7/8/10  and install it
* Launch the RStudio then install and load the necessary packages (“devtools”, “usethis” and “roxygen2”) to build the project.

2. Obtain the project : 

* If the gbc package is not available on CRAN we can obtain the project using gitHub (Online project hosting), by following gitHub instruction : git clone (https://github.com/Kahi-Na/Algorithme-GBC), then to use it follow the instructions below : 
    * Open the gbc package project from RStudio IDE as follows : file -> open project -> open the "gbc.Rproj" file within the gbc folder, then a  new session will be openned for the gbc project in RStudio.
    * Once you opened the gbc poject you have now to  install it and load it in your work directory as  follows : from RStudio top right menu click on the button "Install and Restart", then you will have the gbc  installed and loaded automatically and now you can use it by calling the "gbc ("dataset")" function from the RStudio Console.
    
* Or, once the gbc package is available on CRAN use the basic instructions (as any other package available on CRAN) as follows :
  * Either by using the following commands in the R IDE Console :  “install.packages(“gbc”)” , then load it  using "library(gbc)" command always in the IDE Console.
  * Or, using the menu of the RStudio IDE (by clicking on the button “Packages” -> “Install” -> write the name of the package “gbc” -> click “install” and once installed you have to load it soo you can use it writting the "library(gbc)" command always in the RStudio Console (same as it is explained before).
  
 3. Execution : 
  * Once the gbc package is installed and loaded with the commands explained in the previous title.
  * Now you can use the GBC method and excute it, by calling “gbc ("dataset")” function passing as a parameter your dataset.

3.	Test example :
*	Install and load the “gbc” package in the work directory of the RStudio IDE (as it is explained before).
-	Call the gbc function in the R console: gbc(“folder-of-the dataset/nameOfTheDataset.extension”) then get the results. Note that the dataset should be placed in the "data" folder of the "gbc" project, or on your work directory folder.
- Example : write in the RStudio IDE Console the following command : *gbc("data/ruspini.txt")*, then get the results with the corresponding plots.

### Architectur description : 

 * Model: distance.matrix.R, rng.R, gbc.R, calc_sub_graph.R, dfs.R, set_cluster_number.R,. The code of the gbc package is placed on its "R" folder. <br/>
 * Packages: All information about the used packages by the gbc package and specifities are available within both the "DESCRIPTION file" and the "NAMESPACE file" of the gbc package. <br>
 
 * Datasets source : Any datasets following the requirements described within the help file of the gbc’s package main function (gbc.Rd), the datasets used as examples of the gbc package are contained within its "data" folder.

* help documentation : 
<br> DESCRIPTION file (of the gbc package) : You can visualize it in the gbc package folder from RStudio or open it from the gbc folder using a text editor (such as notepad++).   
<br> The "Vignette" folder : You can open it from its folder within the gbc project in RStudio (how-to-use-gbc-package.Rmd) then click the botton "knitr" from the menu bar of RStudio after opening the vignette file.  
<br> The "man" (for manual) folder : This folder contains all the help files of the gbc package functions, for each function an associated help file having the same name as the function (example : gbc.Rd, dfs.Rd, etc.), the same for the datasets descriptions help files used as examples of the package, you can find the "ruspini.Rd"  file and the "s2-sample.Rd". In order to view them, for all help documentation in RStudio you can get them from the "Help" section within the IDE in the bottom right menu of the IDE, or just write the name of the function for which you want to see its help file (description) on the IDE RStudio console as follows : for example , "?gbc" (or alternatively "??gbc") this will automatically open the gbc help file to you and you can visualize it and read it.

