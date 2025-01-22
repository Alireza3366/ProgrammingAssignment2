## Creating a special matrix object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
          ## Initializing the inverse object
          inv <- NULL
  ## Writing method to set the matrix        
 set <- function(y) {
           x <<- y
           inv <<- NULL
 }
  ## Writing method to get the matrix        
 get <- function() {
           ## Return the matrix
           y
 }

 setunverse <- function(inverse) {
            ## Method to set the inverse of the matrix 
            inv <<- inverse
  }
 getinverse <- function() {
            ## Retrun the inverse object
            inv
  ## Return a list of the methods         
 list(set = set,
      get = get,
      setinverse = setinverse,
      getinverse = getinverse)
}

cacheSolve <- function(x, ...) {
        y <- x$getinverse()
  if(!is.null(y)){
            message("getting cached data")
            return(y)
  }
## Get the matrix from our object  
data <- x$get()
## Calculate the inverse using matrix multiplication          
y <- solve(data) %*% data
## Set the inverse to the object
x$setinverse(y)
## Return the matrix
y
}
