## R code for programming assignment 2

## makeCacheMatrix creates a list object with the ability to cache the inverse 
## of the input matrix
makeCacheMatrix <- function(x = matrix()) {
    ## "x" is a matrix object
    
    ## Returns a list of 4 elements:
    ## set(): define/create the matrix content and its inverse
    ## get(): get the matrix
    ## setinverse(): store the inverse of the matrix
    ## getinverse(): get the inverse of the matrix from cache
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


## cacheSolve computes the inverse of an object produces by makeCacheMatrix()
## at first run, the inverse matrix is computed and stored in cache
## at next runs, the inverse matrix is retrieved from the cache memory
cacheSolve <- function(x, ...) {
    ## "x" is a an object produced by makeCacheMatrix()
    
    ## Returns a matrix that is the inverse of 'x'
    
    ## Retrieved inverse from cache
    ## output the inverse and quit the function if not null
    inv <- x$getinverse()
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    
    ## If the inverse is null (i.e. not already computed):
    ## get the content of matrix in cache,
    ## compute the inverse with solve(), store it in cache and output it
    mat <- x$get()
    inv <- solve(mat, ...)
    x$setinverse(inv)
    inv
}
