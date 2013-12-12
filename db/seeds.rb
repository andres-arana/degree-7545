locations = [
  {name: "Pelliza Fútbol Club", address: "Mariano Pelliza 3800, Olivos, Olivos, Buenos Aires", telephone: " 4799-4219"},
  {name: "Thames Futbol", address: "Carman 681, San Isidro, San Isidro, Buenos Aires", telephone: "4763 8250/ 8400 // 4766 4055"},
]

locations.each do |location|
  Location.where(location).first_or_create!
end
