## makeCacheMatrix: This function creates a special "matrix" object that can 
## cache its inverse.
## cacheSolve: This function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above. If the inverse has already been calculated 
## (and the matrix has not changed), then the cachesolve should retrieve the 
## inverse from the cache

## This function creates a matrix that can store in-memory its matrix inverse. 
## creates a list
##It returns a list that 
## 1. Sets the matrix
## 2. Gets the matrix
## 3.  Sets the inverse
## 4. Gets the inverse
## This list is an input to cache(Solve)

makeCacheMatrix <- function(x = matrix()) {

      inverse = NULL
    
      set = function (y) {
        x <<- y
## This is where lexical scoping is used to assign value to y in an environment different from parent
## environment but retreivable from parent environment.   The <<- assign operator 
## is in the function environment but can be used in the parent environment too
        inverse <<-  NULL
    }
    get = function () x
    
    setmatrixinverse = function (matrixinverse) inverse <<- matrixinverse
    
    getmatrixinverse = function () inverse
    
    list(
      set=set, 
      get=get, 
      setmatrixinverse=setmatrixinverse, 
      getmatrixinverse= getmatrixinverse)
    
}
## Returns the inverse of the original matrix input to makeCacheMatrix, x is
## output of makeCacheMatrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
      inverse = x$getmatrixinverse
      
##    if the inverse has already been calculated
      
      if (!is.null(inverse)) {
          ## get inverse from the cache and skip computation
          message ("getting cached data")
          return (inverse)
      }
##   otherwise, calculates the inverse using solve function
     mat.dat = x$get ()
     inverse = solve (mat.data, ...) 
     
####   sets the value of the inverse in the cache through the setmatrixinverse
  ##   function
     
      x$setmatrixinverse (inverse)
      
      return (inverse)
}



