classe(Numero, positivo) :- Numero > 0,!. 
classe(0, zero):- !. 
classe(Numero, negativo) :- Numero < 0.
