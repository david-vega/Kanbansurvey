user = FactoryGirl.create :user, email: 'zetacu@gmail.com'

reception_children = [
  '¿Nuestro personal lo guió ó le dio a elegir la mesa de su elección?',
  '¿La actitud de nuestro personal fue amable y positiva en todo momento?',
  '¿Nuestro personal sonrió y supo responder a sus preguntas en general?',
  '¿Nuestro personal le ofreció y le entregó la carta de bebidas o alimentos para usted y todos sus acompañantes?',
  '¿Nuestro personal se despidió cortesmente y se aseguró que otro compañero continuara para atender su servicio?'
]

service_children = [
  '¿El mesero le atendió con amabilidad y supo darle respuesta a sus dudas durante el servicio?',
  '¿Considera la actitud de nuestro personal positiva y proactiva?',
  '¿Considera la imagen y la higiene del personal la adecuada?',
  '¿Considera que la persona que le atendió esta capacitada para su puesto?',
  '¿Quedó satisfecho con la actitud de nuestro personal que le atendió durante su visita?'
]

food_children = [
  '¿La calidad de los alimentos y bebidas fue de su agrado?',
  '¿Le agrado el sabor de sus platillos y bebidas?',
  '¿La presentación y porción de sus platillos y bebidas cumplió con sus expectativas?',
  '¿Las expectativas de higene en sus platillos y bebidas se cumplieron?',
  '¿Su orden fue entregada de manera correcta y completa?',
]

place_children = [
  '¿Encontró limpias nuestras instalaciones?',
  '¿Encontró limpia la recepción a su llegada?',
  '¿Encontró su mesa limpia y agradable?',
  '¿Los baños los encontró limpios?',
  '¿Queda satisfecho con nuestra ambientación?'
]

time_children = [
  '¿En caso de requerirle un tiempo de espera a su llegada este fue notificado y se cumplió?',
  '¿Su órden fue tomada en un tiempo aceptable?',
  '¿El tiempo  para la entrega de sus bebidas y alimentos fue justo?',
  '¿El tiempo de cobro fue aceptable?',
  '¿Si requirió de factura esta fue entregada en un tiempo aceptable?'
]

general_children = []

delivery_children = [
  '¿Nuestro personal que le atendió durante su servicio se mostró amable?',
  '¿La orden fue entregada en su domicilio en un tiempo aceptable?',
  '¿Su orden fue entregada de manera correcta y completa?',
  '¿Sus platillos y bebidas fueron de su total satisfacción?',
  '¿Nos recomendaría?'
]


questions = [
  {
    content: '¿Recibió la bienvenida por parte de nuestro personal?',
    category: 'Reception',
    children: reception_children
  },
  {
    content: '¿Nuestro personal de servicio se mostró amable en todo momento?',
    category: 'Service',
    children: service_children
  },
  {
    content: '¿Sus platillos y bebidas fueron de su total satisfacción?',
    category: 'Food',
    children: food_children
  },
  {
    content: '¿Nuestras instalaciones y el ambiente fue de su agrado?',
    category: 'Place',
    children: place_children
  },
  {
    content: '¿Los tiempos de espera durante su servicio fueron aceptables?',
    category: 'Time',
    children: time_children
  },
  {
    content: '¿Su experiencia fue satisfactoria?',
    category: 'General',
    children: general_children
  },
  {
    content: '¿Nos recomendaría?',
    category: 'General',
    children: general_children
  },
  {
    content: '¿La entrega fue satisfactoria?',
    category: 'Delivery',
    children: delivery_children
  }
]

questions.each do |question|
	root_question = FactoryGirl.create(:question, user: user, content: question[:content], category: question[:category])
  question[:children].each do |child_content|
    child_question = FactoryGirl.create(:question, user: user, content: child_content, category: root_question.category)
    child_question.move_to_child_of(root_question)
  end
end
