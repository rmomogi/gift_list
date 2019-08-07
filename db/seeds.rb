# frozen_string_literal: true

20.times do |_t|
  name = Faker::Commerce.department
  Category.create(name: name) unless Category.find_by_name name
end

Category.all.each_with_index do |parent, index|
  10.times do |_t|
    category = Category.create(name: "Categoria #{index + 1}", parent: parent)
    10.times do |_p|
      name = Faker::Commerce.product_name
      unless Product.find_by_name name
        Product.create(name: name, category: category, logo: 'product.png')
      end
    end
  end
end

Product.all.each do |product|
  Stock.create(product: product, price: Faker::Commerce.price, quantity: rand(1..1000))
end
