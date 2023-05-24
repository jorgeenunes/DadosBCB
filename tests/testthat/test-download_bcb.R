  resultado <- download_bcb(codigo = "433",
                            data_inicial = "01-01-2022",
                            data_final = "05-05-2023")

  # espero que resultado seja um tibble
  expect_s3_class(resultado, "tbl_df")

  # data maior e menor
  expect_equal(min(resultado$date), as.Date("2022-01-01"))
  expect_equal(max(resultado$date), as.Date("2023-04-01"))

  # não tem NA - a soma de NA seja 0
  expect_equal(sum(is.na(resultado$valor)), 0)


  # ------
  # download_bcb(codigo = "ABC",
  #              data_inicial = "01-01-2022",
  #              data_final = "05-05-2023")

  resultado_data_us <- download_bcb(codigo = "433",
                                    data_inicial = "2022-01-01",
                                    data_final = "2023-05-24")


  # espero que resultado seja um tibble
  expect_s3_class(resultado_data_us, "tbl_df")

  # data maior e menor
  expect_equal(min(resultado_data_us$date), as.Date("2022-01-01"))
  expect_equal(max(resultado_data_us$date), as.Date("2023-04-01"))

