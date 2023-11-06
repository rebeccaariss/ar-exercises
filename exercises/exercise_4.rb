require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'

puts "Exercise 4"
puts "----------"

# Your code goes here ...
### Exercise 4: Loading a subset of stores

# 1. Borrowing and modifying the code from Exercise one, create 3 more stores:

# - Surrey (annual_revenue of 224000, carries women's apparel only)
# - Whistler (annual_revenue of 1900000 carries men's apparel only)
# - Yaletown (annual_revenue of 430000 carries men's and women's apparel)

# 2. Using the `where` class method from Active Record, fetch (a collection of) only those stores that carry men's apparel. Assign the results to a variable `@mens_stores`.
# 3. Loop through each of these stores and output their name and annual revenue on each line.
# 4. Do another fetch but this time load stores that carry women's apparel and are generating less than $1M in annual revenue.

# My assumption is that it's okay to have stores 1-3 again here because this is a different scope:
store_1 = Store.create(name: "Surrey", annual_revenue: 224000, mens_apparel: false, womens_apparel: true)
store_2 = Store.create(name: "Whistler", annual_revenue: 1900000, mens_apparel: true, womens_apparel: false)
store_3 = Store.create(name: "Yaletown", annual_revenue: 430000, mens_apparel: true, womens_apparel: true)

@mens_stores = Store.where(mens_apparel: true)

@mens_stores.each do |store|
  puts "\nStore name: #{store.name} \nAnnual revenue: #{store.annual_revenue}"
end

# See https://edgeguides.rubyonrails.org/active_record_querying.html for more on
# chaining where conditions:
@womens_stores_under_1mil = Store.where(womens_apparel: true).where('annual_revenue < ?', 1000000)

@womens_stores_under_1mil.each do |store|
  puts "\nStore name: #{store.name} \nAnnual revenue: #{store.annual_revenue}"
end