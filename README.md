# Smoothing.jl
A package to smooth time series data in Julia. <br>
Currently v1.0 only includes binomial smoothing.

Takes a 1d data array and smooths the data with a 2Nₚ+1 binomial filter.
This is computed using the method outlined in :<br>

*Binomial smoothing filter: A way to avoid some pitfalls of least‐squares
polynomial smoothing* <br>
in Review of Scientific Instruments 54, 1034 (1983);
https://doi.org/10.1063/1.1137498 <br>

The filter preserves the values starting
and ending values of the initial data set. 

### Example (you can easily manually verify my_data's smoothing is correct.)

Usage:

```julia-repl
julia> using Smoothing
julia> my_data = [1.0, 2.0, 3.0, 4.0, 5.0]
julia> Smoothing.binomial(my_data, 1)

5-element Vector{Float64}:
 1.0
 2.0
 3.0
 4.0
 5.0
```
