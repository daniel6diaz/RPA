(define (domain dominioambulancia)
(:requirements :strips :typing :negative-preconditions)
(:types 
    ambulancia paciente localizacion - object
)
(:predicates 
    (camino ?locOrigen - localizacion ?locDestino - localizacion)
    (enloc ?pct - paciente ?loc - localizacion)
    (enamb ?amb - ambulancia ?loc - localizacion)
    (dentroambulancia ?pct - paciente)
    (descargado ?pct - paciente)
    (vacia ?amb - ambulancia)
)
(:action subirpaciente
    :parameters (?amb - ambulancia ?pct - paciente ?loc - localizacion)
    :precondition 
    (and 
        (descargado ?pct)
        (vacia ?amb)
        (enloc ?pct ?loc)
        (enamb ?amb ?loc)
    )
    :effect 
    (and 
        (not (descargado ?pct))
        (not (vacia ?amb))
        (not(enloc ?pct ?loc))
        (dentroambulancia ?pct)  
    )
)

(:action bajarpaciente
    :parameters (?amb - ambulancia ?pct - paciente ?loc - localizacion)
    :precondition 
    (and 
        (dentroambulancia ?pct)
        (enamb ?amb ?loc)
    )
    :effect 
    (and 
        (vacia ?amb)
        (descargado ?pct)
        (enloc ?pct ?loc)
        (not(dentroambulancia ?pct))    
    )
)

(:action conducir
    :parameters (?amb - ambulancia ?locOrigen - localizacion ?locDestino - localizacion)
    :precondition 
    (and 
        (enamb ?amb ?locOrigen)
        (camino ?locOrigen ?locDestino)
    )
    :effect 
    (and 
        (not (enamb ?amb ?locOrigen))
        (enamb ?amb ?locDestino)
    )
)

)