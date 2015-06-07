class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :surveys
  has_many :questions
  validates :name, presence: true

  cattr_accessor :question_type

  after_create :assign_questions

  private

  def assign_questions
    questions = case question_type
                when 'restaurant' then restaurant_questions
                end

    rank = 5 #TODO see if this number actually works well with the score
    questions.each do |question|
      root_question = Question.create({
        user: self,
        content: question[:content],
        category: question[:category],
        rank: rank
      })

      question[:children].each do |child|
        child_question = Question.create({
          user: self,
          content: child[:content],
          category: root_question.category,
          rank: rank
        })
        child_question.move_to_child_of(root_question)
      end
    end
  end

  # TODO: move all this questions to a module on a lib file

  def restaurant_questions
    [
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
  end

  def reception_children
    [
      {
        content: '¿Nuestro personal lo guió ó le dio a elegir la mesa de su elección?'
      },
      {
        content: '¿La actitud de nuestro personal fue amable y positiva en todo momento?'
      },
      {
        content: '¿Nuestro personal sonrió y supo responder a sus preguntas en general?'
      },
      {
        content: '¿Nuestro personal le ofreció y le entregó la carta de bebidas o alimentos para usted y todos sus acompañantes?'
      },
      {
        content: '¿Nuestro personal se despidió cortesmente y se aseguró que otro compañero continuara para atender su servicio?'
      }
    ]
  end

  def service_children
    [
      {
        content: '¿El mesero le atendió con amabilidad y supo darle respuesta a sus dudas durante el servicio?'
      },
      {
        content: '¿Considera la actitud de nuestro personal positiva y proactiva?'
      },
      {
        content: '¿Considera la imagen y la higiene del personal la adecuada?'
      },
      {
        content: '¿Considera que la persona que le atendió esta capacitada para su puesto?'
      },
      {
        content: '¿Quedó satisfecho con la actitud de nuestro personal que le atendió durante su visita?'
      }
    ]
  end

  def food_children
    [
      {
        content: '¿La calidad de los alimentos y bebidas fue de su agrado?'
      },
      {
        content: '¿Le agrado el sabor de sus platillos y bebidas?'
      },
      {
        content: '¿La presentación y porción de sus platillos y bebidas cumplió con sus expectativas?'
      },
      {
        content: '¿Las expectativas de higene en sus platillos y bebidas se cumplieron?'
      },
      {
        content: '¿Su orden fue entregada de manera correcta y completa?'
      }
    ]
  end

  def place_children
    [
      {
        content: '¿Encontró limpias nuestras instalaciones?'
      },
      {
        content: '¿Encontró limpia la recepción a su llegada?'
      },
      {
        content: '¿Encontró su mesa limpia y agradable?'
      },
      {
        content: '¿Los baños los encontró limpios?'
      },
      {
        content: '¿Queda satisfecho con nuestra ambientación?'
      }
    ]
  end

  def time_children
    [
      {
        content: '¿En caso de requerirle un tiempo de espera a su llegada este fue notificado y se cumplió?'
      },
      {
        content: '¿Su órden fue tomada en un tiempo aceptable?'
      },
      {
        content: '¿El tiempo  para la entrega de sus bebidas y alimentos fue justo?'
      },
      {
        content: '¿El tiempo de cobro fue aceptable?'
      },
      {
        content: '¿Si requirió de factura esta fue entregada en un tiempo aceptable?'
      }
    ]
  end

  def general_children
    []
  end

  def delivery_children
    [
      {
        content: '¿Nuestro personal que le atendió durante su servicio se mostró amable?'
      },
      {
        content: '¿La orden fue entregada en su domicilio en un tiempo aceptable?'
      },
      {
        content: '¿Su orden fue entregada de manera correcta y completa?'
      },
      {
        content: '¿Sus platillos y bebidas fueron de su total satisfacción?'
      },
      {
        content: '¿Nos recomendaría?'
      }
    ]
  end


end
