# Linear_Regression_Tutorial
This is just a simple tutorial script to  use Linear Algebra to solve the linear
regression tutorial problem described in: https://www.youtube.com/watch?v=P8hT5nDai6A

For the Linear Algebra solution method see section 4.3 ('Least Squares Approximations') in:
[ila] G. Strang, Introduction to Linear Algebra (Fifth Edition), Wellesley - Cambridge Press, 2016


# Expected Output
julia> include("Linear_Regression.jl")
#
##########################################
#    Linear Regression
##########################################
#
Now we are going to use Linear Algebra to solve the linear regression
tutorial problem described in: https://www.youtube.com/watch?v=P8hT5nDai6A:-
================================================================================
A-matrix, with x-values as first column and 1s as second column
A:-
7×2 Array{Int64,2}:
 1  1
 2  1
 3  1
 4  1
 5  1
 6  1
 7  1


b-column-vector, of the y-values which we are trying to fit
b:-
7-element Array{Float64,1}:
  1.5
  3.8
  6.7
  9.0
 11.2
 13.6
 16.0


Calculate x_LLS, the LLS solution to Ax=b [ila Section 4.3], using x_LLS = A\b
x_LLS:-
2-element Array{Float64,1}:
  2.414285714285714
 -0.8285714285714252


Extract the slope and y-intercept from the LLS solution vector x_LLS
slope:-
2.414285714285714

y_intercept:-
-0.8285714285714252


Calculate the values on the straight-line fit
b_dash (=A*x_LLS):-
7-element Array{Float64,1}:
  1.585714285714289
  4.0000000000000036
  6.414285714285716
  8.828571428571431
 11.242857142857146
 13.657142857142858
 16.071428571428573


error_column_vector (=b-b_dash):-
7-element Array{Float64,1}:
 -0.08571428571428896
 -0.20000000000000373
  0.2857142857142838
  0.17142857142856904
 -0.04285714285714626
 -0.057142857142858716
 -0.07142857142857295


Print various error terms, to illustrate the orthogonality of the error vector:-
error_values_as_row_vector*b_dash:- -1.3788969965844444e-13
x_values_as_row_vector*error_column_vector:- -6.306066779870889e-14
one_values_as_row_vector*error_column_vector:- -1.7763568394002505e-14

