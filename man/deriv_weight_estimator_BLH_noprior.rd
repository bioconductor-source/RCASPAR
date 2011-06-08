\name{deriv_weight_estimator_BLH_noprior}
\alias{deriv_weight_estimator_BLH_noprior}
\title{
A function that gives the derivative of the objective function of the model for gradient-based optimization algorithms without including the prior on the regression 
coefficients.
}
\description{
Given the necessary data, this function calculates the derivative of the objective function without a prior on the regression coefficients w.r.t. the baseline hazards and 
weights(regression coefficients) in the model to be used in gradient-based optimization algorithms. This is sometimes necessary to get the optimization algorithm out of a 
peaked origin where it could start.
}
\usage{
deriv_weight_estimator_BLH_noprior(survDataT, geDataT, weights_baselineH, a, b, groups)
}
\arguments{
  \item{survDataT}{
The survival data of the patient set passed on by the user. It takes on the form of a data frame with at least have the following columns \dQuote{True\_STs} and 
\dQuote{censored}, corresponding to the observed survival times and the censoring status of the subjects consecutively. Censored patients are assigned a \dQuote{1} while 
patients who experience an event are assigned \dQuote{1}.
}
  \item{geDataT}{
The co-variate data (gene expression or aCGH, etc...) of the patient set passed on by the user. It is a matrix with the co-variates in the columns and the subjects in the rows. Each cell 
corresponds to that row\emph{th} subject's column\emph{th} co-variate's value.
}
  \item{weights_baselineH}{
A single vector with the initial values of the baseline hazards followed by the weights(regression coefficients) for the co-variates.
}
  \item{a}{
The shape parameter for the gamma distribution used as a prior on the baseline hazards.
}
  \item{b}{
The scale parameter for the gamma distribution used as a prior on the baseline hazards.
}
  \item{groups}{
The number of partitions along the time axis for which a different baseline hazard is to be assigned. This number should be the same as the number of initial values passed for 
the baseline hazards in the beginning of the \dQuote{weights\_baselineH} argument.
}
}
\value{
A vector of the same length as the ``weights\_baselineH'' argument corresponding to the calculated derivatives of the objective with respect to every component of 
``weights\_baselineH''.
}
\references{
The basic model is based on the Cox regression model as first introduced by Sir David Cox in: Cox,D.(1972).Regression models & life tables. \emph{Journal of the Royal 
Society of Statistics}, 34(2), 187-220.
The extension of the Cox model to its stepwise form was adapted from: Ibrahim, J.G, Chen, M.-H. & Sinha, D. (2005). \emph{Bayesian Survival Analysis (second ed.)}. 
NY: Springer.
as well as Kaderali, Lars.(2006) A Hierarchial Bayesian Approach to Regression and its Application to Predicting Survival Times in Cancer Patients. Aachen: Shaker
}
\author{
Douaa Mugahid
}
\note{
This function is in itself not very useful to the user, but is used within the function
\code{weights\_BLH}.
}
\seealso{
\code{\link{weight_estimator_BLH_noprior}}, \code{\link{deriv_weight_estimator_BLH}}
}
\examples{
data(Bergamaschi)
data(survData)
deriv_weight_estimator_BLH_noprior(survDataT=survData[1:10, 9:10], geDataT=Bergamaschi[1:10, 1:2], weights_baselineH=c(0.1,0.2,0.3,rep(0,2)), a=1.5, b=0.3, groups=3)
}
\keyword{ cox regression }
\keyword{derivative of objective function}
