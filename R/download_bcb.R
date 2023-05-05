#' Download data from Banco Central do Brasil (BCB) API
#'
#' This function downloads time-series data from the Banco Central do Brasil (BCB) API
#' for a specified series code, start date, and end date. The function returns a tibble
#' with two columns: date and value. Optionally, the function can also write the data to an
#' Excel file.
#'
#' @param codigo A character string representing the series code for the desired data. The series
#' code can be found on the BCB website (https://www.bcb.gov.br) or in the BCB API
#' documentation (https://www3.bcb.gov.br/sgspub/localizarseries/localizarSeries.do?method=prepararTelaLocalizarSeries).
#' @param data_inicial A character string representing the start date of the desired data in the format
#' "dd-mm-yyyy".
#' @param data_final A character string representing the end date of the desired data in the format "dd-mm-yyyy".
#' @return A tibble with two columns: date and valor.
#' @export
#' @examples
#' download_bcb("4389", "01-01-2020", "31-12-2020")
download_bcb <-  function(codigo, data_inicial, data_final) {

  # Checar os argumentos
  # Código é valido?
  # Data inicial e final estão no formatos desejados

  bcb_url <- paste0("https://api.bcb.gov.br/dados/serie/bcdata.sgs.", codigo,
                      "/dados?formato=json&dataInicial=", data_inicial,
                      "&dataFinal=", data_final)

  bcb_res <- httr::GET(bcb_url)
  if (httr::status_code(bcb_res) == 200) {
    bcb_json <- httr::content(bcb_res, as = "text", encoding = "UTF-8")
    bcb_df <- jsonlite::fromJSON(bcb_json) |>
      tibble::as_tibble() |>
      dplyr::mutate(date = as.Date(data, format = "%d/%m/%Y"), valor = as.double(valor))  |>
      dplyr::select(date, valor) |>
      tidyr::drop_na()
  } else {
    handle_api_error(bcb_res)
  }

  bcb_df

}
