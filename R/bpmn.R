#' BPMN diagram
#'
#' Display BPMN diagram based on BPMN definition in XML format
#'
#' @param  process A file name or xml document or string in BPMN XML format
#' @param  overlays A list of elements to be added to the diagram's existing
#'   elements. Use overlay function to create a proper structure with content
#'   and relative position.
#' @param  width Fixed width for widget (in css units). The default is NULL,
#'   which results in intelligent automatic sizing based on the widget's
#'   container.
#' @param  height Fixed height for widget (in css units). The default is NULL,
#'   which results in intelligent automatic sizing based on the widget's
#'   container.
#' @param  elementId element id
#' @export
bpmn <- function(
  process, overlays = NULL,
  width = NULL, height = NULL, elementId = NULL) {

  if(inherits(process, "xml_document")) {
    process <- as.character(process)
  }
  else if(inherits(process, "character") &&
     substring(process, 1, 38) !=
     "<?xml version=\"1.0\" encoding=\"UTF-8\"?>") {
    # this must be a file name
    xml <- xml2::read_xml(process)
    process <- as.character(xml)
  }

  # widget parameters
  x <- list(
    bpmn_model = process
  )
  if(length(overlays)) {
    x$overlays <- overlays
  }

  # create widget
  htmlwidgets::createWidget(
    name = 'bpmn',
    x,
    width = width,
    height = height,
    package = 'bpmn',
    elementId = elementId,
    sizingPolicy = htmlwidgets::sizingPolicy(
      padding = 0,
      browser.fill = TRUE,
      knitr.figure = TRUE
    )
  )
}

#' Shiny bindings for bpmn
#'
#' Output and render functions for using bpmn within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a bpmn
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name bpmn-shiny
#'
#' @export
bpmnOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(
    outputId, 'bpmn', width, height, package = 'bpmn')
}

#' @rdname bpmn-shiny
#' @export
renderBpmn <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, bpmnOutput, env, quoted = TRUE)
}

not_null_list <- function(...) {
  ret <- list(...)
  ret[lengths(ret) == 0] <- NULL
  ret
}

#' Overlay
#'
#' A list of overlays can be added to existing elements in the diagram. See
#' \code{overlays} argument in \code{\link{bpmn}} function. Use this structure
#' to create correct overlay structure.
#'
#' @param element The shape (bpmn element) to which the overlay will be attached
#' @param html HTML element to use as an overlay to use as an overlay
#' @param type Optional type to assign to the overlay
#' @param left Where to attach the overlay, relative to element bbox left
#'   attachment
#' @param right Where to attach the overlay, relative to element bbox right
#'   attachment
#' @param top Where to attach the overlay, relative to element bbox top
#'   attachment
#' @param bottom where to attach the overlay, relative to element bbox bottom
#'   attachment
#' @param min_zoom minimal zoom level to show the overlay
#' @param max_zoom maximum zoom level to show the overlay
#'
#' @return An overlay object
#'
#' @export
overlay <- function(
  element,
  html,
  type = "note",
  left = NULL,
  right = NULL,
  top = NULL,
  bottom = NULL,
  min_zoom = NULL,
  max_zoom = NULL) {

  ret <-
    not_null_list(
      element = element,
      type = type,
      overlay = not_null_list(
        html = html,
        show = not_null_list(
          minZoom = min_zoom,
          maxZoom = max_zoom
        ),
        position = not_null_list(
          left = left,
          top = top,
          bottom = bottom,
          right = right
        )
      )
    )
  if(is.null(ret$overlay$position)) {
    ret$overlay$position <- list(bottom = 0, right = 0)
  }
  class(ret) <- c("bpmn_overlay", "list")
  ret
}

#' Get BPMN elements
#'
#' @param xml A BPMN document
#' @param model_ns A namespace for BPMN document
#'
#' @return A data frame with (at most): type, name and id
#' @export
bpmn_get_elements <- function(
  xml,
  model_ns = "http://www.omg.org/spec/BPMN/20100524/MODEL") {

  process <- xml2::xml_find_all(xml, "//model:process", c(model=model_ns) )
  elements_xml <- xml2::xml_children(process)

  bpmn_elements <- data.frame(
    type = xml2::xml_name(elements_xml),
    name = xml2::xml_attr(elements_xml, attr = "name"),
    id = xml2::xml_attr(elements_xml, attr = "id"),
    stringsAsFactors = FALSE
  )
}
