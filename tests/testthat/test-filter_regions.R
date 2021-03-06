context("tests filter_regions")

#load example data objects
#contains cm, cm_new, pheno, and regiondata
data(sysdata, package='phenopredict')

number=5
inputdata = filter_regions(expression=cm[1:10,1:10], regiondata=regiondata[1:10] ,phenodata=pheno[1:10,], phenotype="AGE", covariates=NULL,type="numeric", numRegions=number)

test_that("if filter_regions() output are correct class", {
  expect_is(inputdata$regiondata, 'GRanges')
  expect_is(inputdata$covmat, 'matrix')
  expect_is(inputdata$regioninfo, 'data.frame')
})

test_that("output has expected dimensions", {
  expect_equal(length(inputdata$regiondata), nrow(inputdata$covmat))
  expect_equal(nrow(inputdata$covmat), nrow(inputdata$regioninfo))
  expect_equal(nrow(inputdata$covmat), number)
})