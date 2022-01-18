# Gauss quadrature
import Ferrite: QuadratureRule
import FastGaussQuadrature: gausslegendre, gausslobatto
import Base.Cartesian: @nloops, @nref, @ntuple, @nexprs


# Generate Gauss quadrature rules on Lines
for dim in (1)
    @eval begin
        function (::Type{QuadratureRule{$dim,RefLine}})(quad_type::Symbol, order::Int)
            if quad_type == :legendre
                p, w = gausslegendre(order)
            elseif quad_type == :lobatto
                if order == 1 
                    p, w = gausslegendre(order) 
                else
                    p, w = gausslobatto(order) 
                end
            else
                throw(ArgumentError("unsupported quadrature rule"))
            end
            weights = Vector{Float64}(undef, order^($dim))
            points  = Vector{Vec{$dim,Float64}}(undef, order^($dim))
            count = 1
            @nloops $dim i j->(1:order) begin
                t = @ntuple $dim q-> p[$(Symbol("i"*"_q"))]
                points[count] = Vec{$dim,Float64}(t)
                weight = 1.0
                @nexprs $dim j->(weight *= w[i_{j}])
                weights[count] = weight
                count += 1
            end
            return QuadratureRule{$dim,RefLine,Float64}(weights, points)
        end
    end
end