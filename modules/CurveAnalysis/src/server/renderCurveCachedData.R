# The next line is used by PrepareConfigFiles to include this file as a route in rapache, do not modify unless you intend to modify rapache routes (it can be anywhere in the files though)
# ROUTE: /curve/render/dr-cache
# MEMORY_LIMIT_EXEMPT

library(data.table)
renderCurve <- function(getParams) {
  # Redirect to Curator if applicable
  redirectInfo <- racas::api_get_curve_curator_url(getParams$curveIds, getParams$inTable, globalConnect = TRUE)
  if(redirectInfo$shouldRedirect == TRUE) {
    setHeader("Location", redirectInfo$url)
    return(HTTP_MOVED_TEMPORARILY)
    DONE
  }
  # Parse GET Parameters
  parsedParams <- racas::parse_params_curve_render_dr(getParams)
  
  # GET Cached Curve Data
  data <- racas::get_cached_fit_data_curve_id(parsedParams$curveIds, globalConnect = TRUE)
  data$parameters <- unique(data$parameters)
  if("category" %in% names(data$parameters)) {
    data$parameters <- data$parameters[category %chin%  c("inactive","potent"), c("fittedmax", "fittedmin") := {
      cid <- curveId
      pts <- data$points[curveId == cid]
      responseMean <- mean(pts[userFlagStatus!="knocked out" & preprocessFlagStatus!="knocked out" & algorithmFlagStatus!="knocked out" & tempFlagStatus!="knocked out",]$response)
      list("fittedmax" = responseMean, "fittedmin" = responseMean)
    }, by = curveId]
  }
  
  data$parameters <- as.data.frame(data$parameters)
  data$points <- as.data.frame(data$points)
  
  #To be backwards compatable with hill slope example files
  hillSlopes <- which(!is_null_or_na(data$parameters$hillslope))
  if(length(hillSlopes) > 0  ) {
    data$parameters$slope <- -data$parameters$hillslope[hillSlopes]
  }
  fittedHillSlopes <- which(!is_null_or_na(data$parameters$fitted_hillslope))
  if(length(fittedHillSlopes) > 0 ) {
    data$parameters$fitted_slope <- -data$parameters$fitted_hillslope[fittedHillSlopes]
  }
  
  #Get Protocol Curve Display Min and Max for first curve in list
  if(any(is.na(parsedParams$yMin),is.na(parsedParams$yMax))) {
    protocol_display_values <- list(ymax = data$parameters[1,]$curvedisplaymax, ymin = data$parameters[1,]$curvedisplaymin)
    plotWindowPoints <- data$points[!data$points$userFlagStatus == "knocked out" & !data$points$preprocessFlagStatus == "knocked out" & !data$points$algorithmFlagStatus == "knocked out",]
    if(nrow(plotWindowPoints) == 0) {
      plotWindow <- racas::get_plot_window(data$points)      
    } else {
      plotWindow <- racas::get_plot_window(plotWindowPoints)      
    }
    plotWindow <- racas::get_plot_window(data$points[!data$points$userFlagStatus == "knocked out" & !data$points$preprocessFlagStatus == "knocked out" & !data$points$algorithmFlagStatus == "knocked out",])
    recommendedDisplayWindow <- list(ymax = max(protocol_display_values$ymax,plotWindow[2], na.rm = TRUE), ymin = min(protocol_display_values$ymin,plotWindow[4], na.rm = TRUE))
    if(is.na(parsedParams$yMin)) parsedParams$yMin <- recommendedDisplayWindow$ymin
    if(is.na(parsedParams$yMax)) parsedParams$yMax <- recommendedDisplayWindow$ymax
  }
  
  #Retrieve rendering hint parameters
  renderingOptions <- racas::get_rendering_hint_options(data$parameters[1,]$renderingHint)
  
  setContentType("image/png")
  setHeader("Content-Disposition", paste0("filename=",getParams$curveIds))
  t <- tempfile()
  racas::plotCurve(curveData = data$points, drawIntercept = renderingOptions$drawIntercept, params = data$parameters, fitFunction = renderingOptions$fct, paramNames = renderingOptions$paramNames, drawCurve = TRUE, logDose = TRUE, logResponse = FALSE, outFile = t, ymin=parsedParams$yMin, ymax=parsedParams$yMax, xmin=parsedParams$xMin, xmax=parsedParams$xMax, height=parsedParams$height, width=parsedParams$width, showGrid = parsedParams$showGrid, showAxes = parsedParams$showAxes, labelAxes = parsedParams$labelAxes, showLegend=parsedParams$legend, mostRecentCurveColor = "green")
  sendBin(readBin(t,'raw',n=file.info(t)$size))
  unlink(t)
  DONE
}

renderCurve(getParams = GET)



