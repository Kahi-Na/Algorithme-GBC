% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gbc.R
\name{distance.matrix}
\alias{distance.matrix}
\title{The Distance between each pair of points of the given dataset.
A function to compute distances (euclidean, manhattan or any d-distance) between the points within the given dataset.}
\usage{
distance.matrix(dataset)
}
\arguments{
\item{dataset}{Any given dataset, any (.txt, .csv,..ect.),
such that the separator between its columns and lines should be a blank space " ",
and the number of its observations (lines) and the number of its features should be
a moderate number (not too large), and the type of its elements (attributes) should
be of numerical type (continous or multivalued values) for calculating the distances.
and the observations with missing values should be removed from the dataset (and note
that you can use the Milligan Cooper method to standardize the dataset's values).}
}
\value{
The function returns the distance matrix of all the dataset, distances between each pair of nodes within this dataset.
distance.matrix(dataset)
}
\description{
The Distance between each pair of points of the given dataset.
A function to compute distances (euclidean, manhattan or any d-distance) between the points within the given dataset.
}
