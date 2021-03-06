# ROUTE: /curve/detail
# MEMORY_LIMIT_EXEMPT

library(racas)

myMessenger <- Messenger$new()
myMessenger$logger <- createLogger(logName = "com.acas.doseresponse.fit.curve.detail", logToConsole = FALSE)
myMessenger$logger$debug("curve detail initiated")

handle_response <- function(http_response_code, response) {
  setHeader("Access-Control-Allow-Origin" ,"*")
  setContentType("text/plain")
  setStatus(http_response_code)
  cat(response)
  return_code <- switch(http_response_code,
                        HTTP_INTERNAL_SERVER_ERROR = DONE,
                        OK)
  return(return_code)
}

get_curve_detail <- function() {
  postData <- rawToChar(receiveBin())
  if(is.null(postData) || postData == "") {
    myMessenger$logger$debug(paste0('getting curve detail with get json: ', GET))
    myMessenger$capture_output("detail <- racas::api_doseResponse_get_curve_detail(GET)", userError = paste0("There was an error retrieving detail for '", GET, "'"))
    if(myMessenger$hasErrors()) {
      if(myMessenger$errors == "no analysis group id found") {
        return(handle_response(HTTP_NOT_FOUND , "no analysis group id found"))
      } else {
        myMessenger$logger$error(paste0("got errors in response: ", myMessenger$toJSON()))
        return(handle_response(HTTP_INTERNAL_SERVER_ERROR, myMessenger$toJSON()))
      }
    } else {
      myMessenger$logger$debug(paste0("api_doseResponse_get_curve_detail response: ", toJSON(detail)))
    }
  } else {
    POST <- jsonlite::fromJSON(postData)
    if(class(POST) == "character") {
      myMessenger$logger$debug(paste0('get fit data with postData: ', postData))
      raw_data <- FALSE
      if(!is.null(GET$rawdata)) {
        raw_data <- as.logical(GET$rawdata)
      }
      data <- racas::get_curve_data(POST, raw_data = raw_data, globalConnect = TRUE)

      detail <- jsonlite::toJSON(data, auto_unbox = TRUE)
    } else {
      myMessenger$logger$debug(paste0('updating fit with postData: ', postData))
      myMessenger$capture_output({
        modelFit <- racas::get_model_fit_from_type_code(POST$renderingHint)
        detail <- switch(POST$action,
                        'save' = racas::api_doseResponse_save_session(POST$sessionID, POST$user),
                        'deleteSession' = racas::deleteSession(POST$sessionID),
                        'pointsChanged' = racas::api_doseResponse_refit(POST, modelFit),
                        'parametersChanged' = racas::api_doseResponse_refit(POST, modelFit),
                        'userFlagStatus' = racas::api_doseResponse_refit(POST, modelFit)
        )
      },
      , userError = paste0("There was an error performing",POST$action)
      )
    }
    if(myMessenger$hasErrors()) {
      myMessenger$logger$error(paste0('got error: ', myMessenger$toJSON()))
      return(handle_response(HTTP_INTERNAL_SERVER_ERROR, myMessenger$toJSON()))
    }
  }
  myMessenger$logger$debug(paste0('returning: ', detail))
  setHeader("Access-Control-Allow-Origin" ,"*")
  setContentType("application/json")
  cat(detail)
  DONE
}

get_curve_detail()