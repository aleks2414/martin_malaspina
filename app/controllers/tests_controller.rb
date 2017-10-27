class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /tests
  # GET /tests.json
  def index

    @q= Test.ransack(params[:q])
    @tests = @q.result.uniq

    @tests = @tests.order('id ASC').paginate(:page => params[:page], :per_page => 30)
      respond_to do |format|
      format.html
      format.csv { send_data @tests.to_csv(['nombre', 'colegio', 'nivel', 'seccion', 'edad', 'ic', 'icm', 'pi_num', 'pi_comp', 'pi_cal', 'pi_conc', 'pf_conv', 'pf_hecho', 'pf_calc', 'pf_conce']) }
    end
  end

    def import
    Test.import(params[:file])
    redirect_to root_url, notice: "Tests imported."
  end



  # GET /tests/1
  # GET /tests/1.json
  def show

  @años =(@test.edad/12).truncate
  @meses = (@test.edad % 12).truncate

    if @test.ic > 115 then
      @a = "El/la estudiante ha adquirido las habilidades verbales por encima de lo esperado para su edad."
      @b = "Se sugieren las siguientes estrategias para reforzar los logros de su hijo/a:"

    elsif @test.ic.between?(85, 115) then
      @a = "El/la estudiante ha adquirido las habilidades verbales esperadas para su edad."
      @b = "Se sugieren las siguientes estrategias para propiciar un mayor vocabulario de su hijo/a:"

    elsif @test.ic < 85 then
      @a = "El/la estudiante se encuentra en proceso de adquirir las habilidades verbales esperadas para
su edad."
@b = "Se sugieren las siguientes estrategias para incentivar un mayor vocabulario de su hijo/a y
alcanzar el nivel esperado para su edad:"
    end

    if @test.nivel == "Inicial" then 
      @c = "Conversar con sus hijos puede ser una buena forma de introducir vocabulario nuevo
en ellos. Pregunte a sus hijos acerca de su día. Incluso los adultos pueden introducir
nuevo vocabulario a los niños, actuando o ejemplificando el uso de las palabras
nuevas."
      @d = "Cuéntele y/o léale historias o cuentos a sus hijos. Esta puede ser una manera eficaz y
entretenida de introducir nuevo vocabulario en ellos. Posteriormente, converse sobre
lo que les ha leído."

elsif @test.nivel == "1" then
      @c = "Conversar con sus hijos puede ser una buena forma de introducir vocabulario nuevo
en ellos. Pregunte a sus hijos acerca de su día. Incluso los adultos pueden introducir
nuevo vocabulario a los niños, actuando o ejemplificando el uso de las palabras
nuevas."
      @d = "Propicie el hábito de lectura en sus hijos, complementariamente léale cuentos o
historias, o lea con ellos. Esta puede ser una manera eficaz y entretenida de introducir
nuevo vocabulario en ellos. Posteriormente, converse sobre lo que han leído."

elsif @test.nivel == "2" then
      @c = "Conversar con sus hijos puede ser una buena forma de introducir vocabulario nuevo
en ellos. Pregunte a sus hijos acerca de su día. Incluso los adultos pueden introducir
nuevo vocabulario a los niños, actuando o ejemplificando el uso de las palabras
nuevas."
      @d = "Propicie el hábito de lectura en sus hijos, complementariamente léale cuentos o
historias, o lea con ellos. Esta puede ser una manera eficaz y entretenida de introducir
nuevo vocabulario en ellos. Posteriormente, converse sobre lo que han leído."
    end  


# mate

    if @test.icm > 115 then
      @e = "El/la estudiante ha adquirido las habilidades matemáticas aritméticas básicas por encima de lo
esperado para su edad."

    elsif @test.icm.between?(85, 115) then
      @e = "El/la estudiante ha adquirido las habilidades matemáticas aritméticas básicas esperadas para
su edad."

    elsif @test.icm < 85 then
      @e = "El/la estudiante se encuentra en proceso de adquirir las habilidades matemáticas aritméticas
básicas esperadas para su edad."
    end

# Numeración

# 60 a 65

if @test.edad.between?(60, 65) && @test.pi_num > 10 then
  @f = "El/la estudiante ha adquirido las habilidades de numeración por encima de lo esperado para la edad que posee.
Algunas recomendaciones para practicar lo aprendido y/o generar nuevos aprendizajes:


* Se puede ayudar al niño a aprender la secuencia numérica (sobre todo los primeros 15 números que deben ser memorizados) con rimas infantiles e historias. Luego del 15 hay un patrón para los números y la idea es ayudar al niño a que aprenda las reglas para crear los números. Los niños deben aprender  que después de un número terminado en 9, hay un cambio a la decena siguiente, y una vez que el cambio se ha producido, simplemente se añaden los números del 1 al 9.

* Dar oportunidad a los niños para que identifiquen los errores de conteo de los adultos. Los niños pequeños encuentran sorprendente y divertido que los adultos cometan errores y disfrutan señalándolos. El adulto tiene que producir deliberadamente errores de conteo para que el niño los identifique y corrija.

* Jugar con el niño tirando un dado (para mayor complejidad pueden usar más dados) para determinar qué número de objetos han de seleccionarse de un conjunto mayor.

* Jugar el “Número tapado”, consiste en colocar una serie de cartas del 1 al 9, se pide al niño que cierre los ojos y se le da la vuelta a una de ellas ocultando el número. Después, se les pide (señalando la carta anterior) que digan cuál es el número siguiente. Una versión más elaborada  supone dar la vuelta a todas las cartas y levantar solo una de ellas. Entonces se pide al niño que diga cuál es el número que va después.

* Para que practiquen el conteo de 10 en 10 se puede jugar un juego en el que los niños tienen que contar con rapidez objetos agrupados en colecciones de diez. Si se prima la velocidad, los niños aprenden rápidamente a contar de 10 en 10.
"

elsif @test.edad.between?(60, 65) && @test.pi_num.between?(8, 10) then
  @f = "El/la estudiante ha adquirido las habilidades de numeración de acuerdo a lo esperado para la edad que posee.
Algunas recomendaciones para mejorar lo aprendido:


* Se puede ayudar al niño a aprender la secuencia numérica (sobre todo los primeros 15 números que deben ser memorizados) con rimas infantiles e historias. Luego del 15 hay un patrón para los números y la idea es ayudar al niño a que aprenda las reglas para crear los números.

* Dar oportunidad a los niños para que identifiquen los errores de conteo de los adultos. Los niños pequeños encuentran sorprendente y divertido que los adultos cometan errores y disfrutan señalándolos. El adulto tiene que producir deliberadamente errores de conteo para que el niño los identifique y corrija.

* Jugar con el niño tirando un dado (para mayor complejidad pueden usar más dados) para determinar qué número de objetos han de seleccionarse de un conjunto mayor.

* Jugar el “Número tapado”, consiste en colocar una serie de cartas del 1 al 9, se pide al niño que cierre los ojos y se le da la vuelta a una de ellas ocultando el número. Después, se les pide (señalando la carta anterior) que digan cuál es el número siguiente. Una versión más elaborada  supone dar la vuelta a todas las cartas y levantar solo una de ellas. Entonces se pide al niño que diga cuál es el número que va después.
"

elsif @test.edad.between?(60, 65) && @test.pi_num < 8 then
  @f = "El/la estudiante se encuentra en proceso de adquirir las habilidades de numeración de acuerdo a lo esperado para la edad que posee.
Algunas recomendaciones para apoyar al estudiante:


* Se puede ayudar al niño a aprender la secuencia numérica (sobre todo los primeros 15 números que deben ser memorizados) con rimas infantiles e historias. Luego del 15 hay un patrón para los números y la idea es ayudar al niño a que aprenda las reglas para crear los números. 

* Dar oportunidad a los niños para que identifiquen los errores de conteo de los adultos. Los niños pequeños encuentran sorprendente y divertido que los adultos cometan errores y disfrutan señalándolos. El adulto tiene que producir deliberadamente errores de conteo para que el niño los identifique y corrija.

* Jugar con el niño tirando un dado (para mayor complejidad pueden usar más dados) para determinar qué número de objetos han de seleccionarse de un conjunto mayor.

* Jugar el “Número tapado”, consiste en colocar una serie de cartas del 1 al 9, se pide al niño que cierre los ojos y se le da la vuelta a una de ellas ocultando el número. Después, se les pide (señalando la carta anterior) que digan cuál es el número siguiente. Una versión más elaborada  supone dar la vuelta a todas las cartas y levantar solo una de ellas. Entonces se pide al niño que diga cuál es el número que va después.
"

# 72 a 77

elsif @test.edad.between?(66, 71) && @test.pi_num > 14 then
  @f = "El/la estudiante ha adquirido las habilidades de numeración por encima de lo esperado para la edad que posee.
Algunas recomendaciones para practicar lo aprendido y/o generar nuevos aprendizajes:


* Se puede ayudar al niño a aprender la secuencia numérica (sobre todo los primeros 15 números que deben ser memorizados) con rimas infantiles e historias. Luego del 15 hay un patrón para los números y la idea es ayudar al niño a que aprenda las reglas para crear los números. Los niños deben aprender  que después de un número terminado en 9, hay un cambio a la decena siguiente, y una vez que el cambio se ha producido, simplemente se añaden los números del 1 al 9.

* Dar oportunidad a los niños para que identifiquen los errores de conteo de los adultos. Los niños pequeños encuentran sorprendente y divertido que los adultos cometan errores y disfrutan señalándolos. El adulto tiene que producir deliberadamente errores de conteo para que el niño los identifique y corrija.

* Jugar con el niño tirando un dado (para mayor complejidad pueden usar más dados) para determinar qué número de objetos han de seleccionarse de un conjunto mayor.

* Jugar el “Número tapado”, consiste en colocar una serie de cartas del 1 al 9, se pide al niño que cierre los ojos y se le da la vuelta a una de ellas ocultando el número. Después, se les pide (señalando la carta anterior) que digan cuál es el número siguiente. Una versión más elaborada  supone dar la vuelta a todas las cartas y levantar solo una de ellas. Entonces se pide al niño que diga cuál es el número que va después.

* Para que practiquen el conteo de 10 en 10 se puede jugar un juego en el que los niños tienen que contar con rapidez objetos agrupados en colecciones de diez. Si se prima la velocidad, los niños aprenden rápidamente a contar de 10 en 10.
"

elsif @test.edad.between?(66, 71) && @test.pi_num.between?(10, 14) then
  @f = "El/la estudiante ha adquirido las habilidades de numeración de acuerdo a lo esperado para la edad que posee.
Algunas recomendaciones para mejorar lo aprendido:


* Se puede ayudar al niño a aprender la secuencia numérica (sobre todo los primeros 15 números que deben ser memorizados) con rimas infantiles e historias. Luego del 15 hay un patrón para los números y la idea es ayudar al niño a que aprenda las reglas para crear los números.

* Dar oportunidad a los niños para que identifiquen los errores de conteo de los adultos. Los niños pequeños encuentran sorprendente y divertido que los adultos cometan errores y disfrutan señalándolos. El adulto tiene que producir deliberadamente errores de conteo para que el niño los identifique y corrija.

* Jugar con el niño tirando un dado (para mayor complejidad pueden usar más dados) para determinar qué número de objetos han de seleccionarse de un conjunto mayor.

* Jugar el “Número tapado”, consiste en colocar una serie de cartas del 1 al 9, se pide al niño que cierre los ojos y se le da la vuelta a una de ellas ocultando el número. Después, se les pide (señalando la carta anterior) que digan cuál es el número siguiente. Una versión más elaborada  supone dar la vuelta a todas las cartas y levantar solo una de ellas. Entonces se pide al niño que diga cuál es el número que va después.
"

elsif @test.edad.between?(66, 71) && @test.pi_num < 10 then
  @f = "El/la estudiante se encuentra en proceso de adquirir las habilidades de numeración de acuerdo a lo esperado para la edad que posee.
Algunas recomendaciones para apoyar al estudiante:


* Se puede ayudar al niño a aprender la secuencia numérica (sobre todo los primeros 15 números que deben ser memorizados) con rimas infantiles e historias. Luego del 15 hay un patrón para los números y la idea es ayudar al niño a que aprenda las reglas para crear los números. 

* Dar oportunidad a los niños para que identifiquen los errores de conteo de los adultos. Los niños pequeños encuentran sorprendente y divertido que los adultos cometan errores y disfrutan señalándolos. El adulto tiene que producir deliberadamente errores de conteo para que el niño los identifique y corrija.

* Jugar con el niño tirando un dado (para mayor complejidad pueden usar más dados) para determinar qué número de objetos han de seleccionarse de un conjunto mayor.

* Jugar el “Número tapado”, consiste en colocar una serie de cartas del 1 al 9, se pide al niño que cierre los ojos y se le da la vuelta a una de ellas ocultando el número. Después, se les pide (señalando la carta anterior) que digan cuál es el número siguiente. Una versión más elaborada  supone dar la vuelta a todas las cartas y levantar solo una de ellas. Entonces se pide al niño que diga cuál es el número que va después.
"

# 72 a 77 

elsif @test.edad.between?(72, 77) && @test.pi_num > 16 then
  @f = "El/la estudiante ha adquirido las habilidades de numeración por encima de lo esperado para la edad que posee.
Algunas recomendaciones para practicar lo aprendido y/o generar nuevos aprendizajes:


* Los niños deben aprender  que después de un número terminado en 9, hay un cambio a la decena siguiente, y una vez que el cambio se ha producido, simplemente se añaden los números del 1 al 9.

* Dar oportunidad a los niños para que identifiquen los errores de conteo de los adultos. Los niños pequeños encuentran sorprendente y divertido que los adultos cometan errores y disfrutan señalándolos. El adulto tiene que producir deliberadamente errores de conteo para que el niño los identifique y corrija.

* Jugar con el niño tirando un dado (para mayor complejidad pueden usar más dados) para determinar qué número de objetos han de seleccionarse de un conjunto mayor.

* Jugar el “Número tapado”, consiste en colocar una serie de cartas del 1 al 9 o más, se pide al niño que cierre los ojos y se le da la vuelta a una de ellas ocultando el número. Después, se les pide (señalando la carta anterior) que digan cuál es el número siguiente. Una versión más elaborada  supone dar la vuelta a todas las cartas y levantar solo una de ellas. Entonces se pide al niño que diga cuál es el número que va después.

* Para que practiquen el conteo de 10 en 10 se puede jugar un juego en el que los niños tienen que contar con rapidez objetos agrupados en colecciones de diez. Si se prima la velocidad, los niños aprenden rápidamente a contar de 10 en 10.
"

elsif @test.edad.between?(72, 77) && @test.pi_num.between?(13, 16) then
  @f = "El/la estudiante ha adquirido las habilidades de numeración de acuerdo a lo esperado para la edad que posee.
Algunas recomendaciones para mejorar lo aprendido:


* Los niños deben aprender  que después de un número terminado en 9, hay un cambio a la decena siguiente, y una vez que el cambio se ha producido, simplemente se añaden los números del 1 al 9.

* Dar oportunidad a los niños para que identifiquen los errores de conteo de los adultos. Los niños pequeños encuentran sorprendente y divertido que los adultos cometan errores y disfrutan señalándolos. El adulto tiene que producir deliberadamente errores de conteo para que el niño los identifique y corrija.

* Jugar con el niño tirando un dado (para mayor complejidad pueden usar más dados) para determinar qué número de objetos han de seleccionarse de un conjunto mayor.

* Jugar el “Número tapado”, consiste en colocar una serie de cartas del 1 al 9 o más, se pide al niño que cierre los ojos y se le da la vuelta a una de ellas ocultando el número. Después, se les pide (señalando la carta anterior) que digan cuál es el número siguiente. Una versión más elaborada  supone dar la vuelta a todas las cartas y levantar solo una de ellas. Entonces se pide al niño que diga cuál es el número que va después.
"

elsif @test.edad.between?(72, 77) && @test.pi_num < 13 then
  @f = "El/la estudiante se encuentra en proceso de adquirir las habilidades de numeración de acuerdo a lo esperado para la edad que posee.
Algunas recomendaciones para apoyar al estudiante:
 

 * Se puede ayudar al niño a aprender la secuencia numérica (sobre todo los primeros 15 números que deben ser memorizados) con rimas infantiles e historias. Luego del 15 hay un patrón para los números y la idea es ayudar al niño a que aprenda las reglas para crear los números. 
 
 * Dar oportunidad a los niños para que identifiquen los errores de conteo de los adultos. Los niños pequeños encuentran sorprendente y divertido que los adultos cometan errores y disfrutan señalándolos. El adulto tiene que producir deliberadamente errores de conteo para que el niño los identifique y corrija.
 
 * Jugar con el niño tirando un dado (para mayor complejidad pueden usar más dados) para determinar qué número de objetos han de seleccionarse de un conjunto mayor.
 
 * Jugar el “Número tapado”, consiste en colocar una serie de cartas del 1 al 9, se pide al niño que cierre los ojos y se le da la vuelta a una de ellas ocultando el número. Después, se les pide (señalando la carta anterior) que digan cuál es el número siguiente. Una versión más elaborada  supone dar la vuelta a todas las cartas y levantar solo una de ellas. Entonces se pide al niño que diga cuál es el número que va después.
"


# 78 a 83

elsif @test.edad.between?(78, 83) && @test.pi_num > 17 then
  @f = "El/la estudiante ha adquirido las habilidades de numeración por encima de lo esperado para la edad que posee.
Algunas recomendaciones para practicar lo aprendido y/o generar nuevos aprendizajes:


* Los niños deben aprender  que después de un número terminado en 9, hay un cambio a la decena siguiente, y una vez que el cambio se ha producido, simplemente se añaden los números del 1 al 9.

* Dar oportunidad a los niños para que identifiquen los errores de conteo de los adultos. Los niños pequeños encuentran sorprendente y divertido que los adultos cometan errores y disfrutan señalándolos. El adulto tiene que producir deliberadamente errores de conteo para que el niño los identifique y corrija.

* Jugar con el niño tirando un dado (para mayor complejidad pueden usar más dados) para determinar qué número de objetos han de seleccionarse de un conjunto mayor.

* Jugar el “Número tapado”, consiste en colocar una serie de cartas del 1 al 9 o más, se pide al niño que cierre los ojos y se le da la vuelta a una de ellas ocultando el número. Después, se les pide (señalando la carta anterior) que digan cuál es el número siguiente. Una versión más elaborada  supone dar la vuelta a todas las cartas y levantar solo una de ellas. Entonces se pide al niño que diga cuál es el número que va después.

* Para que practiquen el conteo de 10 en 10 se puede jugar un juego en el que los niños tienen que contar con rapidez objetos agrupados en colecciones de diez. Si se prima la velocidad, los niños aprenden rápidamente a contar de 10 en 10.
"

elsif @test.edad.between?(78, 83) && @test.pi_num.between?(15, 17) then
  @f = "El/la estudiante ha adquirido las habilidades de numeración de acuerdo a lo esperado para la edad que posee.
Algunas recomendaciones para mejorar lo aprendido:


* Los niños deben aprender  que después de un número terminado en 9, hay un cambio a la decena siguiente, y una vez que el cambio se ha producido, simplemente se añaden los números del 1 al 9.

* Dar oportunidad a los niños para que identifiquen los errores de conteo de los adultos. Los niños pequeños encuentran sorprendente y divertido que los adultos cometan errores y disfrutan señalándolos. El adulto tiene que producir deliberadamente errores de conteo para que el niño los identifique y corrija.

* Jugar con el niño tirando un dado (para mayor complejidad pueden usar más dados) para determinar qué número de objetos han de seleccionarse de un conjunto mayor.

* Jugar el “Número tapado”, consiste en colocar una serie de cartas del 1 al 9 o más, se pide al niño que cierre los ojos y se le da la vuelta a una de ellas ocultando el número. Después, se les pide (señalando la carta anterior) que digan cuál es el número siguiente. Una versión más elaborada  supone dar la vuelta a todas las cartas y levantar solo una de ellas. Entonces se pide al niño que diga cuál es el número que va después.
"

elsif @test.edad.between?(78, 83) && @test.pi_num < 15 then
  @f = "El/la estudiante se encuentra en proceso de adquirir las habilidades de numeración de acuerdo a lo esperado para la edad que posee.
Algunas recomendaciones para apoyar al estudiante:
 

 * Se puede ayudar al niño a aprender la secuencia numérica (sobre todo los primeros 15 números que deben ser memorizados) con rimas infantiles e historias. Luego del 15 hay un patrón para los números y la idea es ayudar al niño a que aprenda las reglas para crear los números. 
 
 * Dar oportunidad a los niños para que identifiquen los errores de conteo de los adultos. Los niños pequeños encuentran sorprendente y divertido que los adultos cometan errores y disfrutan señalándolos. El adulto tiene que producir deliberadamente errores de conteo para que el niño los identifique y corrija.
 
 * Jugar con el niño tirando un dado (para mayor complejidad pueden usar más dados) para determinar qué número de objetos han de seleccionarse de un conjunto mayor.
 
 * Jugar el “Número tapado”, consiste en colocar una serie de cartas del 1 al 9, se pide al niño que cierre los ojos y se le da la vuelta a una de ellas ocultando el número. Después, se les pide (señalando la carta anterior) que digan cuál es el número siguiente. Una versión más elaborada  supone dar la vuelta a todas las cartas y levantar solo una de ellas. Entonces se pide al niño que diga cuál es el número que va después.
"


# 84 a 95

elsif @test.edad.between?(84, 95) && @test.pi_num > 18 then
  @f = "El/la estudiante ha adquirido las habilidades de numeración por encima de lo esperado para la edad que posee.
Algunas recomendaciones para practicar lo aprendido y/o generar nuevos aprendizajes:


* Después de conocer las reglas de los números hasta el 99, la tarea principal de los estudiantes es aprender que el número siguiente es 100, y que se vuelven a aplicar el mismo tipo de reglas para producir los números superiores a 100. La regla básica es empezar con la etiqueta de las centenas (en este caso “ciento”), después se sigue con la etiqueta de las decenas (“veinte”, “treinta”, etc.) y se le añaden las unidades (uno, dos…).  

* Dar oportunidad a los niños para que identifiquen los errores de conteo de los adultos. Los niños pequeños encuentran sorprendente y divertido que los adultos cometan errores y disfrutan señalándolos. El adulto tiene que producir deliberadamente errores de conteo para que el niño los identifique y corrija.

* Practicar secuencias de conteo con un patrón establecido, de 4 en 4, de 6 en 6, etc.
"

elsif @test.edad.between?(84, 95) && @test.pi_num.between?(16, 18) then
  @f = "El/la estudiante ha adquirido las habilidades de numeración de acuerdo a lo esperado para la edad que posee.
Algunas recomendaciones para mejorar lo aprendido:


* Después de conocer las reglas de los números hasta el 99, la tarea principal de los estudiantes es aprender que el número siguiente es 100, y que se vuelven a aplicar el mismo tipo de reglas para producir los números superiores a 100. La regla básica es empezar con la etiqueta de las centenas (en este caso “ciento”), después se sigue con la etiqueta de las decenas (“veinte”, “treinta”, etc.) y se le añaden las unidades (uno, dos…).  

* Dar oportunidad a los niños para que identifiquen los errores de conteo de los adultos. Los niños pequeños encuentran sorprendente y divertido que los adultos cometan errores y disfrutan señalándolos. El adulto tiene que producir deliberadamente errores de conteo para que el niño los identifique y corrija.

* Practicar secuencias de conteo con un patrón establecido, de 4 en 4, de 6 en 6, etc.
"

elsif @test.edad.between?(84, 95) && @test.pi_num < 16 then
  @f = "El/la estudiante se encuentra en proceso de adquirir las habilidades de numeración de acuerdo a lo esperado para la edad que posee.
Algunas recomendaciones para apoyar al estudiante:


* Los niños deben aprender  que después de un número terminado en 9, hay un cambio a la decena siguiente, y una vez que el cambio se ha producido, simplemente se añaden los números del 1 al 9.

* Después de conocer las reglas de los números hasta el 99, la tarea principal de los estudiantes es aprender que el número siguiente es 100, y que se vuelven a aplicar el mismo tipo de reglas para producir los números superiores a 100. La regla básica es empezar con la etiqueta de las centenas (en este caso “ciento”), después se sigue con la etiqueta de las decenas (“veinte”, “treinta”, etc.) y se le añaden las unidades (uno, dos…).  

* Dar oportunidad a los niños para que identifiquen los errores de conteo de los adultos. Los niños pequeños encuentran sorprendente y divertido que los adultos cometan errores y disfrutan señalándolos. El adulto tiene que producir deliberadamente errores de conteo para que el niño los identifique y corrija.

* Para que practiquen el conteo de 10 en 10 se puede jugar un juego en el que los niños tienen que contar con rapidez objetos agrupados en colecciones de diez. Si se prima la velocidad, los niños aprenden rápidamente a contar de 10 en 10.
"



# 96 a 101

elsif @test.edad.between?(96, 101) && @test.pi_num > 19 then
  @f = "El/la estudiante ha adquirido las habilidades de numeración de acuerdo a lo esperado para la edad que posee.
Algunas recomendaciones para mejorar lo aprendido:


* Después de conocer las reglas de los números hasta el 99, la tarea principal de los estudiantes es aprender que el número siguiente es 100, y que se vuelven a aplicar el mismo tipo de reglas para producir los números superiores a 100. La regla básica es empezar con la etiqueta de las centenas (en este caso “ciento”), después se sigue con la etiqueta de las decenas (“veinte”, “treinta”, etc.) y se le añaden las unidades (uno, dos…).  

* Dar oportunidad a los niños para que identifiquen los errores de conteo de los adultos. Los niños pequeños encuentran sorprendente y divertido que los adultos cometan errores y disfrutan señalándolos. El adulto tiene que producir deliberadamente errores de conteo para que el niño los identifique y corrija.

* Practicar secuencias de conteo con un patrón establecido, de 4 en 4, de 6 en 6, etc.
"

elsif @test.edad.between?(96, 101) && @test.pi_num < 20 then
  @f = "El/la estudiante se encuentra en proceso de adquirir las habilidades de numeración de acuerdo a lo esperado para la edad que posee.
Algunas recomendaciones para apoyar al estudiante:


* Los niños deben aprender  que después de un número terminado en 9, hay un cambio a la decena siguiente, y una vez que el cambio se ha producido, simplemente se añaden los números del 1 al 9.

* Después de conocer las reglas de los números hasta el 99, la tarea principal de los estudiantes es aprender que el número siguiente es 100, y que se vuelven a aplicar el mismo tipo de reglas para producir los números superiores a 100. La regla básica es empezar con la etiqueta de las centenas (en este caso “ciento”), después se sigue con la etiqueta de las decenas (“veinte”, “treinta”, etc.) y se le añaden las unidades (uno, dos…).  

* Dar oportunidad a los niños para que identifiquen los errores de conteo de los adultos. Los niños pequeños encuentran sorprendente y divertido que los adultos cometan errores y disfrutan señalándolos. El adulto tiene que producir deliberadamente errores de conteo para que el niño los identifique y corrija.

* Para que practiquen el conteo de 10 en 10 se puede jugar un juego en el que los niños tienen que contar con rapidez objetos agrupados en colecciones de diez. Si se prima la velocidad, los niños aprenden rápidamente a contar de 10 en 10.
"
end

# Comparación de cantidades

# 60 a 71

if @test.edad.between?(60, 71) && @test.pi_comp > 3 then
  @g= "El/la estudiante ha adquirido las habilidades de comparación de cantidades por encima de lo esperado para la edad que posee.
Algunas recomendaciones para practicar lo aprendido y/o generar nuevos aprendizajes:


* Presentar al niño tareas de comparación de conjuntos de objetos y pedirle que diga dónde hay “más”. Una vez que el estudiante ha practicado durante un tiempo se debe prescindir de los objetos y plantear la tarea oralmente. Puede ir incrementando los números para que la tarea sea más compleja para el estudiante.

* Presentar al niño una línea numérica escrita en el piso (del 1 al 10, por ejemplo) y preguntarle dónde se necesitan más pasos: del 2 al 9 o del 2 al 4. También se podría utilizar una regla para realizar este ejercicio. Esta experiencia con líneas numéricas físicas le ayudará al niño a interiorizar la línea numérica mental. 
"

elsif @test.edad.between?(60, 71) && @test.pi_comp.between?(2, 3) then
  @g = "El/la estudiante ha adquirido las habilidades de comparación de cantidades de acuerdo a lo esperado para su edad.
Algunas recomendaciones para mejorar lo aprendido:


* Presentar al niño tareas de comparación de conjuntos de objetos y pedirle que diga dónde hay “más”. Los objetos pueden alinearse uno al lado del otro, de esta manera, el estudiante puede aprender que la colección a la que le “sobra algo”, al ponerla en relación por correspondencia uno a uno, es la que tiene “más”. Una vez que el estudiante ha practicado durante un tiempo se debe prescindir de los objetos y plantear la tarea oralmente.

* Presentar al niño una línea numérica escrita en el piso (del 1 al 10, por ejemplo) y preguntarle dónde se necesitan más pasos: del 2 al 9 o del 2 al 4. También se podría utilizar una regla para realizar este ejercicio. Esta experiencia con líneas numéricas físicas le ayudará al niño a interiorizar la línea numérica mental. 
"

elsif @test.edad.between?(60, 71) && @test.pi_comp < 2 then
  @g = "El/la estudiante se encuentra en proceso de adquirir las habilidades de comparación de cantidades de acuerdo a lo esperado para la edad que posee.
Algunas recomendaciones para apoyar al estudiante:


* Presentar al niño tareas de comparación de conjuntos de objetos y pedirle que diga dónde hay “más”. Los objetos pueden alinearse uno al lado del otro, de esta manera, el estudiante puede aprender que la colección a la que le “sobra algo”, al ponerla en relación por correspondencia uno a uno, es la que tiene “más”. Una vez que el estudiante ha practicado durante un tiempo se debe prescindir de los objetos y plantear la tarea oralmente.
"


# 72 a 77 

elsif @test.edad.between?(72, 77) && @test.pi_comp > 4 then
  @g= "El/la estudiante ha adquirido las habilidades de comparación de cantidades por encima de lo esperado para la edad que posee.
Algunas recomendaciones para practicar lo aprendido y/o generar nuevos aprendizajes:


* Presentar al niño tareas de comparación de conjuntos de objetos y pedirle que diga dónde hay “más”. Una vez que el estudiante ha practicado durante un tiempo se debe prescindir de los objetos y plantear la tarea oralmente. Puede ir incrementando los números para que la tarea sea más compleja para el estudiante o pedirle que diga dónde hay “menos”.

* Presentar al niño una línea numérica escrita en el piso (del 1 al 10, por ejemplo) y preguntarle dónde se necesitan más pasos: del 2 al 9 o del 2 al 4. También se podría utilizar una regla para realizar este ejercicio. Esta experiencia con líneas numéricas físicas le ayudará al niño a interiorizar la línea numérica mental. Una vez que el niño se haya familiarizado con esto, debería pasar a trabajar con números del 1 al 100. 
"

elsif @test.edad.between?(72, 77) && @test.pi_comp = 4 then
  @g = "El/la estudiante ha adquirido las habilidades de comparación de cantidades de acuerdo a lo esperado para su edad.
Algunas recomendaciones para mejorar lo aprendido:


* Presentar al niño tareas de comparación de conjuntos de objetos y pedirle que diga dónde hay “más”. Una vez que el estudiante ha practicado durante un tiempo se debe prescindir de los objetos y plantear la tarea oralmente. Puede ir incrementando los números para que la tarea sea más compleja para el estudiante o pedirle que diga dónde hay “menos”.

* Presentar al niño una línea numérica escrita en el piso (del 1 al 10, por ejemplo) y preguntarle dónde se necesitan más pasos: del 2 al 9 o del 2 al 4. También se podría utilizar una regla para realizar este ejercicio. Esta experiencia con líneas numéricas físicas le ayudará al niño a interiorizar la línea numérica mental. Una vez que el niño se haya familiarizado con esto, debería pasar a trabajar con números del 1 al 100. 
"

elsif @test.edad.between?(72, 77) && @test.pi_comp < 4 then
  @g = "El/la estudiante se encuentra en proceso de adquirir las habilidades de comparación de cantidades de acuerdo a lo esperado para la edad que posee.
Algunas recomendaciones para apoyar al estudiante:


* Presentar al niño tareas de comparación de conjuntos de objetos y pedirle que diga dónde hay “más”. Los objetos pueden alinearse uno al lado del otro, de esta manera, el estudiante puede aprender que la colección a la que le “sobra algo”, al ponerla en relación por correspondencia uno a uno, es la que tiene “más”. Una vez que el estudiante ha practicado durante un tiempo se debe prescindir de los objetos y plantear la tarea oralmente.

* Presentar al niño una línea numérica escrita en el piso (del 1 al 10, por ejemplo) y preguntarle dónde se necesitan más pasos: del 2 al 9 o del 2 al 4. También se podría utilizar una regla para realizar este ejercicio. Esta experiencia con líneas numéricas físicas le ayudará al niño a interiorizar la línea numérica mental.
"


# 78 a83

elsif @test.edad.between?(78, 83) && @test.pi_comp > 3 then
  @g= "El/la estudiante ha adquirido las habilidades de comparación de cantidades de acuerdo a lo esperado para su edad.
Algunas recomendaciones para mejorar lo aprendido:


* Presentar al niño tareas de comparación de conjuntos de objetos y pedirle que diga dónde hay “más”. Una vez que el estudiante ha practicado durante un tiempo se debe prescindir de los objetos y plantear la tarea oralmente. Puede ir incrementando los números para que la tarea sea más compleja para el estudiante o pedirle que diga dónde hay “menos”.

* Presentar al niño una línea numérica escrita en el piso (del 1 al 10, por ejemplo) y preguntarle dónde se necesitan más pasos: del 2 al 9 o del 2 al 4. También se podría utilizar una regla para realizar este ejercicio. Esta experiencia con líneas numéricas físicas le ayudará al niño a interiorizar la línea numérica mental. Una vez que el niño se haya familiarizado con esto, debería pasar a trabajar con números del 1 al 100. 
"

elsif @test.edad.between?(78, 83) && @test.pi_comp < 4 then
  @g = "El/la estudiante se encuentra en proceso de adquirir las habilidades de comparación de cantidades de acuerdo a lo esperado para la edad que posee.
Algunas recomendaciones para apoyar al estudiante:


* Presentar al niño tareas de comparación de conjuntos de objetos y pedirle que diga dónde hay “más”. Los objetos pueden alinearse uno al lado del otro, de esta manera, el estudiante puede aprender que la colección a la que le “sobra algo”, al ponerla en relación por correspondencia uno a uno, es la que tiene “más”. Una vez que el estudiante ha practicado durante un tiempo se debe prescindir de los objetos y plantear la tarea oralmente.

* Presentar al niño una línea numérica escrita en el piso (del 1 al 10, por ejemplo) y preguntarle dónde se necesitan más pasos: del 2 al 9 o del 2 al 4. También se podría utilizar una regla para realizar este ejercicio. Esta experiencia con líneas numéricas físicas le ayudará al niño a interiorizar la línea numérica mental.
"


# 84 a 95

elsif @test.edad.between?(84, 95) && @test.pi_comp > 3 then
  @g= "El/la estudiante ha adquirido las habilidades de comparación de cantidades de acuerdo a lo esperado para su edad.
Algunas recomendaciones para mejorar lo aprendido:


* Presentar al niño el juego “desapareciendo números”, el cual consiste en representar números del 1 al 10 como una escalera de bloques. Cada bloque puede representar un grupo de 10, de manera que los números implicados sean ahora el 10, 20, 30,... 100. Esto le permite al niño de manera gráfica saber “lo lejos” que están los números entre sí y permite calcular la distancia con facilidad. El siguiente paso supone considerar el conjunto global de números entre el 1 y el 100. Para esto se puede utilizar un metro. El niño tiene que llegar a valorar las distancias relativas entre varias posiciones en el metro. 
"

elsif @test.edad.between?(84, 95) && @test.pi_comp < 4 then
  @g = "El/la estudiante se encuentra en proceso de adquirir las habilidades de comparación de cantidades de acuerdo a lo esperado para la edad que posee.
Algunas recomendaciones para apoyar al estudiante:


* Presentar al niño tareas de comparación de conjuntos de objetos y pedirle que diga dónde hay “más”. Una vez que el estudiante ha practicado durante un tiempo se debe prescindir de los objetos y plantear la tarea oralmente. Puede ir incrementando los números para que la tarea sea más compleja para el estudiante o pedirle que diga dónde hay “menos”.

* Presentar al niño el juego “desapareciendo números”, el cual consiste en representar números del 1 al 10 como una escalera de bloques. Cada bloque puede representar un grupo de 10, de manera que los números implicados sean ahora el 10, 20, 30,... 100. Esto le permite al niño de manera gráfica saber “lo lejos” que están los números entre sí y permite calcular la distancia con facilidad. 
"


# 96 a 101

elsif @test.edad.between?(96, 101) && @test.pi_comp > 4 then
  @g= "El/la estudiante ha adquirido las habilidades de comparación de cantidades de acuerdo a lo esperado para su edad.
Algunas recomendaciones para mejorar lo aprendido:


* Presentar al niño el juego “desapareciendo números”, el cual consiste en representar números del 1 al 10 como una escalera de bloques. Cada bloque puede representar un grupo de 10, de manera que los números implicados sean ahora el 10, 20, 30,... 100. Esto le permite al niño de manera gráfica saber “lo lejos” que están los números entre sí y permite calcular la distancia con facilidad. El siguiente paso supone considerar el conjunto global de números entre el 1 y el 100. Para esto se puede utilizar un metro. El niño tiene que llegar a valorar las distancias relativas entre varias posiciones en el metro. 
"


elsif @test.edad.between?(96, 101) && @test.pi_comp < 5 then
  @g = "El/la estudiante se encuentra en proceso de adquirir las habilidades de comparación de cantidades de acuerdo a lo esperado para la edad que posee.
Algunas recomendaciones para apoyar al estudiante:


* Presentar al niño tareas de comparación de conjuntos de objetos y pedirle que diga dónde hay “más”. Una vez que el estudiante ha practicado durante un tiempo se debe prescindir de los objetos y plantear la tarea oralmente. Puede ir incrementando los números para que la tarea sea más compleja para el estudiante o pedirle que diga dónde hay “menos”.

* Presentar al niño el juego “desapareciendo números”, el cual consiste en representar números del 1 al 10 como una escalera de bloques. Cada bloque puede representar un grupo de 10, de manera que los números implicados sean ahora el 10, 20, 30,... 100. Esto le permite al niño de manera gráfica saber “lo lejos” que están los números entre sí y permite calcular la distancia con facilidad. 
"
  
end




# Cálculo Informal 

# 60 a 65

if @test.edad.between?(60, 65) && @test.pi_cal > 3 then
  @h= "El/la estudiante ha adquirido las habilidades de cálculo informal por encima de lo esperado para la edad que posee.
Algunas recomendaciones para practicar lo aprendido y/o generar nuevos aprendizajes:


* Deben aprender que contar es un buen método para sumar y después aprenderán la manera eficaz de hacerlo. Una vez dominado esto, hay que intentar que entienda que no es necesario contar todos los objetos. Es más eficaz contar a partir del número mayor. Una vez logrado esto, se puede retirar el material concreto y animar al niño a realizar la actividad mentalmente.
"

elsif @test.edad.between?(60, 65) && @test.pi_cal.between?(2, 3) then
  @h = "El/la estudiante ha adquirido las habilidades de cálculo informal de acuerdo a lo esperado para su edad.
Algunas recomendaciones para mejorar lo aprendido:


* Las sumas pueden plantearse como historias sencillas, pero poniendo énfasis en que lo principal es la suma. Si la historia es sobre un niño que empieza con manzanas y consigue una más, debe enfatizarse que no es un asunto de cómo son las manzanas, sino que empieza con 2 cosas y se añade una más. También es importante que el niño aprenda que puede usar material concreto para resolver el problema. Cada bloque, dedo o ficha representa un objeto de la historia; después puede contar los objetos para hallar la solución. 

* El objetivo es demostrar al niño el uso del conteo en la resolución de problemas de suma. Es decir, primero deben aprender que contar es un buen método para sumar y después aprenderán la manera eficaz de hacerlo. Una vez logrado esto, se puede retirar el material concreto y animar al niño a realizar la actividad mentalmente.   
"

elsif @test.edad.between?(60, 65) && @test.pi_cal < 2 then
  @h = "El/la estudiante se encuentra en proceso de adquirir las habilidades de cálculo informal de acuerdo a lo esperado para la edad que posee.
Algunas recomendaciones para apoyar al estudiante:


* Hacer que el niño cuente todos los objetos reales para sumar o restar. Por ejemplo, se le puede mostrar una colección de 3 carros y otra colección de 4 carros, y pedirle que las sume contando los carros para averiguar cuántos hay en total. También se le puede mostrar los 4 carros de una colección y pedirle que quite 1, y que después cuente para averiguar cuántos quedan. Poco a poco, y a medida que el niño vaya logrando algunos éxitos, se puede empezar a esconder uno de los conjuntos, y pedirle que haga la suma o la resta sin mirar ese conjunto.

* Las sumas pueden plantearse como historias sencillas, pero poniendo énfasis en que lo principal es la suma. Si la historia es sobre un niño que empieza con manzanas y consigue una más, debe enfatizarse que no es un asunto de cómo son las manzanas, sino que empieza con 2 cosas y se añade una más. También es importante que el niño aprenda que puede usar material concreto para resolver el problema. Cada bloque, dedo o ficha representa un objeto de la historia; después puede contar los objetos para hallar la solución. 
"


# 66 a 71

elsif @test.edad.between?(66, 71) && @test.pi_cal > 4 then
  @h= "El/la estudiante ha adquirido las habilidades de cálculo informal por encima de lo esperado para la edad que posee.
Algunas recomendaciones para practicar lo aprendido y/o generar nuevos aprendizajes:


* Deben aprender que contar es un buen método para sumar y después aprenderán la manera eficaz de hacerlo. Una vez dominado esto, hay que intentar que entienda que no es necesario contar todos los objetos. Es más eficaz contar a partir del número mayor. Una vez logrado esto, se puede retirar el material concreto y animar al niño a realizar la actividad mentalmente.
"

elsif @test.edad.between?(66, 71) && @test.pi_cal.between?(3, 4) then
  @h = "El/la estudiante ha adquirido las habilidades de cálculo informal de acuerdo a lo esperado para su edad.
Algunas recomendaciones para mejorar lo aprendido:


* Las sumas pueden plantearse como historias sencillas, pero poniendo énfasis en que lo principal es la suma. Si la historia es sobre un niño que empieza con manzanas y consigue una más, debe enfatizarse que no es un asunto de cómo son las manzanas, sino que empieza con 2 cosas y se añade una más. También es importante que el niño aprenda que puede usar material concreto para resolver el problema. Cada bloque, dedo o ficha representa un objeto de la historia; después puede contar los objetos para hallar la solución. 

* El objetivo es demostrar al niño el uso del conteo en la resolución de problemas de suma. Es decir, primero deben aprender que contar es un buen método para sumar y después aprenderán la manera eficaz de hacerlo. Una vez logrado esto, se puede retirar el material concreto y animar al niño a realizar la actividad mentalmente.   
"

elsif @test.edad.between?(66, 71) && @test.pi_cal < 3 then
  @h = "El/la estudiante se encuentra en proceso de adquirir las habilidades de cálculo informal de acuerdo a lo esperado para la edad que posee.
Algunas recomendaciones para apoyar al estudiante:


* Hacer que el niño cuente todos los objetos reales para sumar o restar. Por ejemplo, se le puede mostrar una colección de 3 carros y otra colección de 4 carros, y pedirle que las sume contando los carros para averiguar cuántos hay en total. También se le puede mostrar los 4 carros de una colección y pedirle que quite 1, y que después cuente para averiguar cuántos quedan. Poco a poco, y a medida que el niño vaya logrando algunos éxitos, se puede empezar a esconder uno de los conjuntos, y pedirle que haga la suma o la resta sin mirar ese conjunto.

* Las sumas pueden plantearse como historias sencillas, pero poniendo énfasis en que lo principal es la suma. Si la historia es sobre un niño que empieza con manzanas y consigue una más, debe enfatizarse que no es un asunto de cómo son las manzanas, sino que empieza con 2 cosas y se añade una más. También es importante que el niño aprenda que puede usar material concreto para resolver el problema. Cada bloque, dedo o ficha representa un objeto de la historia; después puede contar los objetos para hallar la solución. 
"


# 72 a 77 

elsif @test.edad.between?(72, 77) && @test.pi_cal > 4 then
  @h= "El/la estudiante ha adquirido las habilidades de cálculo informal por encima de lo esperado para la edad que posee.
Algunas recomendaciones para practicar lo aprendido y/o generar nuevos aprendizajes:


* Para ayudar al niño a realizar sumas mentales, primero se debe empezar por resolver la tarea de suma con material manipulable concreto, como bloques, fichas o dedos, de forma que el niño pueda contar objetos para obtener la solución. Hay que intentar que entienda que no es necesario contar todos los objetos. Es más eficaz contar a partir del número mayor. Una vez que lo haya superado, se retira el material concreto y la tarea debe realizarse de forma mental.
"

elsif @test.edad.between?(72, 77) && @test.pi_cal = 4 then
  @h = "El/la estudiante ha adquirido las habilidades de cálculo informal de acuerdo a lo esperado para su edad.
Algunas recomendaciones para mejorar lo aprendido:


* Para ayudar al niño a realizar sumas mentales, primero se debe empezar por resolver la tarea de suma con material manipulable concreto, como bloques, fichas o dedos, de forma que el niño pueda contar objetos para obtener la solución. Hay que intentar que entienda que no es necesario contar todos los objetos. Es más eficaz contar a partir del número mayor. Una vez que lo haya superado, se retira el material concreto y la tarea debe realizarse de forma mental.
"

elsif @test.edad.between?(72, 77) && @test.pi_cal < 4 then
  @h = "El/la estudiante se encuentra en proceso de adquirir las habilidades de cálculo informal de acuerdo a lo esperado para la edad que posee.
Algunas recomendaciones para apoyar al estudiante:


* Las sumas pueden plantearse como historias sencillas, pero poniendo énfasis en que lo principal es la suma. Si la historia es sobre un niño que empieza con manzanas y consigue una más, debe enfatizarse que no es un asunto de cómo son las manzanas, sino que empieza con 2 cosas y se añade una más. También es importante que el niño aprenda que puede usar material concreto para resolver el problema. Cada bloque, dedo o ficha representa un objeto de la historia; después puede contar los objetos para hallar la solución. 

* El objetivo es demostrar al niño el uso del conteo en la resolución de problemas de suma. Es decir, primero deben aprender que contar es un buen método para sumar y después aprenderán la manera eficaz de hacerlo. Una vez logrado esto, se puede retirar el material concreto y animar al niño a realizar la actividad mentalmente.  
"


# 78 a83

elsif @test.edad.between?(78, 83) && @test.pi_cal > 3 then
  @h= "El/la estudiante ha adquirido las habilidades de cálculo informal de acuerdo a lo esperado para su edad.
Algunas recomendaciones para mejorar lo aprendido:


* Para ayudar al niño a realizar sumas mentales, primero se debe empezar por resolver la tarea de suma con material manipulable concreto, como bloques, fichas o dedos, de forma que el niño pueda contar objetos para obtener la solución. Hay que intentar que entienda que no es necesario contar todos los objetos. Es más eficaz contar a partir del número mayor. Una vez que lo haya superado, se retira el material concreto y la tarea debe realizarse de forma mental.
"


elsif @test.edad.between?(78, 83) && @test.pi_cal < 4 then
  @h = "El/la estudiante se encuentra en proceso de adquirir las habilidades de cálculo informal de acuerdo a lo esperado para la edad que posee.
Algunas recomendaciones para apoyar al estudiante:


* Las sumas pueden plantearse como historias sencillas, pero poniendo énfasis en que lo principal es la suma. Si la historia es sobre un niño que empieza con manzanas y consigue una más, debe enfatizarse que no es un asunto de cómo son las manzanas, sino que empieza con 2 cosas y se añade una más. También es importante que el niño aprenda que puede usar material concreto para resolver el problema. Cada bloque, dedo o ficha representa un objeto de la historia; después puede contar los objetos para hallar la solución. 

* El objetivo es demostrar al niño el uso del conteo en la resolución de problemas de suma. Es decir, primero deben aprender que contar es un buen método para sumar y después aprenderán la manera eficaz de hacerlo. Una vez logrado esto, se puede retirar el material concreto y animar al niño a realizar la actividad mentalmente.  
"




# 84 a 101

elsif @test.edad.between?(84, 101) && @test.pi_cal > 3 then
  @h= "El/la estudiante ha adquirido las habilidades de cálculo informal de acuerdo a lo esperado para su edad.
Algunas recomendaciones para practicar lo aprendido y/o generar nuevos aprendizajes:


* Practicar sumas y restas mentales con cantidades mayores. Una vez mejorado el cálculo mental les puede servir como base del escrito. Por ejemplo, supongamos que el niño resuelve un problema del tipo 16 + 12 pensando: “diez y diez son veinte, y seis y dos son ocho, la respuesta es veintiocho”. Sumando primero las decenas y después las unidades, están explotando las propiedades claves del sistema de base diez.
"

elsif @test.edad.between?(84, 101) && @test.pi_cal < 4 then
  @h = "El/la estudiante se encuentra en proceso de adquirir las habilidades de cálculo informal de acuerdo a lo esperado para la edad que posee.
Algunas recomendaciones para apoyar al estudiante:


* Para ayudar al niño a realizar sumas mentales, primero se debe empezar por resolver la tarea del cálculo con material manipulable concreto, como bloques, fichas o dedos, de forma que el niño pueda contar objetos para obtener la solución. Hay que intentar que entienda que no es necesario contar todos los objetos. Es más eficaz contar a partir del número mayor. Una vez que lo haya superado, se retira el material concreto y la tarea debe realizarse de forma mental. 

* Practicar sumas y restas mentales con diversas cantidades. Una vez mejorado el cálculo mental les puede servir como base del escrito. Por ejemplo, supongamos que el niño resuelve un problema del tipo 16 + 12 pensando: “diez y diez son veinte, y seis y dos son ocho, la respuesta es veintiocho”. Sumando primero las decenas y después las unidades, están explotando las propiedades claves del sistema de base diez.
"
  
end




# Convencionalismos

# 60 a 71

if @test.edad.between?(60, 71) && @test.pf_conv > 1 then
  @i= "El/la estudiante ha adquirido las habilidades de lectura y escritura de cantidades de acuerdo a lo esperado para su edad.
Algunas recomendaciones para mejorar lo aprendido:


* Proporcionar al niño práctica en la escritura de números. El niño puede aprender a escribir los números copiándolos de un cuaderno y libro. El niño disfrutará copiándolos y luego decorándolos con colores y motivos alegres y variados. Solo necesitan la oportunidad de dedicarse libremente a dibujar y copiar, sin la necesidad de una instrucción. 

* Ofrecer al niño varios juegos que le proporcionen práctica con la lectura de números. Primero se le debe incentivar a que lean números de un dígito (por ejemplo, en un libro o cuaderno), pero una vez dominado esto se le debe enseñar las reglas para leer números de 2 dígitos. El niño debe saber que la posición es crucial: los números que indican las unidades están a la derecha, los números que indican las decenas están a su izquierda. Así, en 18, el 1 de la izquierda indica “diez” y el 8 de la derecha indica “ocho”. 
"

elsif @test.edad.between?(60, 71) && @test.pf_conv < 2 then
  @i = "El/la estudiante se encuentra en proceso de adquirir las habilidades de lectura y escritura de cantidades de acuerdo a lo esperado para la edad que posee.
Algunas recomendaciones para apoyar al estudiante:


* Darle al niño la oportunidad de que vea los números dibujados en libros bonitos, así aprenderán a leerlos. Estos libros deben ser ilustrados, agradables y apropiados para niños pequeños. También se le puede presentar juegos en los que el niño tenga que leer los dígitos para, por ejemplos, avanzar su posición. 

* Proporcionar al niño práctica en la escritura de números. El niño puede aprender a escribir los números copiándolos de un cuaderno y libro. El niño disfrutará copiándolos y luego decorándolos con colores y motivos alegres y variados. Solo necesitan la oportunidad de dedicarse libremente a dibujar y copiar, sin la necesidad de una instrucción. 
"


# 72 a 77 

elsif @test.edad.between?(72, 77) && @test.pf_conv > 4 then
  @i= "El/la estudiante ha adquirido las habilidades de lectura y escritura de cantidades por encima de lo esperado para la edad que posee.
Algunas recomendaciones para practicar lo aprendido y/o generar nuevos aprendizajes:


* Ofrecer al niño varios juegos que le proporcionen práctica con la lectura de números. Primero se le debe incentivar a que lean números de un dígito (por ejemplo, en un libro o cuaderno), pero una vez dominado esto se le debe enseñar las reglas para leer números de 2 dígitos. El niño debe saber que la posición es crucial: los números que indican las unidades están a la derecha, los números que indican las decenas están a su izquierda. Así, en 28, el 2 de la izquierda indica “veinte” y el 8 de la derecha indica “ocho”. 

* Pedirle al niño que con 2 dígitos construya el mayor número posible. Por ejemplo, dado el 2 y el 9, el niño puede escribir 29 o 92. 

* Una vez dominada la lectura y escritura de números con 2 dígitos, continuar con la lectura de números de 3 dígitos. El niño debe saber que la posición es crucial: los números que están a la derecha son las unidades, los que indican las decenas están al medio y los números que indican las centenas las que están a la izquierda. Así en 321, el 3 de la izquierda indica “trescientos”, el 2 del medio indica “veinte” y el 1 de la derecha indica “uno”. 

* Enseñar al niño con los errores que cometen otras personas. De esta manera, pueden ver que alguien escribe 200304 en lugar de 234 porque escriben los números como suenan. Normalmente resulta más fácil aprender del error cuando lo cometen otros. 
"

elsif @test.edad.between?(72, 77) && @test.pf_conv.between?(3, 4) then
  @i = "El/la estudiante ha adquirido las habilidades de lectura y escritura de cantidades de acuerdo a lo esperado para su edad.
Algunas recomendaciones para mejorar lo aprendido:


* Ofrecer al niño varios juegos que le proporcionen práctica con la lectura de números. Primero se le debe incentivar a que lean números de un dígito (por ejemplo, en un libro o cuaderno), pero una vez dominado esto se le debe enseñar las reglas para leer números de 2 dígitos. El niño debe saber que la posición es crucial: los números que indican las unidades están a la derecha, los números que indican las decenas están a su izquierda. Así, en 18, el 1 de la izquierda indica “diez” y el 8 de la derecha indica “ocho”. 
"

elsif @test.edad.between?(72, 77) && @test.pf_conv < 3 then
  @i = "El/la estudiante se encuentra en proceso de adquirir las habilidades de lectura y escritura de acuerdo a lo esperado para la edad que posee.
Algunas recomendaciones para apoyar al estudiante:


* Darle al niño la oportunidad de que vea los números dibujados en libros bonitos, así aprenderán a leerlos. Estos libros deben ser ilustrados, agradables y apropiados para niños pequeños. También se le puede presentar juegos en los que el niño tenga que leer los dígitos para, por ejemplos, avanzar su posición. 

* Proporcionar al niño práctica en la escritura de números. El niño puede aprender a escribir los números copiándolos de un cuaderno y libro. El niño disfrutará copiándolos y luego decorándolos con colores y motivos alegres y variados. Solo necesitan la oportunidad de dedicarse libremente a dibujar y copiar, sin la necesidad de una instrucción. 
"


# 78 a83

elsif @test.edad.between?(78, 83) && @test.pf_conv > 5 then
  @i= "El/la estudiante ha adquirido las habilidades de lectura y escritura de cantidades por encima de lo esperado para la edad que posee.
Algunas recomendaciones para practicar lo aprendido y/o generar nuevos aprendizajes:


* Ofrecer al niño varios juegos que le proporcionen práctica con la lectura de números. Primero se le debe incentivar a que lean números de un dígito (por ejemplo, en un libro o cuaderno), pero una vez dominado esto se le debe enseñar las reglas para leer números de 2 dígitos. El niño debe saber que la posición es crucial: los números que indican las unidades están a la derecha, los números que indican las decenas están a su izquierda. Así, en 28, el 2 de la izquierda indica “veinte” y el 8 de la derecha indica “ocho”. 

* Pedirle al niño que con 2 dígitos construya el mayor número posible. Por ejemplo, dado el 2 y el 9, el niño puede escribir 29 o 92. 

* Una vez dominada la lectura y escritura de números con 2 dígitos, continuar con la lectura de números de 3 dígitos. El niño debe saber que la posición es crucial: los números que están a la derecha son las unidades, los que indican las decenas están al medio y los números que indican las centenas las que están a la izquierda. Así en 321, el 3 de la izquierda indica “trescientos”, el 2 del medio indica “veinte” y el 1 de la derecha indica “uno”. 

* Enseñar al niño con los errores que cometen otras personas. De esta manera, pueden ver que alguien escribe 200304 en lugar de 234 porque escriben los números como suenan. Normalmente resulta más fácil aprender del error cuando lo cometen otros. 
"

elsif @test.edad.between?(78, 83) && @test.pf_conv.between?(4, 5) then
  @i = "El/la estudiante ha adquirido las habilidades de lectura y escritura de cantidades de acuerdo a lo esperado para su edad.
Algunas recomendaciones para mejorar lo aprendido:


* Ofrecer al niño varios juegos que le proporcionen práctica con la lectura de números. Primero se le debe incentivar a que lean números de un dígito (por ejemplo, en un libro o cuaderno), pero una vez dominado esto se le debe enseñar las reglas para leer números de 2 dígitos. El niño debe saber que la posición es crucial: los números que indican las unidades están a la derecha, los números que indican las decenas están a su izquierda. Así, en 18, el 1 de la izquierda indica “diez” y el 8 de la derecha indica “ocho”. 
"

elsif @test.edad.between?(78, 83) && @test.pf_conv < 4 then
  @i = "El/la estudiante se encuentra en proceso de adquirir las habilidades de lectura y escritura de acuerdo a lo esperado para la edad que posee.
Algunas recomendaciones para apoyar al estudiante:


* Darle al niño la oportunidad de que vea los números dibujados en libros bonitos, así aprenderán a leerlos. Estos libros deben ser ilustrados, agradables y apropiados para niños pequeños. También se le puede presentar juegos en los que el niño tenga que leer los dígitos para, por ejemplos, avanzar su posición. 

* Proporcionar al niño práctica en la escritura de números. El niño puede aprender a escribir los números copiándolos de un cuaderno y libro. El niño disfrutará copiándolos y luego decorándolos con colores y motivos alegres y variados. Solo necesitan la oportunidad de dedicarse libremente a dibujar y copiar, sin la necesidad de una instrucción. 
"


# 84 a 89

elsif @test.edad.between?(84, 89) && @test.pf_conv > 7 then
  @i= "El/la estudiante ha adquirido las habilidades de lectura y escritura de cantidades por encima de lo esperado para la edad que posee.
Algunas recomendaciones para practicar lo aprendido y/o generar nuevos aprendizajes:


* Una vez dominada la lectura y escritura de números con 2 dígitos, continuar con la lectura de números de 3 dígitos. El niño debe saber que la posición es crucial: los números que están a la derecha son las unidades, los que indican las decenas están al medio y los números que indican las centenas las que están a la izquierda. Así en 321, el 3 de la izquierda indica “trescientos”, el 2 del medio indica “veinte” y el 1 de la derecha indica “uno”. 

* Enseñar al niño con los errores que cometen otras personas. De esta manera, pueden ver que alguien escribe 200304 en lugar de 234 porque escriben los números como suenan. Normalmente resulta más fácil aprender del error cuando lo cometen otros. 

* Una vez dominada la lectura y escritura de números con 3 dígitos, continuar con la lectura de números de 3 dígitos siguiente los métodos descritos anteriormente. Nuevamente el niño debe saber que la posición es crucial: los números que están a la derecha de todo son las unidades, los que indican las decenas están justo a su izquierda, los números que indican las centenas están a la izquierda de las decenas y, por último, los números que indican los millares son los que están más a la izquierda. 
"

elsif @test.edad.between?(84, 89) && @test.pf_conv.between?(5, 7) then
  @i = "El/la estudiante ha adquirido las habilidades de lectura y escritura de cantidades de acuerdo a lo esperado para su edad.
Algunas recomendaciones para mejorar lo aprendido:


* Ofrecer al niño varios juegos que le proporcionen práctica con la lectura de números. Primero se le debe incentivar a que lean números de un dígito (por ejemplo, en un libro o cuaderno), pero una vez dominado esto se le debe enseñar las reglas para leer números de 2 dígitos. El niño debe saber que la posición es crucial: los números que indican las unidades están a la derecha, los números que indican las decenas están a su izquierda. Así, en 28, el 2 de la izquierda indica “veinte” y el 8 de la derecha indica “ocho”. 

* Pedirle al niño que con 2 dígitos construya el mayor número posible. Por ejemplo, dado el 2 y el 9, el niño puede escribir 29 o 92. 

* Una vez dominada la lectura y escritura de números con 2 dígitos, continuar con la lectura de números de 3 dígitos. El niño debe saber que la posición es crucial: los números que están a la derecha son las unidades, los que indican las decenas están al medio y los números que indican las centenas las que están a la izquierda. Así en 321, el 3 de la izquierda indica “trescientos”, el 2 del medio indica “veinte” y el 1 de la derecha indica “uno”. 

* Enseñar al niño con los errores que cometen otras personas. De esta manera, pueden ver que alguien escribe 200304 en lugar de 234 porque escriben los números como suenan. Normalmente resulta más fácil aprender del error cuando lo cometen otros. 
"

elsif @test.edad.between?(84, 89) && @test.pf_conv < 5 then
  @i = "El/la estudiante se encuentra en proceso de adquirir las habilidades de lectura y escritura de acuerdo a lo esperado para la edad que posee.
Algunas recomendaciones para apoyar al estudiante:


* Ofrecer al niño varios juegos que le proporcionen práctica con la lectura de números. Primero se le debe incentivar a que lean números de un dígito (por ejemplo, en un libro o cuaderno), pero una vez dominado esto se le debe enseñar las reglas para leer números de 2 dígitos. El niño debe saber que la posición es crucial: los números que indican las unidades están a la derecha, los números que indican las decenas están a su izquierda. Así, en 18, el 1 de la izquierda indica “diez” y el 8 de la derecha indica “ocho”. 
"


# 90 a 101

elsif @test.edad.between?(90, 101) && @test.pf_conv > 5 then
  @i= "El/la estudiante ha adquirido las habilidades de lectura y escritura de cantidades de acuerdo a lo esperado para su edad.
Algunas recomendaciones para mejorar lo aprendido:


* Ofrecer al niño varios juegos que le proporcionen práctica con la lectura de números. Primero se le debe incentivar a que lean números de un dígito (por ejemplo, en un libro o cuaderno), pero una vez dominado esto se le debe enseñar las reglas para leer números de 2 dígitos. El niño debe saber que la posición es crucial: los números que indican las unidades están a la derecha, los números que indican las decenas están a su izquierda. Así, en 28, el 2 de la izquierda indica “veinte” y el 8 de la derecha indica “ocho”. 

* Pedirle al niño que con 2 dígitos construya el mayor número posible. Por ejemplo, dado el 2 y el 9, el niño puede escribir 29 o 92. 

* Una vez dominada la lectura y escritura de números con 2 dígitos, continuar con la lectura de números de 3 dígitos. El niño debe saber que la posición es crucial: los números que están a la derecha son las unidades, los que indican las decenas están al medio y los números que indican las centenas las que están a la izquierda. Así en 321, el 3 de la izquierda indica “trescientos”, el 2 del medio indica “veinte” y el 1 de la derecha indica “uno”. 

* Enseñar al niño con los errores que cometen otras personas. De esta manera, pueden ver que alguien escribe 200304 en lugar de 234 porque escriben los números como suenan. Normalmente resulta más fácil aprender del error cuando lo cometen otros. 
"

elsif @test.edad.between?(90, 101) && @test.pf_conv < 6 then
  @i = "El/la estudiante se encuentra en proceso de adquirir las habilidades de lectura y escritura de acuerdo a lo esperado para la edad que posee.
Algunas recomendaciones para apoyar al estudiante:


* Ofrecer al niño varios juegos que le proporcionen práctica con la lectura de números. Primero se le debe incentivar a que lean números de un dígito (por ejemplo, en un libro o cuaderno), pero una vez dominado esto se le debe enseñar las reglas para leer números de 2 dígitos. El niño debe saber que la posición es crucial: los números que indican las unidades están a la derecha, los números que indican las decenas están a su izquierda. Así, en 18, el 1 de la izquierda indica “diez” y el 8 de la derecha indica “ocho”. 
"
  
end




# Hechos Numéricos

# 60 a 89

if @test.edad.between?(60, 89) then
  @j= "No se evalúa esta área para el rango de edad de su hijo/a."

# 90 a 101

elsif @test.edad.between?(90, 101) && @test.pf_hecho > 6 then
  @j= "El/la estudiante ha adquirido las habilidades de realizar operaciones sencillas (suma, resta y multiplicación) sin necesidad de realizar el cálculo por encima de lo esperado para la edad que posee.
Algunas recomendaciones para practicar lo aprendido y/o generar nuevos aprendizajes:


* En el caso de las restas como 10 - 3, la mejor técnica de solución es la estrategia de contar hacia atrás, es decir, comenzar en 10 y contar hacia atrás 3. También se le puede presentar al niño actividades para que capte la relación complementaria entre la suma y la resta. Esto puede encontrarse en la tabla de restar. Por ejemplo, si el niño mira la columna que muestra todos los números restados de 10, verá que los resultados van incrementándose en uno, consiguiendo al final la secuencia numérica:
o 10 - 10 = 0
o 10 - 9 = 1
o 10 - 8 = 2
o 10 - 7 = 3
o 10 - 6 = 4
o 10 - 5 = 5, y así sucesivamente. 

* En el caso de las sumas como 8 + 5, la estrategia más común es seguir contando a partir del número mayor (8 + 5 son “ocho, nueve, diez… trece”) o el uso de varios trucos como llegar hasta 10 y después añadir lo que falta contando (“8 + 5 son trece, porque ocho y dos son diez, y después con los tres que quedan son trece”). 

* En el caso de las multiplicaciones como N x 1, el patrón es fácil de ver y lleva al niño a la conclusión de que al multiplicar un número por uno, el resultado es ese mismo número. Esta regla se aplica a todos los números. También es importante darle al niño juegos con material concreto del concepto de multiplicación. Por ejemplo, puede ser útil la analogía de que 3x1 es como tener 3 canicas en una bolsa. Hay en total 3 canicas. La multiplicación 3x2 es como tener dos bolsas de 3 canicas, en total son 6 canicas y así sucesivamente. 

* En el caso de las multiplicaciones como N x 0, se puede utilizar un juego muy sencillo. Se trata de que el niño no meta nada en una bolsa, por ejemplo un gato de juguete, después debe mirar dentro de ella y asegurarse de que no hay ningún gato. Pedirle, a continuación, que haga lo mismo con otra bolsa y con otra: así se le da la oportunidad de ver, concretamente, que N x 0 es igual a 0.  

* En el caso de las multiplicaciones como 3 x 2, el niño puede descubrir el patrón: 3 x 2 es lo mismo que 3 + 3. Puede aprender que “multiplicar por dos” es lo mismo que sumar el mismo número dos veces o calcular el doble. Esta regla se aplica a todos los números. 
"

elsif @test.edad.between?(90, 101) && @test.pf_hecho.between?(4, 6) then
  @j = "El/la estudiante ha adquirido las habilidades de realizar operaciones sencillas (suma, resta y multiplicación) sin necesidad de realizar el cálculo  de acuerdo a lo esperado para su edad.
Algunas recomendaciones para mejorar lo aprendido:


* En el caso de las sumas, como 3 + 4, la mejor estrategia de pensamiento es simplemente “seguir contando” desde el número mayor (“cuatro, cinco, seis y siete”). Este método les proporciona una estrategia útil para resolver problemas de suma cuando no recuerden los hechos numéricos correspondientes. Animar al niño a no adivinar las sumas en el caso de que no las sepan de memoria, sino animarlo a seguir contando. 

* En el caso de las multiplicaciones, como N x 1, el patrón es fácil de ver y lleva al niño a la conclusión de que al multiplicar un número por uno, el resultado es ese mismo número. Esta regla se aplica a todos los números. También es importante darle al niño juegos con material concreto del concepto de multiplicación. Por ejemplo, puede ser útil la analogía de que 3x1 es como tener 3 canicas en una bolsa. Hay en total 3 canicas. La multiplicación 3x2 es como tener dos bolsas de 3 canicas, en total son 6 canicas y así sucesivamente. 

* En el caso de las multiplicaciones como N x 0, se puede utilizar un juego muy sencillo. Se trata de que el niño no meta nada en una bolsa, por ejemplo un gato de juguete, después debe mirar dentro de ella y asegurarse de que no hay ningún gato. Pedirle, a continuación, que haga lo mismo con otra bolsa y con otra: así se le da la oportunidad de ver, concretamente, que N x 0 es igual a 0.  

* En el caso de las restas del tipo 2N - N, el patrón lleva a la conclusión de que la respuesta es la misma que el número que has quitado. Esta regla, después, se aplica a muchos números: aquellos en que la cantidad que se quita (el sustraendo) es la mitad de la cantidad de partida (minuendo), por ejemplo 6 - 3, 10 - 5, etc. También se le puede enseñar un juego con material concreto, utilizando objetos y una bolsa de plástico. Así, se introduce un número par de objetos en una bolsa, que previamente se ha dividido en dos partes (con una cinta adhesiva de un color, por ejemplo). Al niño se le muestra que el total se forma sumando las dos partes iguales. Además, se puede insistir en la relación inversa: si al total le quitamos una de las partes, nos queda la otra. También se le puede plantear ejercicios del tipo: 
o 2 - 1 = 1   
o 4 - 2 = 2
o 6 - 3 = 3   
o 8 - 4 = 4
o ¿Cuál es el siguiente?
"

elsif @test.edad.between?(90, 101) && @test.pf_hecho < 4 then
  @j = "El/la estudiante se encuentra en proceso de adquirir las habilidades de realizar operaciones sencillas (suma, resta y multiplicación) sin necesidad de realizar el cálculo  de acuerdo a lo esperado para la edad que posee.
Algunas recomendaciones para apoyar al estudiante:

* Enseñar al niño que en hechos numéricos como 2 - 2 (dos menos dos), se puede observar que si se resta un número de sí mismo el resultado es “cero”. El patrón es fácil y esta regla se aplica a todos los números. 

* En el caso de las sumas, como 3 + 4, la mejor estrategia de pensamiento es simplemente “seguir contando” desde el número mayor (“cuatro, cinco, seis y siete”). Este método les proporciona una estrategia útil para resolver problemas de suma cuando no recuerden los hechos numéricos correspondientes. Animar al niño a no adivinar las sumas en el caso de que no las sepan de memoria, sino animarlo a seguir contando. 
"
  
end



# Cálculo FORMAL 

# 60 a 89

if @test.edad.between?(60, 89) then
  @k= "No se evalúa esta área para el rango de edad de su hijo/a."


# 90 a 95

elsif @test.edad.between?(90, 95) && @test.pi_comp > 5 then
  @k= "El/la estudiante ha adquirido las habilidades de cálculo formal por encima de lo esperado para la edad que posee.
Algunas recomendaciones para practicar lo aprendido y/o generar nuevos aprendizajes:


* Ofrecer diferentes experiencias con el sistema decimal, puede hacer uso también de material concreto. Recordar que el sistema decimal es básico en la aritmética elemental pues es la base de la escritura de los números.

* Si el niño presenta dificultades con el algoritmo de la resta escrita con “llevadas” es importante trabajar con materiales concretos (como el material multibase o regletas de Cuissinaire) con el fin de desarrollar una comprensión básica del método estándar. 

* Inventar problemas retadores con los niños de tal manera que se necesite hacer cálculos de suma o resta de forma escrita para resolverlos.
"

elsif @test.edad.between?(90, 95) && @test.pi_comp.between?(2, 5) then
  @k = "El/la estudiante ha adquirido las habilidades de cálculo formal de acuerdo a lo esperado para su edad.
Algunas recomendaciones para mejorar lo aprendido:


* Fomentar la comprensión del valor posicional, el estudiante necesita aprender por qué los números han de ser alineados, para operar desde la derecha. Es recomendable enseñar el algoritmo estándar mediante actividades manipulativas.

* Fomentar la comprensión del método, y no solo abordar de forma mecánica la resolución de la cuenta con la simple aplicación del algoritmo. Preguntar al niño cómo está realizando sus operaciones y por qué lo hace de esa forma.

* Ofrecer diferentes experiencias con el sistema decimal mediante el trabajo con material concreto. Recordar que el sistema decimal es básico en la aritmética elemental pues es la base de la escritura de los números.

* Inventar problemas con los niños de tal manera que se necesite hacer cálculos de suma o resta de forma escrita para resolverlos.
"

elsif @test.edad.between?(90, 95) && @test.pi_comp < 2 then
  @k = "El/la estudiante se encuentra en proceso de adquirir las habilidades cálculo formal  de acuerdo a lo esperado para la edad que posee.
Algunas recomendaciones para apoyar al estudiante:


* Fomentar la comprensión del valor posicional, el estudiante necesita aprender por qué los números han de ser alineados, para operar desde la derecha. Es recomendable enseñar el algoritmo estándar mediante actividades manipulativas.

* Emplear juegos con material concreto para enseñar la suma y resta de 10 desde una decena. Se pueden usar cubitos (o palitos) unidos para formar las decenas y luego sumar o restar decenas con estos materiales.

* Inventar problemas sencillos con los niños de tal manera que se necesite hacer cálculos de suma o resta de forma escrita para resolverlos.
"


# 96 a 101

elsif @test.edad.between?(96, 101) && @test.pi_comp > 7 then
  @k= "El/la estudiante ha adquirido las habilidades de cálculo formal por encima de lo esperado para la edad que posee.
Algunas recomendaciones para practicar lo aprendido y/o generar nuevos aprendizajes:


* Ofrecer diferentes experiencias con el sistema decimal, puede hacer uso también de material concreto. Recordar que el sistema decimal es básico en la aritmética elemental pues es la base de la escritura de los números.

* Si el niño presenta dificultades con el algoritmo de la resta escrita con “llevadas” es importante trabajar con materiales concretos (como el material multibase o regletas de Cuissinaire) con el fin de desarrollar una comprensión básica del método estándar. 

* Inventar problemas retadores con los niños de tal manera que se necesite hacer cálculos de suma o resta de forma escrita para resolverlos.
"

elsif @test.edad.between?(96, 101) && @test.pi_comp.between?(5, 7) then
  @k = "El/la estudiante ha adquirido las habilidades de cálculo formal de acuerdo a lo esperado para su edad.
Algunas recomendaciones para mejorar lo aprendido:


* Fomentar la comprensión del valor posicional, el estudiante necesita aprender por qué los números han de ser alineados, para operar desde la derecha. Es recomendable enseñar el algoritmo estándar mediante actividades manipulativas.

* Fomentar la comprensión del método, y no solo abordar de forma mecánica la resolución de la cuenta con la simple aplicación del algoritmo. Preguntar al niño cómo está realizando sus operaciones y por qué lo hace de esa forma.

* Ofrecer diferentes experiencias con el sistema decimal mediante el trabajo con material concreto. Recordar que el sistema decimal es básico en la aritmética elemental pues es la base de la escritura de los números.

* Inventar problemas con los niños de tal manera que se necesite hacer cálculos de suma o resta de forma escrita para resolverlos.
"

elsif @test.edad.between?(96, 101) && @test.pi_comp < 5 then
  @k = "El/la estudiante se encuentra en proceso de adquirir las habilidades cálculo formal  de acuerdo a lo esperado para la edad que posee.
Algunas recomendaciones para apoyar al estudiante:


* Fomentar la comprensión del valor posicional, el estudiante necesita aprender por qué los números han de ser alineados, para operar desde la derecha. Es recomendable enseñar el algoritmo estándar mediante actividades manipulativas.

* Emplear juegos con material concreto para enseñar la suma y resta de 10 desde una decena. Se pueden usar cubitos (o palitos) unidos para formar las decenas y luego sumar o restar decenas con estos materiales.

* Inventar problemas sencillos con los niños de tal manera que se necesite hacer cálculos de suma o resta de forma escrita para resolverlos.
"
  
end
        
  end

  # GET /tests/new
  def new
    @test = Test.new
  end

  # GET /tests/1/edit
  def edit
  end

  # POST /tests
  # POST /tests.json
  def create
    @test = Test.new(test_params)

    respond_to do |format|
      if @test.save
        format.html { redirect_to @test, notice: 'Test was successfully created.' }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1
  # PATCH/PUT /tests/1.json
  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to root_path, notice: 'Test was successfully updated.' }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    @test.destroy
    respond_to do |format|
      format.html { redirect_to tests_url, notice: 'Test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_params
      params.require(:test).permit(:nombre, :colegio, :nivel, :seccion, :edad, :ic, :icm, :pi_num, :pi_comp, :pi_cal, :pi_conc, :pf_conv, :pf_hecho, :pf_calc, :pf_conce)
    end
end
