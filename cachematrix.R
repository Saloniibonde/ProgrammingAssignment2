## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) m <<- solve
  getsolve<- function() m
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
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
x<-matrix(1:4,2,2)
x
cacheSolve(makeCacheMatrix(x))

#> x
#[,1] [,2]
#[1,]    1    3
#[2,]    2    4
#> cacheSolve(makeCacheMatrix(x))
#[,1] [,2]
#[1,]   -2  1.5
#[2,]    1 -0.5
#> 
