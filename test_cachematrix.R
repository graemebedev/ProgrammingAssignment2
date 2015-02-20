## Unit tests for cachematrix.R
##

## Create a test matrix, call makeCacheMatrix and calc the inv
## Test that a second call pulls the cached data instead of recalculating
source("cachematrix.R")
m = rbind(c(1,2), c(3,4))
cm = makeCacheMatrix(m)
s = cacheSolve(cm)
s
s = cacheSolve(cm)
s

## Now change the matrix, recalc. It should recalc, then a 2nd call should
## get it from the cache again

cm$get()
m2 = rbind(c(42,43), c(44,45))
cm$set(m2)
s = cacheSolve(cm)
s
s = cacheSolve(cm)
s

## Expected output:
##

# > ## Unit tests for cachematrix.R
#   > ##
#   > 
#   > source("cachematrix.R")
# > m = rbind(c(1,2), c(3,4))
# > cm = makeCacheMatrix(m)
# > s = cacheSolve(cm)
# calculating data for cache
# > s
# [,1] [,2]
# [1,] -2.0  1.0
# [2,]  1.5 -0.5
# > s = cacheSolve(cm)
# getting cached data
# > s
# [,1] [,2]
# [1,] -2.0  1.0
# [2,]  1.5 -0.5
# > 
#   > cm$get()
# [,1] [,2]
# [1,]    1    2
# [2,]    3    4
# > m2 = rbind(c(42,43), c(44,45))
# > cm$set(m2)
# > s = cacheSolve(cm)
# calculating data for cache
# > s
# [,1]  [,2]
# [1,] -22.5  21.5
# [2,]  22.0 -21.0
# > s = cacheSolve(cm)
# getting cached data
# > s
# [,1]  [,2]
# [1,] -22.5  21.5
# [2,]  22.0 -21.0
# > 
#   
  