
context("Elements")

test_that("View from file", {
  bpmn_file <- system.file("examples/qr-code.bpmn", package = "bpmn")

  df1 <- bpmn_get_elements(xml2::read_xml(bpmn_file))

  expect_is(df1, "data.frame")
  expect_named(df1, c("type", "name", "id"))
  expect_length(df1$id, n = 14)

})
