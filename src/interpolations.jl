# Interpolation Lagrange


#Lagrange Polynomial 1D
function lagrangePoly(order::Int, i::Int, ξ::Float64)
    n = order+1
   
    ξ_vec = collect(range(-1, stop=1, length=n))
    if order != 1
        ξ_vec = [ξ_vec[1];ξ_vec[end];ξ_vec[2:end-1]]
    end

    Li = 1
    ξi = ξ_vec[i]
    for j=1:n
        ξj = ξ_vec[j]
        if i!=j
            Li *= (ξ - ξj)/(ξi - ξj)
        end
    end
    Li
end

##################################
# Lagrange dim 1 RefLine order>1 #
##################################
using Ferrite
import Ferrite: getnbasefunctions, nvertexdofs, faces, reference_coordinates, value


# shape
struct RefLine <: Ferrite.AbstractRefShape end


# Lagrange {dim,shape,order} -> dim=1, shape=RefLine , order >= 1
getnbasefunctions(::Lagrange{1,RefLine,order}) where {order} = order+1  #
nvertexdofs(::Lagrange{1,RefLine,order}) where {order} = 1  # 
ncelldofs(::Lagrange{1,RefLine,order}) where {order} = 1  #
faces(::Lagrange{1,RefLine,order}) where {order} = ((1,), (2,)) #tuple([(i,) for i in 1:order+1]...)


function reference_coordinates(::Lagrange{1,RefLine,order}) where {order}
    n=order+1
    ξ_vec = collect(range(-1, stop=1, length=n))
    if order != 1
        ξ_vec = [ξ_vec[1];ξ_vec[end];ξ_vec[2:end-1]]
    end
    return [Vec{1, Float64}((ξ_vec[i],)) for i in 1:n]
end


function value(ip::Lagrange{1,RefLine,order}, i::Int, ξ::Vec{dim}) where {dim,order}
    ξ_x = ξ[1]
    return lagrangePoly(order, i, ξ_x)
    throw(ArgumentError("no shape function $i for interpolation $ip"))
end
