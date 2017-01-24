user = User.create({ email: 'zetacu+kanban@gmail.com', name: 'user1', password: 'qwertyuiop1234567890' })

reception_children = [
  {
    content: '¿Por parte de nuestro personal hubo alguna persona que le atendiera o lo llevará a su mesa?',
    rank: 6
  },
  {
    content: '¿La actitud de nuestro personal fue amable y positiva en todo momento?',
    rank: rand(10)
  },
  {
    content: '¿Nuestro personal le sugirio algun platillo y supo responder a sus preguntas en general?',
    rank: 6
  },
  {
    content: '¿Nuestro personal le ofreció y le entregó la carta de bebidas o alimentos para usted y todos sus acompañantes?',
    rank: rand(10)
  },
  {
    content: '¿Nuestro personal se despidió cortesmente y se aseguró que otro compañero continuara para atender su servicio?',
    rank: rand(10)
  }
]

service_children = [
  {
    content: '¿El mesero le atendió con amabilidad y supo darle respuesta a sus dudas durante el servicio?',
    rank: rand(10)
  },
  {
    content: '¿Considera la actitud de nuestro personal positiva y proactiva?',
    rank: rand(10)
  },
  {
    content: '¿Considera la imagen y la higiene del personal la adecuada y acorde al lugar?',
    rank: 5
  },
  {
    content: '¿Considera que la persona que le atendió esta capacitada para su puesto?',
    rank: rand(10)
  },
  {
    content: '¿Quedó satisfecho con la actitud de nuestro personal que le atendió durante su visita?',
    rank: rand(10)
  }
]

food_children = [
  {
    content: '¿La calidad de los alimentos y bebidas fue de su agrado?',
    rank: rand(10)
  },
  {
    content: '¿Le agrado el sabor de sus platillos y bebidas?',
    rank: rand(10)
  },
  {
    content: '¿La presentación y porción de sus platillos y bebidas cumplió con sus expectativas?',
    rank: rand(10)
  },
  {
    content: '¿Las expectativas de higene en sus platillos y bebidas se cumplieron?',
    rank: rand(10)
  },
  {
    content: '¿Su orden fue entregada de manera correcta y completa?',
    rank: rand(10)
  }
]

place_children = [
  {
    content: '¿Encontró limpias nuestras instalaciones?',
    rank: rand(10)
  },
  {
    content: '¿Encontró limpia la recepción a su llegada?',
    rank: rand(10)
  },
  {
    content: '¿Encontró su mesa limpia y agradable?',
    rank: rand(10)
  },
  {
    content: '¿Los baños los encontró limpios?',
    rank: rand(10)
  },
  {
    content: '¿Queda satisfecho con nuestra ambientación?',
    rank: rand(10)
  }
]

time_children = [
  {
    content: '¿En caso de requerirle un tiempo de espera a su llegada este fue notificado y se cumplió?',
    rank: rand(10)
  },
  {
    content: '¿Su órden fue tomada en un tiempo aceptable?',
    rank: rand(10)
  },
  {
    content: '¿El tiempo  para la entrega de sus bebidas y alimentos fue justo?',
    rank: rand(10)
  },
  {
    content: '¿El tiempo de cobro fue aceptable?',
    rank: rand(10)
  },
  {
    content: '¿Si requirió de factura esta fue entregada en un tiempo aceptable?',
    rank: rand(10)
  }
]

general_children = []

delivery_children = [
  {
    content: '¿Nuestro personal que le atendió durante su servicio se mostró amable?',
    rank: rand(10)
  },
  {
    content: '¿La orden fue entregada en su domicilio en un tiempo aceptable?',
    rank: rand(10)
  },
  {
    content: '¿Su orden fue entregada de manera correcta y completa?',
    rank: rand(10)
  },
  {
    content: '¿Sus platillos y bebidas fueron de su total satisfacción?',
    rank: rand(10)
  },
  {
    content: '¿Nos recomendaría?',
    rank: rand(10)
  }
]

questions = [
  {
    content: '¿Recibió la bienvenida por parte de nuestro personal?',
    category: 'Reception',
    rank: rand(10),
    children: reception_children
  },
  {
    content: '¿Nuestro personal de servicio se mostró amable en todo momento?',
    category: 'Service',
    rank: rand(10),
    children: service_children
  },
  {
    content: '¿Sus platillos y bebidas fueron de su total satisfacción?',
    category: 'Food',
    rank: rand(10),
    children: food_children
  },
  {
    content: '¿Nuestras instalaciones y el ambiente fue de su agrado?',
    category: 'Place',
    rank: rand(10),
    children: place_children
  },
  {
    content: '¿Los tiempos de espera durante su servicio fueron aceptables?',
    category: 'Time',
    rank: rand(10),
    children: time_children
  },
  {
    content: '¿Su experiencia fue satisfactoria?',
    category: 'General',
    rank: rand(10),
    children: general_children
  },
  {
    content: '¿Nos recomendaría?',
    category: 'General',
    rank: rand(10),
    children: general_children
  },
  {
    content: '¿La entrega fue satisfactoria?',
    category: 'Delivery',
    rank: rand(10),
    children: delivery_children
  },
  {
    content: '¿Que calificación pondría de acuerdo a su experiencia con nosotros?',
    category: 'Escala',
    rank: 1 al 10,
    children: general_children
  }
]

questions.each do |question|
	root_question = Question.create({
    user_id: user.id,
    content: question[:content],
    category: question[:category],
    rank: question[:rank]
  })

  question[:children].each do |child|
    child_question = Question.create({
      user: user,
      content: child[:content],
      category: root_question.category,
      rank: child[:rank]
    })
    child_question.move_to_child_of(root_question)
  end
end
