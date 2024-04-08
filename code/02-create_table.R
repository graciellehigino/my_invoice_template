# Load packages
library(gt)


# Create table with items to be included in the invoice
invoice_table <- 
  service_data$service_data |> 
  select(item_id, description, rate, total_amount) |>                # select columns to include in the invoice
  gt() |>                                                            # create gt table
  fmt_currency(currency = "CAD", columns = c(rate, total_amount)) |> # format rate and total_amount as currency
  cols_label(                                                        # add labels to the columns
    item_id = "Item ID",
    description = "Description",
    rate = "Rate",
    total_amount = "Total"
  ) |> 
  tab_style(
    style = list(
      cell_fill(color = "#ced6d4"),                                  # set cell colour
      cell_text(weight = "bold")                                     # set cell text to bold
    ),
    locations = 
      cells_column_labels()                                          # apply style to column labels
  ) |>
  # cols_width(item_id ~ px(80),
  #            description ~ px(300),
  #            rate ~ px(100),
  #            total_amount ~ px(100)) |>
  opt_vertical_padding(scale = 1) |>                                 # adjust vertical padding
  opt_horizontal_padding(scale = 2) |>                               # adjust horizontal padding
  opt_table_font(font = "Source Sans Pro")                           # change font
