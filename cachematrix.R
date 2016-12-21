## Put comments here that give an overall description of what your
## functions do

## Function creates a matrix object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {   #defining the arguement
  inv <- NULL                                 # initializing inv as NULL
  set <- function(y){                         #defining the set func to assign new
  x <<- y                                     #matrix value in parent environment
  inv <<- NULL                      #if a new matrix is created, reset the value of inv to NULL
}
get <- function() x                           #get function returns the value of matrix arguement
setinverse <- function(inverse) inv <<- inverse   #assigning value of inv in parent environment
getinverse <- function() inv                  #getting the value of inv  
list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getinverse()
  if(!is.null(inv)){
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data)
  x$setinverse(inv)
  inv
}
