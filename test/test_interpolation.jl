# Test Interpolation
@testset "lagrange order 2" begin
    order = 2
    ip = Lagrange{1,RefLine,order}()
    bf = getnbasefunctions(ip)
    nv = CGMethod1D.nvertexdofs(ip)
    @test isapprox(bf, order+1, atol=1e-8)
    @test isapprox(nv, 1, atol=1e-8) 
end


@testset "lagrange order 3" begin
    order = 2
    ip = Lagrange{1,RefLine,order}()
    bf = getnbasefunctions(ip)
    nv = CGMethod1D.nvertexdofs(ip)
    @test isapprox(bf, order+1, atol=1e-8)
    @test isapprox(nv, 1, atol=1e-8) 
end


@testset "value order 1" begin
    order = 1
    ip = Lagrange{1,RefLine,order}()
    i1 = 1
    i2 = 2
    ξ = Vec{1}((-1.0,))
    N1 = value(ip, i1, ξ)
    N2 = value(ip, i2, ξ)
    println("N1:$N1; N2:$N2")
    @test isapprox(N1+N2, 1, atol=1e-8) 
end


@testset "value order 2" begin
    order = 2
    ip = Lagrange{1,RefLine,order}()
    i1 = 1
    i2 = 2
    i3 = 3
    ξ = Vec{1}((0.5,))
    N1 = value(ip, i1, ξ)
    N2 = value(ip, i2, ξ)
    N3 = value(ip, i3, ξ)
    println("N1:$N1; N2:$N2; N3:$N3")
    @test isapprox(N1+N2+N3, 1, atol=1e-8) 
end


@testset "reference_coordinates order 1" begin
    order = 1; n = order+1;
    ip = Lagrange{1,RefLine,order}()
    coords = reference_coordinates(ip)
    println(coords)
    ξ_vec = collect(range(-1, stop=1, length=n))
    for (idx,val) in enumerate(ξ_vec)
        @test coords[idx][1] in ξ_vec
    end 
    @test coords[1][1] == -1.0
    @test coords[2][1] == 1.0
    @test issorted(coords[3:end-1])
end


@testset "reference_coordinates order 2" begin
    order = 2; n = order+1;
    ip = Lagrange{1,RefLine,order}()
    coords = reference_coordinates(ip)
    println(coords)
    ξ_vec = collect(range(-1, stop=1, length=n))
    for (idx,val) in enumerate(ξ_vec)
        @test coords[idx][1] in ξ_vec
    end 
    @test coords[1][1] == -1.0
    @test coords[2][1] == 1.0
    @test issorted(coords[3:end-1])
end


# @testset "faces order 1" begin
#     order = 1
#     ip = Lagrange{1,RefLine,order}()
#     fa = faces(ip)
#     println(fa) 
# end


# @testset "faces order 2" begin
#     order = 5
#     ip = Lagrange{1,RefLine,order}()
#     fa = faces(ip)
#     println(fa) 
# end

