#' Lidar com erros da API
#'
#'#' Função para lidar com possíveis erros na resposta da API
#'
#' @param res Resposta da API
#'
#' @return Retorna um erro com uma mensagem explicativa
#' @export
handle_api_error <- function(res) {
  if (httr::http_type(res) == "application/json") {
    msg <- httr::content(res, "text", encoding = "UTF-8")
    if (length(msg) == 1) {
      if (grepl("^\\{\"mensagem\".*", msg)) {
        stop(paste0("Erro na API do Banco Central: ", msg))
      }
    }
  }
  else if (httr::http_type(res) == "text/html") {
    stop("Erro na API do Banco Central: página não encontrada")
  }
  else {
    stop("Erro na API do Banco Central: resposta inesperada")
  }
}
