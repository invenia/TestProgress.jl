module TestProgress

export LoudTestSet

using Test
using Test: AbstractTestSet, DefaultTestSet, Pass, finish, record

const DOT = '•'

struct LoudTestSet{T<:AbstractTestSet} <: AbstractTestSet
    wrapped::T

    LoudTestSet{T}(desc) where T = new(T(desc))
end

LoudTestSet(desc::AbstractString) = LoudTestSet{DefaultTestSet}(desc)

Test.record(ts::LoudTestSet, res) = record(ts.wrapped, res)
function Test.record(ts::LoudTestSet, res::Pass)
    printstyled(DOT, color=:green)
    record(ts.wrapped, res)
    return res
end

function Test.finish(ts::LoudTestSet)
    # TODO: only print nested testsets up to some maximum depth?
    printstyled("\nFinished " * ts.wrapped.description, color=:cyan)
    print("\n")
    finish(ts.wrapped)
end

end  # module
