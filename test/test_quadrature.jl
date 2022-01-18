# Test Interpolation

@testset "GaussLegendre Quadrature order 1" begin
    order = 1
    dim = 1
    point_type = :legendre
    qr_C = QuadratureRule{dim, RefLine}(point_type, order);
    qr_F = QuadratureRule{dim, RefCube}(point_type, order);
    gp_C = getpoints(qr_C)
    gp_F = getpoints(qr_F)
    gw_C = getweights(qr_C)
    println(gp_C)
    println(gw_C)
    @test typeof(gp_C) == typeof(gp_F)
    @test size(gp_C) == (order,)
    @test size(gw_C) == (order,) 
end


@testset "GaussLegendre Quadrature order 2" begin
    order = 2
    dim = 1
    point_type = :legendre
    qr_C = QuadratureRule{dim, RefLine}(point_type, order);
    qr_F = QuadratureRule{dim, RefCube}(point_type, order);
    gp_C = getpoints(qr_C)
    gp_F = getpoints(qr_F)
    gw_C = getweights(qr_C)
    println(gp_C)
    println(gw_C)
    @test typeof(gp_C) == typeof(gp_F)
    @test size(gp_C) == (order,)
    @test size(gw_C) == (order,) 
end


@testset "GaussLegendre Quadrature order 3" begin
    order = 3
    dim = 1
    point_type = :legendre
    qr_C = QuadratureRule{dim, RefLine}(point_type, order);
    qr_F = QuadratureRule{dim, RefCube}(point_type, order);
    gp_C = getpoints(qr_C)
    gp_F = getpoints(qr_F)
    gw_C = getweights(qr_C)
    println(gp_C)
    println(gw_C)
    @test typeof(gp_C) == typeof(gp_F)
    @test size(gp_C) == (order,)
    @test size(gw_C) == (order,) 
end


@testset "GaussLegendre Quadrature order 10" begin
    order = 10
    dim = 1
    point_type = :legendre
    qr_C = QuadratureRule{dim, RefLine}(point_type, order);
    qr_F = QuadratureRule{dim, RefCube}(point_type, order);
    gp_C = getpoints(qr_C)
    gp_F = getpoints(qr_F)
    gw_C = getweights(qr_C)
    println(gp_C)
    println(gw_C)
    @test typeof(gp_C) == typeof(gp_F)
    @test size(gp_C) == (order,)
    @test size(gw_C) == (order,) 
end



@testset "GaussLobbato Quadrature order 1" begin
    order = 1
    dim = 1
    point_type = :lobatto 
    qr_C = QuadratureRule{dim, RefLine}(point_type, order);
    gp_C = getpoints(qr_C)
    gw_C = getweights(qr_C)
    println(gp_C)
    println(gw_C)
    @test size(gp_C) == (order,)
    @test size(gw_C) == (order,) 
end


@testset "GaussLobbato  Quadrature order 2" begin
    order = 2
    dim = 1
    point_type = :lobatto 
    qr_C = QuadratureRule{dim, RefLine}(point_type, order);
    qr_F = QuadratureRule{dim, RefCube}(point_type, order);
    gp_C = getpoints(qr_C)
    gp_F = getpoints(qr_F)
    gw_C = getweights(qr_C)
    println(gp_C)
    println(gw_C)
    @test typeof(gp_C) == typeof(gp_F)
    @test size(gp_C) == (order,)
    @test size(gw_C) == (order,) 
end


@testset "GaussLobbato Quadrature order 3" begin
    order = 3
    dim = 1
    point_type = :lobatto 
    qr_C = QuadratureRule{dim, RefLine}(point_type, order);
    qr_F = QuadratureRule{dim, RefCube}(point_type, order);
    gp_C = getpoints(qr_C)
    gp_F = getpoints(qr_F)
    gw_C = getweights(qr_C)
    println(gp_C)
    println(gw_C)
    @test typeof(gp_C) == typeof(gp_F)
    @test size(gp_C) == (order,)
    @test size(gw_C) == (order,) 
end


@testset "GaussLegendre Quadrature order 3" begin
    order = 10
    dim = 1
    point_type = :lobatto
    qr_C = QuadratureRule{dim, RefLine}(point_type, order);
    qr_F = QuadratureRule{dim, RefCube}(point_type, order);
    gp_C = getpoints(qr_C)
    gp_F = getpoints(qr_F)
    gw_C = getweights(qr_C)
    println(gp_C)
    println(gw_C)
    @test typeof(gp_C) == typeof(gp_F)
    @test size(gp_C) == (order,)
    @test size(gw_C) == (order,) 
end