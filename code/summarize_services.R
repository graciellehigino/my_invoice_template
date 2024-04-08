# Function to select and summarize invoice data

summarize_invoice <- function(data, invoice_id) {
  # select invoice data
  invoice_data <- data |> 
    filter(invoice_id == !!invoice_id)
  
  
  # consolidate service data
  service_data <- service_data |> 
    group_by(item_id) |> 
    mutate(duration = sum(as.numeric(end - start))) |> 
    filter(!duplicated(item_id)) |> 
    ungroup()
  
  # calculate total amount for each service
  service_data <- service_data |> 
    mutate(duration = as.numeric(end - start), 
           total_amount = duration * rate)
  
  # calculate total amount for the invoice
  total_invoice_amount <- service_data |> 
    summarise(total_amount = sum(total_amount))
  
  return(list(invoice_data = invoice_data, service_data = service_data, total_invoice_amount = total_invoice_amount))
}
