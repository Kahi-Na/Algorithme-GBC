# GBC Algorithm 

# Graph Based Clustering Method ( GBC ) 
  This project consists on creating a new package for R, it implements a new clustering method called " GBC " for " Graph Based Clustering " method. 

  The GBC method has been proposed in 2009 by the respective both IT Professors and researchers, Fabrice MUHLENBACH, Lecturer in Computer Science, Research Professor at the Hubert Curien laboratory, UMR CNRS 5516, at Jean Monnet University of Saint-Étienne, France; and Stéphane LALLICH, Emeritus Professor at Lyon 2 University, Research Professor at the ERIC Laboratory (EA 3083), at University Lumière Lyon 2, France.

  This method (GBC) detects automatically the optimal number of “K” clusters of a dataset and performs the appropriate clustering without requiring any other clustering parameter. It comes as a solution to the problem encountered in most of the Machine Learning Clustering methods (such as K-means, DBSCAN, Ward’s Hierarchical algorithm, etc.) in which is very often necessary to define a certain number of parameters beforehand to determine the ideal number of clusters K to perform the final clustering, which is not always an easy task; as it is the case for example with the K-means method, the user have to determine the number of clusters K in advanced to the algorithm, which can be not efficient, because in certain cases of datasets we cannot define the appropriate number of its clusters easily.

### Instructions how to Manage the project

1.	Install  the R IDE “RStudio”  for windows 7/8/10 : <br/> Download RStudio (version 1.1.453+) and install it, . Launch the RStudio and install and load the necessary packages “devtools”, “usethis” and “roxygen2” to build the project.
2.	Install R ( RStudio requires R version 3.0.1+) : <br/> Download R and install it.
3.	Install Rtools (Creating or using an R package requires the Rtools to be installed): <br/> Download Rtools (version R 3.3.x and later).

2. Obtain the project : <br/>We can obtain the project using gitHub (Online project hosting), by following gitHub instruction : git clone (https://github.com/Kahi-Na/Algorithme-GBC) <br/> Or, once the gbc package is available on CRAN use the basic instructions (as any other package available on CRAN), using the command “install.packages(“gbc”)” from the R console or using the menu of the RStudio IDE (by clicking on the button “packages” then “install packages” the write the name of the package “gbc” and click “install ipackage”), once installed the package should be loaded in order to use it by using the command “library(gbc)”, then you can use “gbc (dataset)” method.

4.	Test(s): functional tests, as following :
-	Install and load the “gbc” package in the work directory: //here list of insrcts//
-	Call the gbc function in the R console: gbc(“folder-of-the dataset/nameOfTheDataset.extension”) then get the results.

### Architectur description : 

 * Model: distance.matrix.R, rng.R, gbc.R, calc_sub_graph.R, dfs.R, set_cluster_number.R,. <br/>
 * Packages: For any information about which packages used by the gbc package please check the   DESCRIPTION file of the gbc package. <br>
 
 * Datasets Source : any datasets respecting the requirements described within the help file of the gbc’s package main function (gbc.Rd).

* help documentation : <br> DESCRIPTION file (of the gbc package) <br> Vignette <br> man folder : 

