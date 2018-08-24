\name{s2-sample}
\alias{s2-sample}
\docType{data}
\title{sample of S2 type of dataset as an example of the presence of an outlier in a dataset}
\description{A sample of S2 Synthetic 2-d data with N=5000 vectors and k=15 Gaussian clusters with different degree of cluster overlapping}
\usage{data("s2-sample")}
\format{
  A data frame with 150 observations on the following 2 variables.
  \describe{
    \item{\code{X636607}}{a numeric vector}
    \item{\code{X845753}}{a numeric vector}
  }
}
\source{
P. Fränti and O. Virmajoki, "Iterative shrinking method for clustering problems", Pattern Recognition, 39 (5), 761-765, May 2006. (Bibtex)
}
\examples{
data(s2-sample)
## maybe str(s2-sample) ; plot(s2-sample) ...
}
\keyword{datasets}
