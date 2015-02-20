## R Programming: Assignment 2
## Feb, 2015.
##
## Contains functions for calculating the inverse of a matrix
## and caching the result:
##    makeCacheMatrix: to create the special cached 'matrix' object.
##    cacheSolve: to calculate the cached inverse matrix.
##

## This function creates a special 'matrix' object that can
## cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinv <- function(inverse) inv <<- inverse
  getinv <- function() inv
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}

## This function computes the inverse of the special matrix 'x' returned by
## the makeCacheMatrix function.
## If the inverse has already been calculated (and the matrix has not changed), then
## the cacheSolve should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
  # Get the inv matrix value
  inv <- x$getinv()
  # If already calculated, return cached value
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  # Otherwise calculate inverse matrix with solve, and store value in the cache
  # and return it.
  message("calculating data for cache")
  data <- x$get()
  inv <- solve(data, ...)
  x$setinv(inv)
  inv
}
