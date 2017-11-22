#' Convert a value to a representation in another number system
#' 
#' This utility function is used to convert data in another number system. This code has been adapted from the \code{aplEncode} R function of Jan de Leeuw. It follows the standard encode implementation of the APL language.
#' @aliases aplEncode
#' @param base A numeric vector which describe the number system in which we want to recode the data.
#' @param ind The value to convert represented by a number or a numeric vector.
#' @return A vector or a matrix representing the conversion of the data.
#' @author \itemize{
#'  \item Claude Boivin, Stat.ASSQ. 
#'  \item Author of the aplEncode function: Jan de Leeuw 
#'       \url{http://www.codecollector.net/view/8A8D9395-0F66-4706-A23E-C588151E8423-95744-0000429BCF33A153}.
#'  }
#' @seealso Jan de Leeuw and Masanao Yajima: \url{https://rpubs.com/deleeuw/158476}.
#' @references \itemize{
#'  \item  L. Gilman and A. J. Rose.(1974): \emph{APL an Interactive Approach}, Second Edition, John Wiley, New-York.
#'  \item  APL 68000 Level II language manual. MicroAPL Ltd. 1990.
#'  }
#' @examples 
#' encode(c(2,2,2,2), 11)  # find the base 2 representation of number 11
#' encode(c(365,24,60), 2997) # convert 2997 minutes to days-hrs-min.
#' @export
#' 
encode<-function(base, ind) { 
r<-rep(0,length(base))
		s<-ind[1] 
		for (j in length(base):1) {
			r[j]<-s-base[j]*s%/%base[j]
			s<-(s-r[j])/base[j]
		}
 if (shape(ind) ==1) return(r)
		else return(cbind(r,encode(base, ind<-ind[-1])))
return(r)
}
	