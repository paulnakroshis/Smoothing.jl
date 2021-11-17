module Smoothing

export binomial
"""
    binomial(data::Vector{any}, Nₚ::Int)

Takes a 1d data array and smooths the data with a 2Nₚ+1 binomial filter.
This is computed using the method outlined in :<br>

*Binomial smoothing filter: A way to avoid some pitfalls of least‐squares
polynomial smoothing* in Review of Scientific Instruments 54, 1034 (1983);
https://doi.org/10.1063/1.1137498 <br>

or see <br>
https://aip.scitation.org/doi/abs/10.1063/1.1137498

The method implements a 2Nₚ+1 binomial filter by Nₚ passes of the three point
binomial filter; and this is computationally implemented by two passess of the
{1,1}/2 smoothing implemented below. The filter preserves the values starting
and ending values of the initial data set. 

# Examples (you can easily manually verify data1's smoothing is correct.)
```julia-repl
julia> data1 = [1.0, 2.0, 3.0, 4.0, 5.0]
julia> data2 = [3.0, 6.0, 1.0, 4.0, 0.0]
julia> binomial(data1, 1)

5-element Vector{Float64}:
 1.0
 2.0
 3.0
 4.0
 5.0

julia> binomial(data2, 20)

5-element Vector{Float64}:
 3.0
 2.3162835515104234
 1.5937387603335083
 0.8162830746732652
 0.0
```
"""
function binomial(data::Vector, Nₚ::Int)
    y = data
    for pass in 1:Nₚ
        x = zeros(length(data))

        for i in 1:length(y)
            if i==1
                x[i] = (y[i] + y[i+1])/2.0
            elseif i>1 && i<length(y)
                x[i] = (y[i] + y[i+1])/2.0
            end
        end

        y = zeros(length(data))

        for j in 1:length(x)
            if j==1
                y[j] = data[j]
            elseif j>1 && j<length(x)
                y[j] = (x[j-1] + x[j])/2.0
            else
                y[j] = data[j]
            end
        end

    end

    return y
end

end # module
