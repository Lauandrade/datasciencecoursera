#Usage Exemple:
# m<-makeCacheMatrix(matrix(c(2,4,4,2), c(2,2)))
# cachesolve(m)
#[,1]       [,2]
#[1,] -0.1666667  0.3333333
#[2,]  0.3333333 -0.1666667




makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) m <<- solve
  getsolve <- function() m
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}

cachesolve <- function(x, ...) {
  m <- x$getsolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setsolve(m)
  m
}