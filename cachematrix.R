## Given a matrix calculate the inverse, if the inverse is already calculated it will tke the result from the cache and return it

## Store the matrix and it's inverse

makeCacheMatrix <- function(x = matrix()) {
  sol <- NULL
  
  set <- function(pMatrix) {
    x <<- pMatrix
    sol <<- NULL
  }
  get <- function() x
  
  setsolve <- function(pSolve) sol <<- pSolve
  getsolve <- function() sol
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## Return the inverse of a matrix

cacheSolve <- function(x, ...) {
    ## return if it's cached
    sol <- x$getsolve()
    if(!is.null(sol)){
      message("getting cached data")
      return(sol)
    }
    
    ## calculate the inverse
    data <- x$get()
    sol <- solve(data)
    x$setsolve(sol)
    sol
}
