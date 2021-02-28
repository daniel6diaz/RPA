(define (problem problemaambulancia) 
(:domain dominioambulancia)
(:objects 
    ambulancia1 - ambulancia
    paciente1 paciente2 paciente3 - paciente
    l1 l2 l3 l4 - localizacion
)
(:init
    (vacia ambulancia1)
    (enamb ambulancia1 l1)
    (enloc paciente1 l4)
    (enloc paciente2 l3)
    (enloc paciente3 l3)
    (camino l1 l2)
    (camino l2 l1)
    (camino l2 l4)
    (camino l4 l2)
    (camino l4 l3)
    (camino l3 l4)
)
(:goal 
(and
    (enloc paciente1 l1)
    (enloc paciente2 l1)
    (enloc paciente3 l1)
)
)
)
