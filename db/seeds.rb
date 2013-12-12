locations = [
  {name: "Pelliza Fútbol Club", address: "Mariano Pelliza 3800, Olivos, Olivos, Buenos Aires", telephone: " 4799-4219"},
  {name: "Thames Futbol", address: "Carman 681, San Isidro, San Isidro, Buenos Aires", telephone: "4763 8250/ 8400 // 4766 4055"},
  {name: "Fútbol Madero", address: "Elvira Rawson de Dellepiane 340 , Puerto Madero, Capital Federal, Ciudad A. de Buenos Aires", telephone: "4314-4237/4311-3980"},
  {name: "Fútbol Vieytes", address: "Vieytes 1134 (1275), Barracas, Capital Federal, Ciudad A. de Buenos Aires", telephone: "4301-6391 / 4704 / 2816"},
  {name: "Muni Fútbol", address: "C. Larralde 1045, Nuñez, Capital Federal, Ciudad A. de Buenos Aires", telephone: "4702-3639 / 4703-4362"},
  {name: "Fútbol Urbano", address: "Campos Salles 1565, Nuñez, Capital Federal, Ciudad A. de Buenos Aires", telephone: "4702-4111"},
  {name: "La Terraza", address: "Av. Cabildo 3432, Belgrano, Capital Federal, Ciudad A. de Buenos Aires", telephone: "4702-0235/4701-9869/ID 559*2967"},
  {name: "Barrio Parque Fútbol Club", address: "Ortiz de Ocampo 3219, Palermo, Capital Federal, Ciudad A. de Buenos Aires", telephone: "48014264/48024192"},
  {name: "Nikkei Fútbol 5", address: "Chacabuco 1260, San Telmo, Capital Federal, Ciudad A. de Buenos Aires", telephone: "4307-1165"},
  {name: "San José Fútbol", address: "San José 1267, Constitución, Capital Federal, Ciudad A. de Buenos Aires", telephone: "4304-3817"},
  {name: "Open Gallo", address: "Gallo 241, Abasto, Capital Federal, Ciudad A. de Buenos Aires", telephone: "4862-9392/ 9386/ 4865-4057"},
  {name: "City Stadium", address: "Av. Corrientes 1930/48, Balvanera, Capital Federal, Ciudad A. de Buenos Aires", telephone: "4952-5595"},
  {name: "Pareja Fútbol", address: "Jose Pedro Varela 4650, Villa Devoto, Capital Federal, Ciudad A. de Buenos Aires", telephone: "4501-2568/ Radio: 637*906"},
  {name: "San Carlos Club", address: "Av. José María Moreno 953, Parque Chacabuco, Capital Federal, Ciudad A. de Buenos Aires", telephone: "4921-7699"},
  {name: "El Anden", address: "Yerbal 1255, Caballito, Capital Federal, Ciudad A. de Buenos Aires", telephone: "4431-8563 / 4433-2319/ 2620"},
  {name: "La Plaza Fútbol", address: "Cochabamba 2335, San Cristobal, Capital Federal, Ciudad A. de Buenos Aires", telephone: "4941-3067"},
  {name: "Campus Sport Arena", address: "Maza 754, Almagro, Capital Federal, Ciudad A. de Buenos Aires", telephone: "4956-0045 / 4956-0717"},
  {name: "Parthenon", address: "Tupac Amarú 1030, Floresta, Capital Federal, Ciudad A. de Buenos Aires", telephone: "4636-1650 / 4674-2062"},
  {name: "Ocampo Fútbol", address: "Ortiz de Ocampo 3250, Palermo, Capital Federal, Ciudad A. de Buenos Aires", telephone: "4801-1971 / 4804-3226"},
  {name: "El Parque Fútbol", address: "Brig. Gral. Facundo Quiroga s/n, Recoleta, Capital Federal, Ciudad A. de Buenos Aires", telephone: "4807-8282"},
  {name: "Parque Roca", address: "Av. Roca 3490, Villa Soldati, Capital Federal, Ciudad A. de Buenos Aires", telephone: "4919-1542"}
]

locations.each do |location|
  Location.where(location).first_or_create!
end
