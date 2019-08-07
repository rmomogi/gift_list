20.times do |t|
  name = Faker::Commerce.department
  unless Category.find_by_name name
    Category.create(name: name)
  end
end

Category.all.each_with_index do |parent, index|
  10.times do |t|
    category = Category.create(name: "Categoria #{index + 1}", parent: parent)
    10.times do |p|
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