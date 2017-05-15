
context("Overlays")

test_that("Add two overlays", {

  bpmn_file <- system.file("examples/qr-code.bpmn", package = "bpmn")

  overlays <- list(

    overlay(
      element = "SCAN_OK",
      html = "<div style='color: red'>Mixed up the labels?</div>"
    ),
    overlay(
      element = "sid-52EB1772-F36E-433E-8F5B-D5DFD26E6F26",
      html = "<div style='color: red'>Manually?</div>",
      top = -40,
      left = -40
    )
  )

  bpmn(bpmn_file, overlays = overlays)

  w1 <- bpmn(bpmn_file)
  expect_is(w1, "htmlwidget")

})
