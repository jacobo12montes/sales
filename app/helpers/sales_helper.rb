module SalesHelper
  def goals(sales)
    array = []
    sales.each do |sale|
      array << sale.amount
    end
    array.reduce(:+)
  end
end
