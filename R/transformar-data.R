#' Transform a date to BR format
#'
#' @param data date to transform
#'
#' @return a date in a character form
#' @export
#'
#' @examples transformar_data("24-05-2023")
transformar_data <- function(data){
  formato_us <- stringr::str_detect(data, "[0-9]{4}-[0-9]{2}-[0-9]{2}")
  formato_br <- stringr::str_detect(data, "[0-9]{2}-[0-9]{2}-[0-9]{4}")

  if(isTRUE(formato_us)){
    data <- format(as.Date(data), "%d-%m-%Y")
  } else if(isTRUE(formato_br)){
    data
  } else {
    usethis::ui_stop("O formato da data {data} não é suportado.
                     Utilize o formato do exemplo: 01-12-2020.")
  }

  data
}
