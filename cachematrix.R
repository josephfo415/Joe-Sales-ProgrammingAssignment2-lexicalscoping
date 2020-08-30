## makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse
## cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache

## This function creares a matrix that can store in-memory its matrix inverse.  It returns a list that 
## 1. Sets the matrix
## 2. Gets the matrix
## 3.  Sets the inverse
## 4. Gets the inverse

makeCacheMatrix <- function(x = matrix()) {

      inverse = NULL
    
      set = function (y) {
        x <<- y
## lexical scoping to assign value to y in an environment different from parent
## environment but retreivable from parent environment
        inverse <<-  NULL
    }
    get = function () x
    
    setmatrixinverse = function (matrixinverse) inverse <<- matrixinverse
    
    getmatrixinverse = function () inverse
    
    list(set=set, get=get, setmatrixinverse=setmatrixinverse, getmatrixinverse= getmatrixinverse)
    
}
## Returns the inverse of the original matrix input to makeCacheMatrix, x is
## output of makeCacheMatrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
      matrixinverse = x$getmatrixinverse
      
##    if the inverse has already been calculated
      
      if (!is.null(inverse)) {
          ## get inverse from the cache and skip computation
          message ("getting cached data")
          return (inverse)
      }
##   otherwise, calculates the inverse
     mat.dat = x$get ()
     inverse = solve (mat.data, ...) 
     
##   sets the value of the inverse in the cache through the setmatrixinverse function
     
      x$setmatrixinverse (inverse)
      
      return (inverse)
}
