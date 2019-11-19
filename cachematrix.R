## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCachedMatrix <- function(localOriginalMatrix = matrix()) {
   inversedMatrix <- NULL # Set initial slot for inverse matrix to Null as it was not yet calculated
   set <- function(y) { # this is setter that sets - Ba! Dum! Tss! - function to starting state in which inversed Matrix is not yet calculated
      localOriginalMatrix <<- y
      inversedMatrix <<- NULL
   }
   get <- function() localOriginalMatrix # getter that allows user to get - yup! - matrix saved in this object
   setInverse <- function(parameter) inversedMatrix <<- parameter # setter but for inversed matrix
   getInverse <- function() inversedMatrix # getter but for inversed matrix
   list(set = set,
        get = get,
        setInverse = setInverse,
        getInverse = getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(CachedMatrix, ...) {
   ## Return a matrix that is the inverse of 'x'
   inversedMatrix <- CachedMatrix$getInverse()
   if (!is.null(inversedMatrix)) { # checks if matrix was already set to some in not then solves it
      message("Getting inversed matrix from cache:")
      return(inversedMatrix)
   }
   localOriginalMatrix <- CachedMatrix$get() # getting matrix for calculation from provided CachedMatrix
   localInversedMatrix <- solve(localOriginalMatrix, ...) # solving matrix saved in CachedMatrix
   CachedMatrix$setInverse(localInversedMatrix) # Setting inversed matrix to function attribte
   localInversedMatrix # Returning matrix to show it.
}
