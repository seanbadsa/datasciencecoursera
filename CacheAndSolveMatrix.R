##makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  set<-function(y){
  x<<-y
  m<<-NULL
}
get<-function() x
setmatrix<-function(solve) m<<- solve
getmatrix<-function() m
list(set=set, get=get,
   setmatrix=setmatrix,
   getmatrix=getmatrix)
}

##cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
##If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache

cacheSolve <- function(vm=matrix(), ...) {
## Return a matrix that is the inverse of 'x'
    m<-vm$getmatrix()
    if(!is.null(m)){
      message("Getting cached matrix data")
      return(m)
    }
   	matrix <- vm$get() 
    m<-solve(matrix, ...)
    vm$setmatrix(m)
    m
}
