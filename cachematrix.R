## Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix creates a list object with the cached inverse matrix
makeCacheMatrix <- function(x = matrix()) {
    ## "x" is a matrix object
    
    ## the return list has 4 elements:
    ## set(): define/create the matrix
    ## get(): get the content of the matrix
    ## setinverse(): define the inverse of the matrix
    ## getinverse(): retrieve the cached inverse of the matrix
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) inv <<- inverse
    getinverse <- function() inv
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## cacheSolve computes inverse of an object produces by makeCacheMatrix()
## at first run, the inverse matrix is computed and cached
## other time, the inverse matrix is retrieved from cache memory
cacheSolve <- function(x, ...) {
    ## "x" is a an object produced by makeCacheMatrix
    ## Return a matrix that is the inverse of 'x'
    inv <- x$getinverse()
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data, ...)
    x$setinverse(inv)
    inv
}
