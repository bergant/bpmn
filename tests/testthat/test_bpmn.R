
context("Create simple BPMN widget")

test_that("From file", {

  bpmn_file <- system.file("examples/qr-code.bpmn", package = "bpmn")
  w1 <- bpmn(bpmn_file)
  expect_is(w1, "htmlwidget")
})

test_that("From XML", {

  bpmn_file <- system.file("examples/qr-code.bpmn", package = "bpmn")
  xml <- xml2::read_xml(bpmn_file)
  w1 <- bpmn(xml)
  expect_is(w1, "htmlwidget")
})

test_that("From XML string", {

  bpmn_file <- system.file("examples/qr-code.bpmn", package = "bpmn")
  xml <- xml2::read_xml(bpmn_file)
  xml_string <- as.character(xml)
  w1 <- bpmn(xml_string)
  expect_is(w1, "htmlwidget")
})

