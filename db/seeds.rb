# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# Supplies

supplies = %w(pencils markers construction\ paper scissors glue magazines)
supplies = supplies.map { |supply| SupplyItem.find_or_create_by(name: supply) }
