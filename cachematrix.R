## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

# this simple function stores a cached version of the input matrix. Calls to the function makeCacheMatrix should
# supply a matrix that can be inversed. Set matrix using aMatrix <- makeCacheMatrix(matrix).
# Recall matrix using aMatrix$getmatrix(). The function also sets up calculation of inverse of x to be called
# by the next function
makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(solve) m <<- solve
        getinverse <- function() m
        list(set = set, get = get, setinverse =setinverse, getinverse = getinverse)
}


## Using 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
}

#try out the functions like this. a <- makeCacheMatrix(matrix(c(1/2, -1/4, -1, 3/4), nrow = 2, ncol = 2))
#cacheSolve(a)



