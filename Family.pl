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

grandPa(Grandpa, Grandson) :- gerou(Parent, Grandson), gerou(Grandpa, Parent),macho(Grandpa), !.
grandMa(Grandma, Grandson) :- gerou(Parent, Grandson), gerou(Grandma, Parent), femea(Grandma), !.

%tio(Uncle, Nephew) :- grandPa(Grand, Nephew); grandMa(Grand, Nephew), filho(Uncle, Grand), gerou(Parent, Nephew), not(Parent == Uncle).
tio(Uncle, Nephew) :- gerou(Parent, Nephew), gerou(Grand, Parent), filho(Uncle, Grand), not(pai(Nephew, Uncle)).
tia(Aunt, Nephew) :- gerou(Parent, Nephew), gerou(Grand, Parent), filha(Aunt, Grand), not(mae(Nephew, Aunt)).

primo(Cousin, Person):- (tio(Unclx, Person); tia(Unclx, Person)), filho(Cousin,Unclx).
primo(Cousin, Person):- (tio(Unclx, Person); tia(Unclx, Person)), filho(Cousin,Unclx).
