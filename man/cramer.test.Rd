\name{cramer.test}
\alias{cramer.test}
\title{
Cramer-Test for uni- and multivariate two-sample-problem
}
\description{
Perform Cram\eqn{\mbox{\'e}}{e}r-test for two-sample-problem. Both univariate and
multivariate data is possible. For calculation of the critical value
bootstrap-methods are used. Ordinary and permutation methods can be 
chosen as well as the number of bootstrap-replicates taken.
}
\usage{
cramer.test(x,y,conf.level=0.95,replicates=1000,
            sim="ordinary",just.statistic=FALSE) 
}
\arguments{
\item{x}{
First set of observations. Either in vector form (univariate) or in a
matrix with one observation per row (multivariate).
}
\item{y}{
Second set of observations. Same dimension as \code{x}.
}
\item{conf.level}{
Confidence level of test.
}
\item{replicates}{
Number of bootstrap-replicates taken to obtain critical value.
}
\item{sim}{
Type of bootstrap method. Possible values are \code{"ordinary"} for normal 
bootstrap and \code{"permutation"} for a permutation test.
}
\item{just.statistic}{
Boolean variable. If \code{TRUE} just the value of the Cram\eqn{\mbox{\'e}}{e}r-statistic
is calculated and no bootstrap-replicates are produced.
}}

\value{
The returned value is an object of class \code{"cramertest"}, containing the following
components:

\item{method}{
Describing the test in words.
}
\item{d}{
Dimension of the observations.
}
\item{m}{
Number of \code{x} observations.
}
\item{n}{
Number of \code{y} observations.
} 
\item{statistic}{
Value of the Cram\eqn{\mbox{\'e}}{e}r-statistic for the given observations.
}
\item{conf.level}{
Confidence level for the test.
}
\item{crit.value}{
Critical value calculated by bootstrap method.
}
\item{p.value}{
Estimated p-value of the test.
}
\item{result}{
Contains \code{1} if the hypothesis of equal distributions should not be accepted and
\code{0} otherwise.
}
\item{sim}{
Method used for obtaining the critical value.
}
\item{replicates}{
Number of bootstrap-replicates taken.
}}

\details{
The Cram\eqn{\mbox{\'e}}{e}r-statistic is given by
\deqn{
T_{m,n} = \frac{mn}{m+n}\biggl(\frac{1}{mn}\sum_{i\in\underline{m},j\in\underline{n}}\|\vec{X}_i-\vec{Y}_j\| 
}{
T=mn/(m+n) ( 1/(mn) Sum[i=1..m,j=1..n] ||X_i-Y_j|| - 1/(2m^2) Sum[i=1..m,j=1..m] ||X_i-X_j|| - 1/(2n^2) Sum[i=1..n,j=1..n] ||Y_i-Y_j|| )
}
\deqn{
-\frac{1}{2m^2}\sum_{i_1\in\underline{m},i_2\in\underline{m}}\|\vec{X}_{i_1}-\vec{X}_{i_2}\|-\frac{1}{2n^2}\sum_{j_1\in\underline{n},j_2\in\underline{n}}\|\vec{Y}_{j_1}-\vec{Y}_{j_2}\|\biggr),
}{\code{}}
\eqn{\mbox{where}\ \underline{m}=\{1,\ldots,m\}.}{\code{}}
The critical value is obtained by using the bootstrap-method with this statistic. 
The proof that this procedure yields in a working test is given in the reference
listed below.

The idea of using this statistic is due to L. Baringhaus, University of Hanover.
}
\references{
The test and its properties is described in :

Baringhaus, L. and Franz, C. (2001) \emph{On a new multivariate two-sample test},
submitted

Franz, C. (2000) \emph{Ein statistischer Test fuer das mehrdimensionale Zweistichproben-Problem}, 
German, Diploma thesis, University of Hanover.

}
\seealso{
\code{\link{print.cramertest}}
}
\examples{
# comparison of two univariate normal distributions
x<-rnorm(20,mean=0,sd=1)
y<-rnorm(50,mean=0.5,sd=1)
cramer.test(x,y)

# comparison of two multivariate normal distributions with permutation test
library(MASS)
x<-mvrnorm(n=20,mu=c(0,0),Sigma=diag(c(1,1)))
y<-mvrnorm(n=50,mu=c(0.3,0),Sigma=diag(c(1,1)))
cramer.test(x,y,sim="permutation")
}
\keyword{nonparametric}
\keyword{multivariate}
\keyword{htest}
