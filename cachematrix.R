## Below are my functions that cache the inverse of an array. By elgalvan - 2019/11/07

## Loading the mathlib package, this will allow you to use the "inv ()" function to calculate the inverse matrix

library(matlib)

## Create a special "matrix", which is really a list that contains a function to:
## - set the value of the matrix
## - get the value of the matrix
## - set the value of the inverse matrix
## - get the value of the inverse matrix

## Similar to the example

makeCacheMatrix <- function(x = matrix()) {

    i <- NULL

    set <- function(y) {
        x <<- y
        i <<- NULL
    }

    get <- function() x

    setinv <- function(inv) i <<- inv

    getinv <- function() i

    list(set = set, get = get, setinv = setinv, getinv = getinv)

}

## The following function calculates the inverse matrix of the special "matrix" 
## Created with the previous function. However, first check if it has already been 
## Calculated. If so, get the reverse array from the cache and skip the calculation. 
## Otherwise, it calculates the inverse matrix of the data and sets the value of 
## The inverse matrix in the cache using the setinv function.

## Similar to the example but instead of using the mean () function, we use the inv () function

cacheSolve <- function(x, ...) {
    i <- x$getinv()

    if(!is.null(i)) {
            message("getting cached data")
            return(i)
    }

    data <- x$get()

    i <- inv(data, ...)

    x$setinv(i)

    i

}
