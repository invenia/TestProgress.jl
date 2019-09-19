using Suppressor: @capture_out
using Test
using TestProgress
using TestProgress: DOT

# Needs to be outside of the `@testset`s to test `LoudTestSet` bneing applied at top scope
output = @capture_out begin
    @testset LoudTestSet "top-level" begin
        @testset "nested 1" begin
            @test true
            @test 2 == 2
        end
        @testset "nested 2" begin
            @test true
            @test 2 == 2
            @test 3 == 3
        end
    end  # testset
end

@testset "TestProgress.jl" begin
    @test DOT == '•' == '\u2022'

    # Should see passing test before any testset ends
    @test output[1] == DOT

    # Should still print the usual summary
    @test occursin("Test Summary", output)

    lines = split(output, '\n')
    # Should have the a DOT for every passing test in "nested 1"
    @test lines[1] == DOT^2

    # Should see the testset finish before anymore tests
    @test startswith(lines[2], "Finished ")

    # Should be the "nested 1" testset that finishes first
    @test occursin("nested 1", lines[2])

    # Should have the a DOT for every passing test in "nested 2"
    @test lines[3] == DOT^3
end
