#####################################################################################
# This is just a simple tutorial script to  use Linear Algebra to solve the linear
# regression tutorial problem described in: https://www.youtube.com/watch?v=P8hT5nDai6A
#
# For the Linear Algebra solution method see section 4.3 ('Least Squares Approximations') in:
# [ila] G. Strang, Introduction to Linear Algebra (Fifth Edition), Wellesley - Cambridge Press, 2016
#
# N.B. for block commenting/ uncommenting, it is ctrl-/
#
# By DDNB, 2023
#

#
# Use/import stuff
#using LinearAlgebra   # Not needed for the simple Linear Algebra we are doing here, but maybe needed
                        # for more sophisticated functionality (e.g. QR decompositions etc.)

#
# Linear Regression
println("#")
println("##########################################")
println("#    Linear Regression")
println("##########################################")
println("#")

println("Now we are going to use Linear Algebra to solve the linear regression\ntutorial problem described in: https://www.youtube.com/watch?v=P8hT5nDai6A:-")
println("================================================================================")
A=[1 1; 2 1; 3 1; 4 1; 5 1; 6 1; 7 1]  # x-values (i.e. x^1) as first column, 1s (i.e. x^0) as second column
b=[1.5; 3.8; 6.7; 9.0; 11.2; 13.6; 16.0]  # The y-values which we are trying to fit

println("A-matrix, with x-values as first column and 1s as second column")
println("A:- ")
display(A)
println()
println() # To pretty-up the formatting

println("b-column-vector, of the y-values which we are trying to fit")
println("b:- ")
display(b)
println()
println() # To pretty-up the formatting

println("Calculate x_LLS, the LLS solution to Ax=b [ila Section 4.3], using x_LLS = A\\b")
x_LLS = A\b   # i.e. use Julia's Linear Algebra smarts to calculate the LLS solution to Ax=b
println("x_LLS:- ")
display(x_LLS)
println()
println() # To pretty-up the formatting

#
# Extract the slope and y-intercept from the LLS solution vector x_LLS
println("Extract the slope and y-intercept from the LLS solution vector x_LLS")
slope=x_LLS[1]  # The first element in x_LLS is the slope of the straight-line fit
println("slope:- ")
display(slope)
println()
y_intercept=x_LLS[2]  # The second element in x_LLS is the y-intercept of the straight-line fit
println("y_intercept:- ")
display(y_intercept)
println()
println() # To pretty-up the formatting

#
# Calculate the values on the straight-line fit
println("Calculate the values on the straight-line fit")
b_dash=A*x_LLS    # This is the straight-line linear regression solution, with slope and y_intercept as calculated above
println("b_dash (=A*x_LLS):- ")
display(b_dash)
println()
println() # To pretty-up the formatting

#
# Calculate error (which should be minimal possible in the least-squares sense)
error_column_vector=b-b_dash
println("error_column_vector (=b-b_dash):- ")
display(error_column_vector)
println()
println() # To pretty-up the formatting

#
# Now we are going to illustrate how the LLS solution gives an error
# vector which is orthogonal to the column space of A, and therefore
# also orthogonal to the LLS solution (the values of the straight line
# fit, which we term 'b_dash'), which also must lie in the column space of A
println("Print various error terms, to illustrate the orthogonality of the error vector:-")
error_values_as_row_vector = transpose(error_column_vector)
println("error_values_as_row_vector*b_dash:- ", error_values_as_row_vector*b_dash)
x_values_as_row_vector = A[:,1]'
one_values_as_row_vector = A[:,2]'
println("x_values_as_row_vector*error_column_vector:- ", x_values_as_row_vector*error_column_vector)
println("one_values_as_row_vector*error_column_vector:- ", one_values_as_row_vector*error_column_vector)
println() # To pretty-up the formatting

