using Smoothing
using Test

@test Smoothing.binomial([1.0,2.0,3.0,4.0,5.0], 1) == [1.0,2.0,3.0,4.0,5.0] 
@test Smoothing.binomial([1.0,2.0,3.0,4.0,5.0], 3) == [1.0,2.0,3.0,4.0,5.0] 
println("Passed Smoothing of counting numbers tests (1 and 3 pass)")
@test Smoothing.binomial([0.0,2.0,4.0,6.0,4.0, 2.0, 0.0], 1) == [0.0, 2.0, 4.0, 5.0, 4.0, 2.0, 0.0] 
println("Passed Smoothing of manually created triangle pulse")
println("3 Tests passed!")
