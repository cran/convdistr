# Test for distributions
# 20181027 by JJAV
# # # # # # # # # # # # # #

context("Test distributions")

test_that("new_UNIFORM works fine", {
  myDistr <- new_UNIFORM(0,1)
  expect_s3_class(myDistr, "UNIFORM")
  expect_s3_class(myDistr, "DISTRIBUTION")
  expect_equivalent(myDistr$oval , 0.5)
  expect_silent(myDistr$rfunc(1))

})

test_that("new_NORMAL works fine", {
  myDistr <- new_NORMAL(0,1)
  expect_s3_class(myDistr, "NORMAL")
  expect_s3_class(myDistr, "DISTRIBUTION")
  expect_equivalent(myDistr$oval ,0)
  expect_silent(myDistr$rfunc(1))

})

test_that("new_BETA works fine" ,{
  myDistr <- new_BETA(1,1)
  expect_s3_class(myDistr, "BETA")
  expect_s3_class(myDistr, "DISTRIBUTION")
  expect_equivalent(myDistr$oval ,0.5)
  expect_silent(myDistr$rfunc(1))

})


test_that("new_DISCRETE works fine" ,{
  myDistr <- new_DISCRETE(c(1,2,3))
  expect_s3_class(myDistr, "DISCRETE")
  expect_s3_class(myDistr, "DISTRIBUTION")
  expect_equivalent(myDistr$oval ,2)
  expect_silent(myDistr$rfunc(1))


  myDistr2 <- new_DISCRETE(c(1,2,3), c(0.1,0.8,0.1))
  expect_s3_class(myDistr2, "DISCRETE")
  expect_s3_class(myDistr2, "DISTRIBUTION")
  expect_equivalent(myDistr2$oval ,2)
  expect_silent(myDistr2$rfunc(1))

})


test_that("new_NA works fine" ,{
  myDistr <- new_NA()
  expect_s3_class(myDistr, "NA")
  expect_s3_class(myDistr, "DISTRIBUTION")
  expect_true(is.na(myDistr$oval))
  expect_silent(myDistr$rfunc(1))

  myDistr2 <- new_NA(c("dimension1","dimension2"))
  expect_s3_class(myDistr2, "NA")
  expect_s3_class(myDistr2, "DISTRIBUTION")
  expect_length(myDistr2$oval,2)
  expect_true(is.na(myDistr2$oval[1]))
  expect_true(is.na(myDistr2$oval[2]))
  expect_equal(names(myDistr2$oval), c("dimension1","dimension2"))
  expect_silent(myDistr2$rfunc(1))

})


test_that("new_TRUNCATED works fine", {
  myDistr <- new_TRUNCATED(new_NORMAL(0,1),-0.5,0.5)
  expect_s3_class(myDistr, "TRUNCATED")
  expect_s3_class(myDistr, "NORMAL")
  expect_s3_class(myDistr, "DISTRIBUTION")
  expect_silent(myDistr$rfunc(1))
  vecrand <- myDistr$rfunc(1000)
  expect_true(all(vecrand >= -0.5))
  expect_true(all(vecrand <= 0.5))
})

test_that("new_TRIANGULAR works fine" , {
  myDistr <- new_TRIANGULAR(-1,1,0)
  expect_s3_class(myDistr, "TRIANGULAR")
  expect_s3_class(myDistr, "DISTRIBUTION")
  expect_equivalent(myDistr$oval, 0)
  expect_silent(myDistr$rfunc(1))
  expect_error(new_TRIANGULAR(1,2,3))
  expect_error(new_TRIANGULAR(2,1,1.5))
  expect_silent(new_TRIANGULAR(1,2,2))
  expect_silent(new_TRIANGULAR(1,2,1))
})

test_that("new_BETA_lci works fine" , {
  myDistr <- new_BETA_lci(0.5,0.4,0.6)
  expect_s3_class(myDistr, "BETA")
  expect_s3_class(myDistr, "DISTRIBUTION")
  expect_equivalent(myDistr$oval, 0.5)
  expect_silent(myDistr$rfunc(1))
  expect_error(new_BETA_lci(5,4,6))
  expect_error(new_BETA_lci(-0.5,0.4,0.6))
  expect_error(new_BETA_lci(0.5,0.6,0.7))
  expect_error(new_BETA_lci(0.5,0.6,0.4))
})

test_that("new_POISSON works fine",{
  myDistr <- new_POISSON(5)
  expect_s3_class(myDistr, "POISSON")
  expect_s3_class(myDistr, "DISTRIBUTION")
  expect_equivalent(myDistr$oval, 5)
  expect_silent(myDistr$rfunc(1))
  expect_error(new_POISSON(-1))
})


test_that("new_EXPONENTIAL works fine",{
  myDistr <- new_EXPONENTIAL(1/40)
  expect_s3_class(myDistr, "EXPONENTIAL")
  expect_s3_class(myDistr, "DISTRIBUTION")
  expect_equivalent(myDistr$oval, 40)
  expect_silent(myDistr$rfunc(1))
  expect_error(new_EXPONENTIAL(-1))
})


test_that("new_DIRCHLET works fine", {
  myDistr <- new_DIRICHLET(c(0.2, 0.3, 0.5))
  expect_s3_class(myDistr, "DIRICHLET")
  expect_s3_class(myDistr, "DISTRIBUTION")
  expect_equivalent(myDistr$oval, c(0.2, 0.3, 0.5))
  expect_silent(myDistr$rfunc(1))
  myDistr <- new_DIRICHLET(c(0.2, 0.3, 0.5), c("A", "B", "C"))
  expect_equal(myDistr$oval, c(A = 0.2, B = 0.3, C = 0.5))
})

test_that("new_DIRCHLET works with ceros", {
  myDistr <- new_DIRICHLET(c(0.5, 0, 0.5))
  expect_s3_class(myDistr, "DIRICHLET")
  expect_s3_class(myDistr, "DISTRIBUTION")
  expect_equivalent(myDistr$oval, c(0.5, 0.0, 0.5))
  expect_silent(myDistr$rfunc(1))
  expect_equivalent(myDistr$rfunc(2)[,2],c(0,0))
})

test_that("new_BINOMIAL works fine",{
  myDistr <- new_BINOMIAL(1000, 0.3)
  expect_s3_class(myDistr, "BINOMIAL")
  expect_s3_class(myDistr, "DISTRIBUTION")
  expect_equivalent(myDistr$oval, 300)
  expect_silent(myDistr$rfunc(1))
})

test_that("new_MULTINORMAL works fine", {
  Sigma = matrix(c(1,0.5,0,0.5,1,0,0,0,1), ncol = 3)
  myDistr <- new_MULTINORMAL(c(0,0,10), Sigma, c("A","B","C"))
  expect_equivalent(myDistr$oval , c(0,0,10))
  mycov <- cov(rfunc(myDistr,10000))
  dif <- abs(Sigma - mycov)
  expect_true(all(dif < 0.05))
})


test_that("new_DIRAC multidiimensions",{
  myDistr <- new_DIRAC(c(1,2,3), c("dim1","dim2","dim3"))
  expect_s3_class(myDistr, "DIRAC")
  expect_s3_class(myDistr, "DISTRIBUTION")
  expect_equivalent(myDistr$oval, c(1,2,3))
  expect_equivalent(myDistr$rfunc(1), c(1,2,3))
})

test_that("BETABINOMIAL distributions", {
  d1 <- new_BETABINOMIAL(10,5.6,1.4)
  d2 <- new_BETABINOMIAL_od(10,0.8,7)
  d3 <- new_BETABINOMIAL_icc(10,0.8,0.125)
  expect_equivalent(d1$oval, d2$oval)
  expect_equivalent(d1$oval, d3$oval)
  expect_true(rfunc(d1,1) >= 0 & rfunc(d1,1) <= 10)
})
