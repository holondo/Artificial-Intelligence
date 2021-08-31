%mae(child, mother).
mae(eva, ana).
mae(noe, eva).
mae(rai, bia).
mae(clo, bia).
mae(ary, bia).
mae(gal, lia).

%pai(child, father).
pai(eva, ivo).
pai(noe, rai).
pai(rai,gil).
pai(clo,gil).
pai(ary,gil).
pai(gal,ary).

macho(ivo).
macho(rai).
macho(noe).
macho(gil).
macho(ary).

femea(ana).
femea(eva).
femea(bia).
femea(clo).
femea(lia).
femea(gal).

%gerou(parent, child).
gerou(X,Y) :- mae(Y,X) ; pai(Y,X).

filho(Child, Parent) :- macho(Child), gerou(Parent, Child).
filha(Child, Parent) :- femea(Child), gerou(Parent, Child).

tio(Uncle, Nephew) :- macho(Uncle), !, gerou(Grand, Uncle), gerou(Parent, Nephew), gerou(Grand, Parent), not(Uncle == Parent) . 
tia(Aunt, Nephew) :- femea(Aunt), !, gerou(Grand, Aunt), gerou(Parent, Nephew), gerou(Grand, Parent), not(Aunt == Parent). 
