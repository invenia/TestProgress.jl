# TestProgress

[![Build Status](https://travis-ci.com/invenia/TestProgress.jl.svg?branch=master)](https://travis-ci.com/invenia/TestProgress.jl)
[![Codecov](https://codecov.io/gh/invenia/TestProgress.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/invenia/TestProgress.jl)

Letting you know your tests are making progress, by printing a green dot • every time a test passes, and announcing when a `@testset` is finished:

```julia
julia> using Test

julia> using TestProgress

julia> @testset LoudTestSet "top-level tests" begin
           @testset "2nd-level tests 1" begin
               @test true
               @test 1 == 1
               @testset "3rd-level tests" begin
                   @test true
               end
               @test true
           end
           @testset "2nd-level tests 2" begin
               @test true
               @test 1 == 1
           end
       end
•••
Finished 3rd-level tests
•
Finished 2nd-level tests 1
••
Finished 2nd-level tests 2

Finished top-level tests
Test Summary:   | Pass  Total
top-level tests |    6      6
Test.DefaultTestSet("top-level tests", Any[Test.DefaultTestSet("2nd-level tests 1", Any[Test.DefaultTestSet("3rd-level tests", Any[], 1, false)], 3, false), Test.DefaultTestSet("2nd-level tests 2", Any[], 2, false)], 0, false)
```
