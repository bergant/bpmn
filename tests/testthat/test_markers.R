
context("Markers")

test_that("Add two markers", {

  bpmn_file <- system.file("examples/qr-code.bpmn", package = "bpmn")

  markers <- list(

    marker(
      element = "SCAN_OK",
      class_name = "test1"
    ),
    marker(
      element = "SCAN_OK",
      class_name = "test2"
    )
  )

  w1 <- bpmn(bpmn_file, markers = markers)
  expect_is(w1, "htmlwidget")

})
