
font "Helvetica"

text "REPORTE", :align => :left, :style => :italic, :size => 18
text "DE RESULTADOS", :align => :left, :style => :italic, :size => 18
move_down 40
text "I. Datos generales del estudiante", :align => :left, :style => :italic, :size => 12
move_down 20



formatted_text [ { :text => "Nombre: ", :styles => [:italic] },
 { :text => "#{@test.nombre} ", :styles => [:bold] },
 ]

 formatted_text [ { :text => "Colegio: ", :styles => [:italic] },
 { :text => "#{@test.colegio} ", :styles => [:bold] },
 ]

 formatted_text [ { :text => "Grado: ", :styles => [:italic] },
 { :text => "#{@test.nivel} ", :styles => [:bold] },
 ]

 formatted_text [ { :text => "Sección: ", :styles => [:italic] },
 { :text => "#{@test.seccion} ", :styles => [:bold] },
 ]

  formatted_text [ { :text => "Edad al momento de la evaluación: ", :styles => [:italic] },
 { :text => "#{@años} años y #{@meses} meses ", :styles => [:bold] },
 ]

move_down 30
text "II. Pruebas Administradas", :align => :left, :style => :italic, :size => 12
move_down 20

text "*  Para evaluar las habilidades verbales del niño se utilizó el PEABODY. Test de Vocabulario en Imágenes. 3ra Edición."
move_down 10
text "*  Para evaluar las habilidades matemáticas del niño se utilizó el TEMA-3. Test de Competencia Matemática Básica 3."

move_down 30
text "III. Resultados y Recomendaciones", :align => :left, :style => :italic, :size => 12
move_down 30

text "Habilidades Verbales", :size => 12, :style => :bold
move_down 20 

text "La investigación ha demostrado que el desarrollo del vocabulario es muy importante para el aprendizaje y desarrollo del lenguaje. "
move_down 10
text "De esta manera, un mayor conocimiento y uso adecuado de palabras nuevas se relaciona con una mejor comprensión de textos en la primaria, secundaria y universidad. "
move_down 10
text "De otro lado, un vocabulario más rico se ha vinculado también con el éxito académico de los estudiantes. Por lo tanto, conforme los estudiantes aprenden a leer, extienden su vocabulario aprendiendo nuevas palabras, lo que facilita la comprensión de lo que van leyendo.  "
move_down 10
text "En ese sentido, la presente investigación busca conocer el nivel de vocabulario receptivo (palabras conocidas por la persona a nivel auditivo) de el/la estudiante. "
move_down 40

start_new_page
text "Sus resultados fueron:", :style => :italic
move_down 25
text "#{@a}", :style => :bold_italic, :color => [60, 50, 48, 42]
move_down 50
text "#{@b}", :style => :italic, :color => [60, 50, 48, 42]
move_down 10
text "*  #{@c}", :style => :italic, :color => [60, 50, 48, 42]
move_down 10
text "*  #{@d}", :style => :italic, :color => [60, 50, 48, 42]


move_down 30
text "Habilidades Matemáticas", :size => 12, :style => :bold
move_down 20 


text "El conocimiento de las matemáticas básicas es una herramienta indispensable en nuestra sociedad y es la base del éxito en las matemáticas de nivel superior. Asimismo, la investigación ha demostrado que uno de los factores más importantes de predicción de logro académico a futuro son las habilidades matemáticas tempranas con las que comienza un niño la escuela. Es por esto que la etapa de educación infantil resulta un período significativo para estimular el sentido numérico y animar el desarrollo aritmético en los niños."
move_down 10
text "En ese sentido, la presente investigación busca identificar la competencia matemática temprana de el/la estudiante mediante el desarrollo aritmético (realizar actividades como contar objetos, leer y escribir números, realizar cálculos aritméticos y razonar con números, etc.)."
move_down 10
text "Las últimas investigaciones sugieren que los conceptos y las habilidades básicas formales tienen como base las matemáticas informales. Es por esto que la prueba se divide en estas dos dimensiones: "

move_down 20

formatted_text [ { :text => "Conocimiento matemático informal: ", :styles => [:bold] },
 { :text => "Se refiere a las nociones y procedimientos adquiridos fuera del contexto escolar (numeración, comparación de cantidades y cálculo informal). ", :styles => [:italic] },
 ]
move_down 10

 formatted_text [ { :text => "Conocimiento matemático formal: ", :styles => [:bold] },
 { :text => "Se refiere a las habilidades y conceptos que el niño aprende en la escuela (convencionalismos, hechos numéricos, cálculo formal).", :styles => [:italic] },
 ]

move_down 10
start_new_page
text "Sus resultados generales fueron:", :style => :italic

move_down 15
text "#{@e}", :style => :bold_italic, :color => [60, 50, 48, 42]

move_down 20
text "En cuanto al conocimiento informal, se describen las áreas que lo componen y a continuación se presentan los resultados y recomendaciones."

move_down 20

 formatted_text [ { :text => "Numeración: ", :styles => [:bold] },
 { :text => " en su forma básica supone el dominio de la secuencia rutinaria de los números. Una etapa intermedia implica la aplicación de la secuencia numérica en la determinación de la cantidad de elementos. Una etapa más avanzada requiere más flexibilidad en el uso y la aplicación de la secuencia numérica.", :styles => [:italic] },
 ], :indent_paragraphs => 60
move_down 30

text "#{@f}", :style => :italic, :color => [60, 50, 48, 42]

move_down 20
start_new_page

 formatted_text [ { :text => "Comparación de cantidades: ", :styles => [:bold] },
 { :text => "implica cierto sentido numérico y un conocimiento del “orden” de los números, lo cual va desarrollando en el niño la capacidad para establecer distancias relativas entre cantidades.", :styles => [:italic] },
 ], :indent_paragraphs => 60
move_down 10
text "#{@g}", :style => :italic, :color => [60, 50, 48, 42]


move_down 30

 formatted_text [ { :text => "Cálculo informal: ", :styles => [:bold] },
 { :text => " se refiere al manejo de los números en la resolución de sencillas situaciones que implican las operaciones de sumar o restar. No hacen uso de algoritmos de cálculo convencionales ni lápiz ni papel.", :styles => [:italic] },
 ], :indent_paragraphs => 60
move_down 10
text "#{@h}", :style => :italic, :color => [60, 50, 48, 42]

move_down 20
text "En cuanto al conocimiento formal, se describen las áreas que lo componen y a continuación se presentan los resultados y recomendaciones."

move_down 20
start_new_page

 formatted_text [ { :text => "Convencionalismos: ", :styles => [:bold] },
 { :text => "se centran en la valoración de la capacidad de lectoescritura de cantidades.", :styles => [:italic] },
 ], :indent_paragraphs => 60
 

move_down 10
text "#{@i}", :style => :italic, :color => [60, 50, 48, 42]

move_down 20

 formatted_text [ { :text => "Hechos numéricos: ", :styles => [:bold] },
 { :text => " implica el conocimiento del resultado de operaciones sencillas de suma, resta y multiplicación, sin necesidad de realizar el cálculo.", :styles => [:italic] },
 ], :indent_paragraphs => 60

move_down 10
text "#{@j}", :style => :italic, :color => [60, 50, 48, 42]

move_down 20

 formatted_text [ { :text => "Cálculo formal: ", :styles => [:bold] },
 { :text => " supone la realización de cuentas de suma y resta de dificultad creciente mediante el uso de un algoritmo.", :styles => [:italic] },
 ], :indent_paragraphs => 60

move_down 10
text "#{@k}", :style => :italic, :color => [60, 50, 48, 42]

bounding_box [bounds.left, bounds.bottom + 155], :width  => bounds.width do
text "Muchas gracias por su participación,"
move_down 80
	text "Martín Malaspina", :align => :right, :style => :bold
move_down 2
text "Marisut Guimet", :align => :right, :style => :bold
move_down 2
text "Pedro Alfaro", :align => :right, :style => :bold
move_down 5
stroke_horizontal_rule

    end



  